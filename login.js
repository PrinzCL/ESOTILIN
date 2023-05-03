window.addEventListener('DOMContentLoaded', function () {
    const user = 'elpepe';
    const pass = 'elpepe123';

    document.getElementById("enviar").addEventListener("click", function (event) {
        event.preventDefault();
    });

    document.getElementById("enviar").addEventListener("click", function () {

            const usuario = document.getElementById('user').value;
            const contrasena = document.getElementById('pass').value;
            if (contrasena !== pass || usuario !== user) {
                alert("Usuario o contraseña incorrectos!")
            } else {
                console.log("verificado")
                window.location.replace('crud-list-usuarios.html');
            }
        
    });
});
