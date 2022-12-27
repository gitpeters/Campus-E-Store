/**
 * 
 */
 
 
let switchCtn = document.querySelector("#switch-cnt");
let switch1 = document.querySelector("#switch-c1");
let switch2 = document.querySelector("#switch-c2");
let switchCircle = document.querySelectorAll(".switch_circle");
let switchBtn = document.querySelectorAll(".switch-btn");
let aContainer = document.querySelector("#a-container");
let bContainer = document.querySelector("#b-container");
let allButtons = document.querySelectorAll(".submit");

let getButtons = (e) => e.preventDefault();

let changeForm = (e) => {
  switchCtn.classList.add("is-gx");
  setTimeout(function () {
    switchCtn.classList.remove("is-gx");
  }, 1500);

  switchCtn.classList.toggle("is-txr");
  switchCircle[0].classList.toggle("is-txr");
  switchCircle[1].classList.toggle("is-txr");

  switch1.classList.toggle("is-hidden");
  switch2.classList.toggle("is-hidden");
  aContainer.classList.toggle("is-txl");
  bContainer.classList.toggle("is-txl");
  bContainer.classList.toggle("is-z200");
};

let mainF = (e) => {
  for (var i = 0; i < allButtons.length; i++) {
    // allButtons[i].addEventListener("click", getButtons);
    for (var i = 0; i < switchBtn.length; i++)
      switchBtn[i].addEventListener("click", changeForm);
  }
};

    
window.addEventListener("load", mainF);


/*------------------
        Preloader
    --------------------*/
    $(window).on('load', function () {
      $(".loader").fadeOut();
      $("#preloder").delay(200).fadeOut("slow");
  });
  
  /*------------------
        Login form
    --------------------*/
    
    function signupToggle(){
		var container = document.getElementById("body-container");
		container.classList.toggle("active");
		
		var popup = document.querySelector(".main");
		popup.classList.toggle("active");
	}
  
  
  