const UOQuestion = document.getElementById('txtoldQuestion');
const UQuestion = document.getElementById('txtnewaddQuestion');
const UAnswer = document.getElementById('txtnewaddAnswer');

const updateBtn=document.getElementById("btnUpdate");
updateBtn.addEventListener('click', e => {
    e.preventDefault();
    axios({
        method: 'put',
        url: '/updatefaq',
        data: {
            OQuestion: UOQuestion.value,
            Question: UQuestion.value,
            Answer: UAnswer.value
        }
    });
});