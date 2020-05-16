// Btn to top of page
let toTopBtn = document.getElementById("toTopBtn");

window.onscroll = function() {scrollBtn()};


function scrollBtn(){
    if(document.body.scrollTop > 20 || document.documentElement.scrollTop > 20){
        toTopBtn.style.display = "block";
    } else {
        toTopBtn.style.display = "none";
    }
};

function toTop() {
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0;
  };

  