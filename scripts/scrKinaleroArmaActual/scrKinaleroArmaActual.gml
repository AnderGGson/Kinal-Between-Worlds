function scrKinaleroArmaActual() {
    // Si no hay arma equipada, salir de la función
    if (arma == noone) { exit; }
	
    if (!layer_exists("balas")) {
    layer_create(0, "balas");
    }

    // Calcular el ángulo entre el jugador (ligeramente desplazado hacia arriba) y el mouse
    // Esto sirve para que el arma apunte hacia donde está el cursor
    arma.angulo = point_direction(x, y -13 , mouse_x, mouse_y);
    
    // Si se presiona el botón izquierdo del mouse (solo una vez)
    if (mouse_check_button_pressed(mb_left)) {
        // Calcular la posición inicial de la bala (13 píxeles desde el jugador en dirección al ángulo del arma)
        var bx = x + lengthdir_x(13, arma.angulo);
        var by = y -13 + lengthdir_y(13, arma.angulo);
        
        // Crear la bala (obj_bala) en la capa "Instances" en la posición calculada
        var bala = instance_create_layer(bx, by,"balas", obj_bala);

		// Asignar velocidad y dirección a la bala
        bala.speed = 5;
        bala.direction = arma.angulo;
    }
}
