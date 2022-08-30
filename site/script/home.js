$(document).ready(function(){
    if(getCookie('id') == null){
        $('#auth').text('login')
        $('#auth').attr('onclick', 'toLogin()')
        $('#dropdown').hide()
        $('#auth > svg').remove()
    }else{
        $('#auth').text(getCookie('name'))
        $('#auth').append(`<svg class="ml-2 w-4 h-4" aria-hidden="true" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path></svg>`)
    }

    const xmlhttp = new XMLHttpRequest();
  
    xmlhttp.onload = function() {
        const myObj = JSON.parse(this.responseText);
        console.log(myObj);
        
        for (let i = 0; i < Object.keys(myObj).length; i++) {
            $('#film').append(`<a href="/film/${myObj[i].nomefilm}"><img class="h-70 w-56" src="http://localhost:3000/api/film/img/${myObj[i].locandina}" alt="sono tornato""></a>`);
        }
        
    }
    xmlhttp.open("GET", "/api/palinsesto");
    xmlhttp.send();
})

$("#logout").click(function(){
    deleteAllCookies();
})

$('#search').keypress(function(event){
    var keycode = (event.keyCode ? event.keyCode : event.which);
    const text = $('#search').val()

    if(keycode == '13'){
      window.location.href = `http://localhost:3000/search/${text}` 
    }
  });

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

function toLogin(){
    window.location.href = '/login'
}
