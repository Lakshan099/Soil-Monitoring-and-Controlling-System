const Question = document.getElementById('txtaddQuestion');

const Answer = document.getElementById('txtaddAnswer');
const addBtn=document.getElementById('btnsubmit');
const removeBtn=document.getElementById('button3');

addBtn.addEventListener('click', e => {
    axios({
        method: 'post',
        url: '/addQuestion',
        data: {
            Question: Question.value,
            Answer: Answer.value,
        }
    });
});



removeBtn.addEventListener('click', e => {
    e.preventDefault();
    axios({
        method: 'delete',
        url: '/remove',
        data: {
            
        }
    });
});