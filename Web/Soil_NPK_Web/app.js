const express = require('express');
const app = express();
const port = 3000;
const admin = require('firebase-admin');


var serviceAccount = require("C:/Users/acer/Desktop/PPA project/PPA(Web application)/1Soil_NPK_Web(new)/Soil_NPK_Web/soil-monitoring-system-e4988-firebase-adminsdk-3mu5m-76bd07c44f.json");

/*admin.initializeApp({
    credential: admin.credential.cert(serviceAccount),
    databaseURL: "https://soil-monitoring-system-e4988-default-rtdb.firebaseio.com"
});*/

admin.initializeApp({
    credential: admin.credential.applicationDefault(),
    databaseURL: "https://soil-monitoring-system-e4988-default-rtdb.firebaseio.com"
});

const database = admin.firestore();
const usersCollection = database.collection('Admin');
const usersCollection2 = database.collection('FAQ');
const usersCollection3 = database.collection('Massage');
const usersCollection4 = database.collection("User");
const usersCollection5 = database.collection("Q&A");
const usersCollection6 = database.collection("History");
app.listen(3000);
app.use(express.json());
app.use(express.static('public'));


app.get('/', (req, res) => {
    res.send('login');
});
app.get('/', (req, res) => {
    res.send('Massage');
});
app.get('/', (req, res) => {
    res.send('AddFAQ');
});
app.get('/', (req, res) => {
    res.send('EditUser');
});
app.get('/', (req, res) => {
    res.send('addReply');
});


app.post('/data', (req, res) => {
    var username = req.body.AdminID
    var password = req.body.password
    usersCollection.get()
        .then((sanpshot) => {
            sanpshot.docs.forEach(doc => {
                if (username.localeCompare(doc.data().AdminID) == 0 && password.localeCompare(doc.data().Password) == 0) {
                    window.location.href = "/" // nedd to find window property

                }

            })
        })
        .catch(error => {
            console.error(error);
        });
});

//Add message
app.post('/addMassage', (req, res) => {
    const d = new Date()
    let day = d.toString()
    usersCollection3.doc(req.body.message).set({
        Massage: req.body.message,
        Sender: "Admin",
        date: day
    })
        .then(() => {
            console.log('Message has been added successfully !');
        })
        .catch(error => {
            console.error(error);
        })
});

//Add questions
app.post('/addQuestion', (req, res) => {
    usersCollection2.doc(req.body.Question).set({
        Question: req.body.Question,
        Answer: req.body.Answer,
    })
        .then(() => {
            console.log('Question has been added successfully !');
        })
        .catch(error => {
            console.error(error);
        })
});
app.get('/FAQ', (req, res) => {
    var answer;
    var question = "";
    usersCollection2.get()
        .then((sanpshot) => {
            sanpshot.docs.forEach(doc => {
                question = question + `<b>Question</b>: ` + doc.data().Question + `<br><br>` + doc.data().Answer + `<br><br><br>`;
            }

            )
            //console.log(question);
            res.json({ title: question });
        })
        .catch(error => {
            console.error(error);
        });
    //res.sendFile(__dirname +"/FAQ.html",);

})
app.get('/render', (req, res) => {
    res.sendFile(__dirname + "/FAQ.html");
})

app.get('/user', (req, res) => {
    var question = `<table class="t2" width="1060" height="346" border="1">
    <tbody>
      <tr class="tr1">
        <td height="66">Email</td>
        <td>Name</td>
        <td>Telephone</td>
        <td>Address</td>
      </tr>  `;
    usersCollection4.get()
        .then((sanpshot) => {
            sanpshot.docs.forEach(doc => {
                question = question +
                    `<tr class="tr2"><td> ` + doc.data().Email + `</td><td>` + doc.data().Name + `</td><td>` + doc.data().Telephone + `</td><td>` + doc.data().Address + `</td></tr>`;
            }

            )
            //console.log(question);
            res.json({ title: question });
        })
        .catch(error => {
            console.error(error);
        });
    //res.sendFile(__dirname +"/FAQ.html",);

})
app.get('/render', (req, res) => {
    res.sendFile(__dirname + "/user.html");
})

