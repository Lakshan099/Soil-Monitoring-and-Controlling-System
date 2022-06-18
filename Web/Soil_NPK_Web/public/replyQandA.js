const Question = document.getElementById('txtquestion');
const reply = document.getElementById('txtreply');
const Replybtn=document.getElementById('btnReply');

Replybtn.addEventListener('click', e => {
    e.preventDefault();
    axios({
        method: 'put',
        url: '/addReply',
        data: {
            Question: Question.value,
            Answer: reply.value,
        }
    });
});