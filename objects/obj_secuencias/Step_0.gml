var camara = view_camera[0];
var vistaX = camera_get_view_x(camara);
var vistaY = camera_get_view_y(camara);
var vistaAncho = camera_get_view_width(camara);
var vistaAlto = camera_get_view_height(camara);

// Centro de la cámara
var posX = vistaX + vistaAncho / 2;
var posY = vistaY + vistaAlto / 2;

if (!global.cinematica && !ejecutado) {
	cinematica = layer_sequence_create("secuencia", posX, posY, secuencia);
	alarm[0] = layer_sequence_get_length(cinematica);
    ejecutado = true;

}
