const Email=document.getElementById('txtEmail')
const removebtn=document.getElementById("btnDelete")
removebtn.addEventListener('click', e => {
    axios({
        method: 'delete',
        url: '/removeUser',
        data: {
            Email: Email.value
        }
    });
});
