// Calcular centro de la cámara
var camara = view_camera[0];
var vistaX = camera_get_view_x(camara);
var vistaY = camera_get_view_y(camara);
var vistaAncho = camera_get_view_width(camara);
var vistaAlto = camera_get_view_height(camara);

var posX = vistaX + vistaAncho / 2;
var posY = vistaY + vistaAlto / 2;

// Crear capa si no existe
if (!layer_exists("secuencia")) {
    layer_create(-100, "secuencia");
}

// Crear secuencia en esa capa
cinematica = noone; 
secuencia = secPreTutorial;
// Activar estado de cinemática global
ejecutado = false