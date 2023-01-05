
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



// Product Pagination Control

function getPageList(totalPages, page, maxLength){
	function range(start, end){
		return Array.from(Array(end - start + 1), (_, i)=> i + start);
	}
	
	var sideWidth = maxLength < 9 ? 1 : 2;
	var leftWidth = (maxLength - sideWidth * 2 -3) >> 1;
	var rightWidth = (maxLength - sideWidth * 2 -3) >> 1;
	
	if(totalPages <= maxLength){
		return range(1, totalPages)
	}
	
	if(page <= maxLength - sideWidth - 1 - rightWidth){
		return range(1, maxLength - sideWidth -1).concat(0, range(totalPages - sideWidth + 1, totalPages));
	}
	
	if(page >= totalPages -sideWidth - 1 - rightWidth){
		return range(1, sideWidth).concat(0, range(totalPages - sideWidth - 1 - rightWidth - leftWidth, totalPages));
	}
	
	return range(1, sideWidth).concat(0, range(page - leftWidth, page + rightWidth), 0, range(totalPages - sideWidth + 1, totalPages));
}

$(function(){
	var numberOfItems = $(".products-content .product_items").length;
	var limitPerPage = 6; //How many card items visible per a page
	var totalPages = Math.ceil(numberOfItems / limitPerPage)
	var paginationSize = 5; //How many page elements visible in the pagination
	var currentPage;
	
	
	function showPage(whichPage){
		if(whichPage < 1 || whichPage > totalPages) return false;
		
		currentPage = whichPage;
		
		$(".products-content .product_items").hide().slice((currentPage - 1) * limitPerPage, currentPage * limitPerPage).show();
		
		$(".product_pagination li").slice(1, -1).remove();
		
		getPageList(totalPages, currentPage, paginationSize).forEach(item =>{
			$("<li>").addClass("page-item").addClass(item ? "current-page" : "dots").toggleClass("selected-page", item === currentPage).append($("<a>").addClass("page_link")
			.attr({href: "javascript:void(0)"}).text(item || "...")).insertBefore(".next-page");
		});
		
		$(".previous-page").toggleClass("disable", currentPage ===1);
		$(".next-page").toggleClass("disable", currentPage ===totalPages);
		
		return true;
	}
	
	$(".product_pagination").append(
		$("<li>").addClass("page-item").addClass("previous-page").append($("<a>").addClass("page_link").attr({
			href: "javascript:void(0)"}).text("").addClass("fa fa-long-arrow-left")),
		$("<li>").addClass("page-item").addClass("next-page").append($("<a>").addClass("page_link").attr({
			href: "javascript:void(0)"}).text("").addClass("fa fa-long-arrow-right"))
	);
	
	$(".products-content").show();
	showPage(1);
	
	$(document).on("click", ".product_pagination li.current-page:not(.selected-page)", function(){
		return showPage(+$(this).text());
	});
	
	$(".next-page").on("click", function(){
		return showPage(currentPage + 1);
	});
	
	$(".previous-page").on("click", function(){
		return showPage(currentPage - 1);
	});
});

