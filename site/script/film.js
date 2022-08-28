$(document).ready(function(){

    const nomefilm = window.location.pathname.split("/").pop();
    const xmlhttp = new XMLHttpRequest();
  
    xmlhttp.onload = function() {
        const myObj = JSON.parse(this.responseText);
        console.log(myObj['film']['locandina']);
        $('#locandina').append(`<img src="http://localhost:3000/api/film/img/${myObj['film']['locandina']}">`)
    }
    xmlhttp.open("GET", `/api/film/${nomefilm}`);
    xmlhttp.send();
})