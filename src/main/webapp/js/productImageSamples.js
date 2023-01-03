
function productImage1(){
	document.getElementById("image1").click();
}

function productImage2(){
	document.getElementById("image2").click();
}

function productImage3(){
	document.getElementById("image3").click();
}

function loadFile1(event) {
    var output = document.getElementById('output1');
    output.src = URL.createObjectURL(event.target.files[0]);
    output.onload = function() {
    URL.revokeObjectURL(output.src) // free memory
   }
}

function loadFile2(event) {
    var output = document.getElementById('output2');
    output.src = URL.createObjectURL(event.target.files[0]);
    output.onload = function() {
    URL.revokeObjectURL(output.src) // free memory
   }
}

function loadFile3(event) {
    var output = document.getElementById('output3');
    output.src = URL.createObjectURL(event.target.files[0]);
    output.onload = function() {
    URL.revokeObjectURL(output.src) // free memory
   }
}

   