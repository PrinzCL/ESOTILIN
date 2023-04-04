if(document.readyState == 'loading'){
    document.addEventListener('DOMContentLoaded', ready)
}else{
    ready();
}


function ready() {
    document.getElementsByClassName('btn-contraolv')[0].addEventListener('click', contraolvClicked)
}
function contraolvClicked() {
    alert("Servicio no disponible");
    //Elimino todos los elmentos del carrito
}
