
let naira = "\u20A6";
var slider = document.getElementById("myRange");
var output = document.getElementById("demo");
output.innerHTML = naira + slider.value;





// Btn Active control
var navbar = document.getElementById("category-btn");
var link = document.getElementsByClassName("bt_n");
for (var i = 0; i < link.length; i++) {
  link[i].addEventListener("click", function () {
    var currentLink = document.getElementsByClassName("select");
    currentLink[0].className = currentLink[0].className.replace(" select", "");
    this.className += " select";
  });
}

// Search Engine
const search = document.getElementById('search');
const maxAmount = document.getElementById('maxamount');
const btns = document.querySelectorAll(".bt_n");
const products = document.querySelectorAll(".product__item");

// filter by btn
for(i=0; i<btns.length; i++){
    btns[i].addEventListener('click', (e)=>{
        e.preventDefault();

        const filter = e.target.dataset.filter;
        products.forEach((product)=>{
            if(filter =="all"){
                product.style.display = "";
            }else{
                if(product.classList.contains(filter)){
                    product.style.display = "";
                   
                }else{
                    product.style.display = "none";
                }
            }
        })
    })
}



// filter search by name
const productList = document.getElementById("product-lists");
const productName = productList.getElementsByTagName("h6");
const productCategory = productList.getElementsByTagName("h5");

search.addEventListener('keyup', (e)=>{

    const searchValue = search.value.toLowerCase().trim();
    for(var i = 0; i<productName.length; i++){
        let match = products[i].getElementsByTagName("h6")[0];

        if(match){
            let textValue = match.textContent || match.innerHTML;

            if(textValue.toLowerCase().indexOf(searchValue)> -1){
                products[i].style.display = "";
            }else{
                products[i].style.display = "none";
            }
        }else{
            products[i].style.display = "none";
        }
    }
})

// filter search by price
slider.oninput = function() {
  output.innerHTML = naira + this.value;
  const searchValue = slider.value.toLowerCase().trim();
    for(var i = 0; i<productCategory.length; i++){
        let match = products[i].getElementsByTagName("h5")[0];

        if(match){
            let textValue = match.textContent || match.innerHTML;

            if(textValue.toLowerCase().indexOf(searchValue)> -1){
                products[i].style.display = "";
            }else{
                products[i].style.display = "none";
            }
        }else{
            products[i].style.display = "";
        }
    }
}



