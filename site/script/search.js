$(document).ready(function(){
    const xmlhttp = new XMLHttpRequest();
    const nomefilm = window.location.pathname.split("/").pop();

    $('#searched').text(`Risultati trovati per: '${nomefilm}'`)

    xmlhttp.onload = function() {
        const myObj = JSON.parse(this.responseText);
        const films = myObj['data'];
        films.forEach(film => {
            fetch(`http://localhost:3000/api/film/spettacoli/getDate/${film['nome']}`)
            .then(result => result.json())
            .then(json => {
                var data = ''
                if(Object.entries(json).length === 0){
                    data = 'non ci sono spettacoli'
                }else{
                    json.forEach((element, key) => {
                        if (Object.is(json.length - 1, key)) {
                            data += `${element['day']}/${element['month']} ... `
                        }else{
                            data += `${element['day']}/${element['month']} - `
                        }
                        console.log(data);
                    });
                    
                }

                $('#film').append(`
                <a href='/film/${film['nome']}'>
                <div id="${film['nome']}" class="overflow-hidden flex gap-12 bg-blue-800 rounded-xl transform transition duration-500 hover:scale-105">
                    <img class="w-24 h-24 object-cover" src="http://localhost:3000/api/film/img/${film['locandina']}">
                    <div class="self-center flex justify-between w-full p-6">
                        <h2 class="text-2xl">${film['nome']}</h2>
                        <h2 class="text-2xl">${data}</h2>
                    </div> 
                </div>
                </a>
            `)
            })
        });
    }

    xmlhttp.open("GET", `/api/film/search/${nomefilm}`);
    xmlhttp.send();
})

function appendFilm(film, data){

}
