const login = () => {
    const email = $("#email").val()
    const password = $("#password").val()

    fetch('http://localhost:3000/auth/login', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                email,
                password,
            }),
        })
        .then((res) => {
            return res.json();
        })
        .then((data) => {
            if(data.success){
                window.location.href="http://localhost:3000/";
            }else{
                alert("non trovato");
            }
        });
}