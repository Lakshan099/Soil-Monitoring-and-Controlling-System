var username=document.getElementById("txtuname");
var password=document.getElementById("txtpassword");
var btnsubmit=document.getElementById("btnsubmit");


btnsubmit.addEventListener('click', e => {
    e.preventDefault();
    axios({
        method: 'post',
        url: '/data',
        data: {
            AdminID: username.value,
            password:password.value
        }
    });
});
