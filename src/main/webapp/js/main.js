let button = document.getElementById("change");
button.addEventListener('click', ()=>{document.getElementById('change_dialog').showModal()});

let close_button = document.getElementById("close_dialog");
close_button.addEventListener('click', ()=>{document.getElementById('change_dialog').close()})