app.put('/updatefaq', (req, res) => {
    var OQuestion = req.body.OQuestion
    var Question = req.body.Question
    var Answer = req.body.Answer
    usersCollection2.get()
        .then((sanpshot) => {
            sanpshot.docs.forEach(doc => {
                if (OQuestion.localeCompare(doc.data().Question) == 0) {
                    if (Question.localeCompare("") == 0)
                        usersCollection2.doc(OQuestion).update({
                            Answer: Answer
                        })
                }


                else if (Answer.localeCompare("") == 0) {
                    usersCollection2.doc(OQuestion).update({
                        Question: Question
                    });


                }
                else if (Answer.localeCompare("") != 0 && Question.localeCompare("") != 0) {
                    usersCollection2.doc(OQuestion).update({
                        Question: Question,
                        Answer: Answer
                    });
                }


            })
        })
        .catch(error => {
            console.error(error);
        });
});

app.put('/updateuser', (req, res) => {
    var email = req.body.email
    var newName = req.body.newName
    var newAddress = req.body.newAddress
    var newTelephone = req.body.newTelephone
    usersCollection4.get()
        .then((sanpshot) => {
            sanpshot.docs.forEach(doc => {
                if (email.localeCompare(doc.data().Email) == 0) {
                    if (newAddress.localeCompare("") != 0)
                        usersCollection4.doc(email).update({
                            Address: newAddress
                        })
                }
                if (email.localeCompare(doc.data().Email) == 0) {
                    if (newName.localeCompare("") != 0)
                        usersCollection4.doc(email).update({
                            Name: newName
                        })
                }
                if (email.localeCompare(doc.data().Email) == 0) {
                    if (newTelephone.localeCompare("") != 0)
                        usersCollection4.doc(email).update({
                            Telephone: newTelephone
                        })
                }


            })
        })
        .catch(error => {
            console.error(error);
        });
});

//----------------------------------------need to finalize-----------------------


app.post('/add', (req, res) => {
    usersCollection.doc(req.body.AdminID).set({
        AdminID: req.body.AdminID,
        Password: req.body.Password,
    })
        .then(() => {
            console.log('User has been added successfully !');
        })
        .catch(error => {
            console.error(error);
        })
});




app.delete('/remove', (req, res) => {
    var question = req.body.Question
    console.log(question)
    usersCollection2.doc(question).delete();
});





app.get('/Q&A', (req, res) => {
    var question = `<table class="t2" width="1090" height="305" border="0">
    <tbody>`;
    usersCollection5.get()
        .then((sanpshot) => {
            sanpshot.docs.forEach(doc => {
                question = question +
                    `<tr class="tr1"><td class="td1"> ` + doc.data().QuestionText + `</td></tr><tr class="tr1"><td class="td1">` + doc.data().AnswerText + `<hr>`;
            }

            )
            //console.log(question);
            res.json({ title: question });
        })
        .catch(error => {
            console.error(error);
        });
    //res.sendFile(__dirname +"/FAQ.html",);

})
app.get('/render', (req, res) => {
    res.sendFile(__dirname + "/user.html");
})
app.delete('/removeUser', (req, res) => {
    var Email = req.body.Email
    usersCollection4.doc(Email).delete();
});

app.put('/addReply', (req, res) => {
  const d = new Date()
    let day = d.toString()
    var Question = req.body.Question
    var Answer = req.body.Answer
    usersCollection5.get()
        .then((sanpshot) => {
            sanpshot.docs.forEach(doc => {
                if (Question.localeCompare(doc.data().QuestionText) == 0) {
                       usersCollection5.doc(Question).update({
                           AnswerText: Answer,
                           date:day
                       })
               }

          })
        })
       .catch(error => {
           console.error(error);
       });
});




//---------------------------------------------------------
app.get('/Homepage', (req, res) => {
    var count=0;
    usersCollection4.get()
        .then((sanpshot) => {
            sanpshot.docs.forEach(doc => {
               count++; }

            )
            //console.log(question);
            res.json({ title: count });
        })
        .catch(error => {
            console.error(error);
        });
    //res.sendFile(__dirname +"/FAQ.html",);

})
app.get('/render', (req, res) => {
    res.sendFile(__dirname + "/Homepage.html");
})


app.get('/newmap', (req, res) => {
    var lat=" ";
    var lon;
    usersCollection6.get()
        .then((sanpshot) => {
            sanpshot.docs.forEach(doc => {
               lat=doc.data().lat;
                lon=doc.data().lon}

            )
            //console.log(question);
            res.json({ title: lat,long:lon });
        })
        .catch(error => {
            console.error(error);
        });
    //res.sendFile(__dirname +"/FAQ.html",);

})
app.get('/render', (req, res) => {
    res.sendFile(__dirname + "/newmap.html");
})
