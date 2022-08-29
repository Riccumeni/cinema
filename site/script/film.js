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
        $('#titolo').text(titolo)
        $('#trailer').attr('src', `${film['trailer']}`)

        spettacoli.forEach(spettacolo => {
            $('#spettacoli').append(`
            <tr>
                <td class="border border-slate-500 p-2">${spettacolo['codicesala']}</td>
                <td class="border border-slate-500 p-2">${timeWithSpace(spettacolo['iniziofilm'])}</td>
                <td class="border border-slate-500 p-2">${spettacolo['postidisponibili']}</td>
                <td class="border border-slate-500 p-2 hover:underline cursor-pointer"><a id="s_${spettacolo['codice']}">Clicca qui</a></td>
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