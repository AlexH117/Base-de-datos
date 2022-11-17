const $tiempo = document.querySelector('.tiempo'),
$fecha = document.querySelector('.fecha');

function Reloj(){
    let f = new Date();
    dia = f.getDate();
    mes = f.getMonth()+1;
    anio = f.getFullYear();
    diaSemana = f.getDay();

    dia = ('0' + dia).slice(-2);
    mes = ('0' + mes).slice(-2);
    
    let timeString = f.toLocaleTimeString();
    $tiempo.innerHTML = timeString;

    let semana = ['DOMINGO', 'LUNES', 'MARTES', 'MIERCOLES', 'JUEVES', 'VIERNES', 'SABADO'];
    $fecha.innerHTML = `${dia}-${mes}-${anio}`

}

setInterval(()=>{
    Reloj()
},1000);