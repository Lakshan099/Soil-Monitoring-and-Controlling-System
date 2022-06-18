var message=document.getElementById("txtmsg")
var btnsubmit=document.getElementById("button3");


btnsubmit.addEventListener('click', e => {
    e.preventDefault();
    axios({
        method: 'post',
        url: '/addMassage',
        data: {
            message: message.value,
        }
    });
});
