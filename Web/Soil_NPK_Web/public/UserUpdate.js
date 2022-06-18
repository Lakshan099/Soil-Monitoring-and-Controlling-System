const email = document.getElementById('txtemail');
const newName = document.getElementById('txtnewName');
const newAddress = document.getElementById('txtnewAddress');
const newTelephone = document.getElementById('txtnewTelephone');

const updateBtn=document.getElementById("btnUpdate");
updateBtn.addEventListener('click', e => {
    e.preventDefault();
    axios({
        method: 'put',
        url: '/updateuser',
        data: {
            email: email.value,
            newName: newName.value,
            newAddress: newAddress.value,
            newTelephone: newTelephone.value
        }
    });
});