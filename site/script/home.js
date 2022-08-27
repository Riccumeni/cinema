$(document).ready(function(){
    if(getCookie('id') == null){
        $('#navbar').append('<button id="login" class="text-white w-20 bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-4 py-2.5 text-center inline-flex items-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800" type="button">Login</button>')
        $('#dropdownDefault').remove()
    }else{
        $('#navbar').append(`<button id="dropdownDefault" data-dropdown-toggle="dropdown" class="flex justify-between text-white w-44 bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-4 py-2.5 text-center inline-flex items-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800" type="button">${getCookie('name')}<svg class="ml-2 w-4 h-4" aria-hidden="true" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path></svg></button><div id="dropdown" class="z-10 w-44 bg-white rounded divide-y divide-gray-100 shadow dark:bg-gray-700 block" data-popper-reference-hidden="" data-popper-escaped="" data-popper-placement="bottom" style="position: absolute; inset: 0px auto auto 0px; margin: 0px; transform: translate3d(327px, 70px, 0px);"><ul class="py-1 text-sm text-gray-700 dark:text-gray-200" aria-labelledby="dropdownDefault"><li><a href="#" class="block py-2 px-4 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Logout</a></li></ul></div>`)
        $('#login').remove()
    }

    const xmlhttp = new XMLHttpRequest();
  
    xmlhttp.onload = function() {
        const myObj = JSON.parse(this.responseText);
        console.log(myObj);
        
        for (let i = 0; i < Object.keys(myObj).length; i++) {
            $('#film').append(`<img class="h-70 w-56" src="http://localhost:3000/film/img/${myObj[i].locandina}" alt="sono tornato"">`);
        }
        
    }
    xmlhttp.open("GET", "/programmazione");
    xmlhttp.send();
})

$("#login").click(function(){
    console.log('ciao');
})

function getCookie(name) {
    const value = `; ${document.cookie}`;
    const parts = value.split(`; ${name}=`);
    if (parts.length === 2) return parts.pop().split(';').shift();
}

function deleteAllCookies() {
    var cookies = document.cookie.split(";");

    for (var i = 0; i < cookies.length; i++) {
        var cookie = cookies[i];
        var eqPos = cookie.indexOf("=");
        var name = eqPos > -1 ? cookie.substr(0, eqPos) : cookie;
        document.cookie = name + "=;expires=Thu, 01 Jan 1970 00:00:00 GMT";
    }
}