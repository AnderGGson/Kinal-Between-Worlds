// Destruir la capa de la secuencia al terminar
if (layer_exists("secuencia")) {
    layer_destroy("secuencia");
	// Marcar fin de cinemática y eliminar controlador
global.cinematica = false;
instance_destroy();
}


