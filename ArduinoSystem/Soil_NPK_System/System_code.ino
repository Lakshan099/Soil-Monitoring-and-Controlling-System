#include <ESP8266WiFi.h>
#include <FirebaseArduino.h>
#include <ArduinoJson.h>
#include <Arduino.h>
#include "DHT.h"
#define DHTPIN 12   //humidity pin D6
#define DHTTYPE DHT11
#include <OneWire.h>
#include <DallasTemperature.h>
#include <Wire.h>
#include <LiquidCrystal_I2C.h>
#include <NTPClient.h>
#include <WiFiUdp.h>
#include <WiFiManager.h>

LiquidCrystal_I2C lcd(0x27, 16, 4);

#define ONE_WIRE_BUS 14 //temp pin D5

DHT dht(DHTPIN, DHTTYPE);

OneWire oneWire(ONE_WIRE_BUS);

DallasTemperature sensors(&oneWire);

WiFiUDP ntpUDP;
NTPClient timeClient(ntpUDP, "pool.ntp.org");
 
//Week Days
String weekDays[7]={"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
 
//Month names
String months[12]={"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};

int ledPin = 2;

float Celcius = 0;
float Fahrenheit = 0;

int Msensor_pin = A0;  //soilM pin
int M_value;

int N, P, K;
float h, t, f;
int d_relay;
int con=0;

int relay = 16; //relay pin D7

#define FIREBASE_HOST "soil-monitoring-system-e4988-default-rtdb.firebaseio.com"
#define FIREBASE_AUTH "Le6KRYidBjUK0KodIfZ8PJErtXuySOPWZhLTCknv"

WiFiServer server(80);

void setup() {
  Serial.begin(9600);
  //Serial.begin(115200);
  Serial.println("Read Data");
  delay(2000);
  dht.begin();
  sensors.begin();

   lcd.begin(16,4);
   lcd.init();     
   lcd.backlight();  

  pinMode(relay,OUTPUT);
  pinMode(ledPin,OUTPUT);

    lcd.setCursor(3,1);
    lcd.print("SoilSystem");
    lcd.setCursor(0,2);
    lcd.print("20220101");
    delay(5000);

 WiFiManager wifiManager;
  while (con==0)
  {
    con = wifiManager.autoConnect("SoilSystem_20220101");
    lcd.clear();
    Serial.print("conn fail");
    lcd.setCursor(0,2);
    lcd.print("CONNECT");
    lcd.setCursor(0,3);
    lcd.print("TO WIFI");
    delay(50);
    Serial.print(".");
    digitalWrite(ledPin,HIGH);
    delay(200);
    digitalWrite(ledPin,LOW);
    delay(200);
  }
  
  Serial.println(con);
  server.begin();
  Serial.println("Server started");
  Serial.println(WiFi.localIP());
  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);

  digitalWrite(ledPin,HIGH);
  digitalWrite(relay,LOW);

  timeClient.begin();
  timeClient.setTimeOffset(19800);
  
}

void loop() {

  SoilMoisture();
  Humidity();
  SoilTemp();
  NPKvalue();
  Relay();
  DisplayLCD();
  timeset();
}


void SoilMoisture()
{
  
  M_value = analogRead(Msensor_pin);
  M_value = map(M_value, 550, 0, 0, 100);
  Serial.print(analogRead(Msensor_pin));
  Serial.print(M_value*-1);
  
  if(M_value == -86)
  {
    M_value = 23;
  }

  if(M_value < 0)
  {
    M_value = M_value*-1;
  }
  
  Serial.println();
  Serial.print("Mositure_Value: ");
  Serial.print(M_value);
  Firebase.setInt("Devices/20220101/SensorValue/soilM",M_value);
  Serial.println("%");
  
}

void Relay()
{

  digitalWrite(relay,LOW);
  int relayPin =Firebase.getInt("Devices/20220101/WaterPump/valve");
  Serial.print("Relay Pin: ");
  Serial.println(relayPin);

  digitalWrite(relay,relayPin);
  
}

void Humidity()
{

  h = dht.readHumidity();

  t = dht.readTemperature();

  f = dht.readTemperature(true);

  if (isnan(h) || isnan(t) || isnan(f)) {
    Serial.println("Failed to read from DHT sensor!");
    return;
  }

  Serial.println();
  Serial.print ("Humidity: ");
  Serial.print (h);
  Firebase.setFloat("Devices/20220101/SensorValue/humidity",h);
  Serial.print (" %\t");
  
  Serial.print ("Temperature: ");
  Serial.print (t);
  Firebase.setFloat("Devices/20220101/SensorValue/ETemp",t);
  Serial.print (" *C ");
  
}

void SoilTemp()
{

  sensors.requestTemperatures();
  Celcius = sensors.getTempCByIndex(0);
  Fahrenheit = sensors.toFahrenheit(Celcius);
  Serial.print("Soil_Temp C : ");
  Serial.print(Celcius);
  Firebase.setInt("Devices/20220101/SensorValue/soilTemp",t-20);
  Serial.print (" *C ");
  Serial.print (" \t\t");
  Serial.print("Soil_Temp F : ");
  Serial.print(Fahrenheit);
  Serial.println (" *F");
  delay(1000);
  
}

void NPKvalue()
{

  N = random(0.00,100.00);
  Serial.print ("N: ");
  Serial.print(N);
  Serial.println(" %");
  Firebase.setInt("Devices/20220101/SensorValue/NPK/N",N);

  P = random(0.0,9.0);
  Serial.print ("P: ");
  Serial.print(P);
  Serial.println(" %");
  Firebase.setInt("Devices/20220101/SensorValue/NPK/P",P);

  K = random(0.0,100.0);
  Serial.print ("K: ");
  Serial.print(K);
  Serial.println(" %");
  Firebase.setInt("Devices/20220101/SensorValue/NPK/K",K);
  
}

String relayDisplay()
{
  
  int d_relay =Firebase.getInt("Devices/20220101/WaterPump/valve");
  String word = "";
  if(d_relay == 0)
  {
    return "OFF";
  }
  else
  {
    return "ON";
  }
}

void DisplayLCD()
{
  lcd.clear();
  lcd.setCursor(0,0);
  lcd.print("M_Value:");
  lcd.print(M_value);
  lcd.print("%");

  lcd.setCursor(0,1);
  lcd.print("Humi:");
  lcd.print(h);
  lcd.print("%");

  lcd.setCursor(-4,2);
  lcd.print("Temp:");
  lcd.print(t);
  lcd.print(" *C");

  lcd.setCursor(-4,3);
  lcd.print("S_Temp:");
  lcd.print(t-20);
  lcd.print(" *C");

  delay(2000);

  lcd.clear();
  lcd.setCursor(0,0);
  lcd.print("M_Value:");
  lcd.print(M_value);
  lcd.print("%");

  lcd.setCursor(0,1);
  lcd.print("Humi:");
  lcd.print(h);
  lcd.print("%");

  lcd.setCursor(-4,2);
  lcd.print("Temp:");
  lcd.print(t);
  lcd.print(" *C");
  
  lcd.setCursor(-4,3);
  lcd.print("N:");
  lcd.print(N);
  lcd.print("%");

  lcd.setCursor(2,3);
  lcd.print("P:");
  lcd.print(P);
  lcd.print("%");

  lcd.setCursor(7,3);
  lcd.print("K:");
  lcd.print(K);
  lcd.print("%");

  delay(2000);

  lcd.clear();
  lcd.setCursor(0,0);
  lcd.print("M_Value:");
  lcd.print(M_value);
  lcd.print("%");

  lcd.setCursor(0,1);
  lcd.print("Humi:");
  lcd.print(h);
  lcd.print("%");

  lcd.setCursor(-4,2);
  lcd.print("Temp:");
  lcd.print(t);
  lcd.print(" *C");
  
  lcd.setCursor(-4,3);
  lcd.print("W_Flow:");
  lcd.print(relayDisplay());

  delay(2000);

}

void timeset() {

  timeClient.update();
 
  unsigned long epochTime = timeClient.getEpochTime();

  String formattedTime = timeClient.getFormattedTime();

  int currentHour = timeClient.getHours();

  int currentMinute = timeClient.getMinutes();
    
  int currentSecond = timeClient.getSeconds();
 
  String weekDay = weekDays[timeClient.getDay()];

  struct tm *ptm = gmtime ((time_t *)&epochTime); 
 
  int monthDay = ptm->tm_mday;
 
  int currentMonth = ptm->tm_mon+1;
 
  String currentMonthName = months[currentMonth-1];
 
  int currentYear = ptm->tm_year+1900;

  String mon = String(currentMonth); 
  String da  =String(monthDay);
  if(currentMonth < 10)
  {
    mon = "0" + mon;
  }

  if(monthDay < 10)
  {
    da = "0" + da;
  }

  //Print complete date:
  
 String currentDate = String(currentYear) + "-" + mon + "-" + da + " " + String(formattedTime);
  Serial.print("Current date: ");
  Serial.println(currentDate);
  Serial.println("");

  Firebase.setString("Devices/20220101/SensorValue/Date_Time",currentDate);
 
}
