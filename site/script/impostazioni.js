$(document).ready(function(){
    
    $('#auth').text(getCookie('name'))
    $('#auth').append(`<svg class="ml-2 w-4 h-4" aria-hidden="true" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path></svg>`)
    
})

function getCookie(name) {
    const value = `; ${document.cookie}`;
    const parts = value.split(`; ${name}=`);
    if (parts.length === 2) return parts.pop().split(';').shift();
}

$('#profilo').click(function(){
    $('#container').empty()

    fetch(`http://localhost:3000/users/${getCookie('id')}`, {
        method: 'POST', // or 'PUT'
        headers: {
            'Content-Type': 'application/json',
        },
    }).then((result) => result.json())
    .then((json) => {
        $('#container').append(`
        <div class="flex flex-col gap-4">
        <div class="flex gap-2">
        <h2 class="text-2xl">Nome: </h2>
        <h2 class="text-2xl self-center">${json['nome']}</h2>
        </div>
        <div class="flex gap-2">
        <h2 class="text-2xl">Cognome: </h2>
        <h2 class="text-2xl">${json['cognome']}</h2>
        </div>
        <div class="flex gap-2">
        <h2 class="text-2xl">Email: </h2>
        <h2 class="text-2xl">${json['email']}</h2>
        </div>
        <div class="flex gap-2">
        <h2 class="text-2xl">Data Nascita: </h2>
        <h2 class="text-2xl">${timeWithSpace(json['datanascita'])}</h2>
        </div>
        <button class=" p-2 bg-red-600 rounded-lg">Reset Password</button>
        </div>
        `)
    })
})

$('#prenotazioni').click(function(){
    $('#container').empty()
    // fetch(`http://localhost:3000/users/${getCookie('id')}`, {
    //     method: 'POST', // or 'PUT'
    //     headers: {
    //         'Content-Type': 'application/json',
    //     },
    // })

})

function timeWithSpace(time){

    time = time.substring(0, 10)

    return time
}