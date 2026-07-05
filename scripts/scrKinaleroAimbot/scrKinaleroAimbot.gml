function scrKinaleroAimbot(){
if (arma == noone) exit;

    var objetivo = noone;
    var menorDistancia = 9999;
    var rango = 250;

    with (obj_enemigo_parent) { 
		//con el with, hacemos que este codigo se ejecute por cada instancia de enemigo
        var distancia = point_distance(x, y, other.x, other.y);
        if (distancia < menorDistancia && distancia <= rango) {
            menorDistancia = distancia;
            objetivo = id;
        }
    }

    if (objetivo != noone) {
        arma.angulo = point_direction(x, y - 13, objetivo.x, objetivo.y);
    } else {
        arma.angulo = point_direction(x, y - 13, mouse_x, mouse_y);
    }

    if (mouse_check_button_pressed(mb_left)) {
        var bx = x + lengthdir_x(13, arma.angulo);
        var by = y -13 + lengthdir_y(13, arma.angulo);

        var bala = instance_create_layer(bx, by, "Balas", obj_bala);
        bala.speed = 5;
        bala.direction = arma.angulo;
    }
}