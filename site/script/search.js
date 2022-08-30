$(document).ready(function(){
    const xmlhttp = new XMLHttpRequest();
    const nomefilm = window.location.pathname.split("/").pop();

    $('#searched').text(`Risultati trovati per: '${nomefilm}'`)

    xmlhttp.onload = function() {
        const myObj = JSON.parse(this.responseText);
        const films = myObj['data'];
        films.forEach(film => {
            $('#film').append(`<a href='/film/${film['nome']}'>
            <div id="${film['nome']}" class="flex gap-12 bg-blue-800 rounded transform transition duration-500 hover:scale-105">
                <img class="w-24 h-24 object-cover" src="http://localhost:3000/api/film/img/${film['locandina']}">
                <h2 class="text-2xl self-center">${film['nome']}</h2>
            </div></a>
            `)
        });
    }

    xmlhttp.open("GET", `/api/film/search/${nomefilm}`);
    xmlhttp.send();
})
