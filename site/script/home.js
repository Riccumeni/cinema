$(document).ready(function(){
    console.log(document.cookie);
})

$("#login").click(function(){
    console.log("ciao");
    window.location.replace('./login.html')
})