const question=document.getElementById('txtremoveQuestion')
const removebtn=document.getElementById("btnDelete")
removebtn.addEventListener('click', e => {
    e.preventDefault();
    axios({
        method: 'delete',
        url: '/remove',
        data: {
            Question: question.value
        }
    });
});