$(document).ready(function(){

    const nomefilm = window.location.pathname.split("/").pop();
    const xmlhttp = new XMLHttpRequest();
  
    xmlhttp.onload = function() {
        const myObj = JSON.parse(this.responseText);
        const film = myObj['film']
        const spettacoli = myObj['spettacoli']
        console.log(myObj)
        console.log(`Film: ${film}, spettacoli: ${spettacoli}`);
        
        let titolo = film['nome'].charAt(0).toUpperCase() + film['nome'].slice(1)

        $('#locandina').append(`<img src="http://localhost:3000/api/film/img/${film['locandina']}">`)
        $('#trama').text(film['trama'])
        $('#trama').append(`<a class="text-white cursor-pointer hover:text-blue-300"> [...]</a>`)
        $('#titolo').text(titolo)
        $('#trailer').attr('src', `${film['trailer']}`)

        spettacoli.forEach(spettacolo => {
            $('#spettacoli').append(`
            <tr>
                <td class="border border-slate-500 p-2">${spettacolo['codicesala']}</td>
                <td class="border border-slate-500 p-2">${timeWithSpace(spettacolo['iniziofilm'])}</td>
                <td class="border border-slate-500 p-2">${spettacolo['postidisponibili']}</td>
                <td class="border border-slate-500 p-2 hover:underline cursor-pointer"><button onclick="prenota(${spettacolo['codice']})" class="hover:text-cyan-400 underline">Clicca qui</button></td>
            </tr>
            `)
        });
    }
    xmlhttp.open("GET", `/api/film/${nomefilm}`);
    xmlhttp.send();
})

function timeWithSpace(time){
    time = time.replace('T', ' ')
    time = time.replace('Z', ' ')

    time = time.substring(0, time.length - 5)

    return time
}

function prenota(nomespettacolo){

    const nomefilm = window.location.pathname.split("/").pop();

    const xmlhttp = new XMLHttpRequest()

    xmlhttp.onload = function(){
        const response = JSON.parse(this.responseText);
        if(xmlhttp.status == 200){
            alert(response['message'])
            location.reload()
        }
    }

    xmlhttp.open("GET", `/api/film/${nomefilm}/${nomespettacolo}`);
    xmlhttp.send();
}