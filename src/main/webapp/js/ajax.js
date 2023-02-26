/**
 * 
 */
var searchWrapper = document.querySelector(".search-result-container");
var suggestionBox = searchWrapper.querySelector(".search-result");
var searchValue;

function preventBack() {
	window.history.forward();

}

setTimeout("preventBack()", 0.0);
window.onunload = function() { null };
function search() {
	var searchTerm = document.getElementsByName("searchTerm")[0].value;
	searchValue = searchTerm;
	var xhttp = new XMLHttpRequest();
	var url = "SearchServlet?searchTerm=" + searchTerm;
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			getInfo(this.responseText);
		} else {
			searchWrapper.classList.remove("active");
		}
	};
	try {
		xhttp.open("GET", url, true);
		xhttp.send();
	} catch (e) {
		alert("Unable to connect to server");
	}
}

function getInfo(response) {

	var results = JSON.parse(response);
	results = results.map((data) => {
		return data = '<li><a href="ProductDisplay?productName=' + data + '">' + data + '</a></li>'
	});


	//console.log(results);
	searchWrapper.classList.add("active");
	showSearchResult(results);
	let allList = suggestionBox.querySelectorAll("li");
	for (let i = 0; i < allList.length; i++) {
		//	allList[i].setAttribute("onclick", "select(this)");
	}

}

function select(element) {
	searchInput = document.getElementById("productSearch")
	let selectUserData = element.textContent;
	searchInput.value = selectUserData;
	searchWrapper.classList.remove("active");
	console.log(searchInput.value);
}

function showSearchResult(list) {
	let listData;

	if (!list.length) {
		listData = '<li>' + searchValue + '</li>'
	} else {
		listData = list.join('');
	}

	suggestionBox.innerHTML = listData;
}
