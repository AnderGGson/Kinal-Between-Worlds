//este if es durante el knockback
if (alarm[1] > 0) {
    objetivoX = x + empujeX;
    objetivoY = y + empujeY;

    //Esto simula la friccion
    empujeX *= 0.8;
    empujeY *= 0.8;
}

var horizontal  = clamp(objetivoX - x, -1, 1);
var vertical = clamp(objetivoY - y, -1, 1);

move_and_collide(horizontal * velocidad, vertical * velocidad, [tilemap, obj_enemigo_parent]);