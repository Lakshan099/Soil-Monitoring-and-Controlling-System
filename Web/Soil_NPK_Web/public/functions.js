const Email = document.getElementById('Email');
const Name = document.getElementById('Name');
const Password = document.getElementById('Password');
const ComPassword = document.getElementById('ComPassword');
const Telephone = document.getElementById('Telephone');
const Address = document.getElementById('Address');
const addBtn = document.getElementById('addBtn');
const updateBtn = document.getElementById('updateBtn');
const readBtn = document.getElementById('readBtn');
const removeBtn = document.getElementById('removeBtn');

addBtn.addEventListener('click', e => {
    e.preventDefault();
    axios({
        method: 'post',
        url: '/add',
        data: {
            Email: Email.value,
            Name: Name.value,
            Password: Password.value,
            ComPassword: ComPassword.value,
            Telephone: Number(Telephone.value),
            Address: Address.value
        }
    });
});

updateBtn.addEventListener('click', e => {
    e.preventDefault();
    axios({
        method: 'put',
        url: '/update',
        data: {
            Email: Email.value,
            Name: Name.value,
            Password: Password.value,
            ComPassword: ComPassword.value,
            Telephone: Number(Telephone.value),
            Address: Address.value
        }
    });
});

removeBtn.addEventListener('click', e => {
    e.preventDefault();
    axios({
        method: 'delete',
        url: '/remove',
        data: {
            Email: Email.value
        }
    });
});

readBtn.addEventListener('click', e => {
    e.preventDefault();
    axios({
        method: 'post',
        url: '/data',
        data: {
            Email: Email.value
        }
    });
});