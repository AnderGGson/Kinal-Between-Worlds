function scrKinaleroArmaActual(vel, tipo_bala, posOrigenBalaX, posOrigenBalaY) {
	
	if (!layer_exists("balas")) {
            layer_create(0, "balas");
			}
	
    if (conjuntoArmas[arma.indice] == noone) { exit; }

    arma.angulo = point_direction(x , y , mouse_x, mouse_y);
    arma.frecuencia -= 1;

    if (mouse_check_button(mb_left) && conjuntoArmas[arma.indice].municion > 0 && arma.frecuencia <= 0) {
        var bx = x + posOrigenBalaX + lengthdir_x(10, arma.angulo);
        var by = y + posOrigenBalaY + lengthdir_y(10, arma.angulo);

        var bala = instance_create_layer(bx, by, "balas", tipo_bala);
        bala.speed = vel;
        bala.direction = arma.angulo;

        conjuntoArmas[arma.indice].municion -= 1;
        arma.frecuencia = conjuntoArmas[arma.indice].frecuencia;
    }
}
