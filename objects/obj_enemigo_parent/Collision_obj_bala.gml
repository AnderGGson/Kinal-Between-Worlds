// Solo se ejecuta si no estamos en knockback
if (alarm[1] <= 0) {
    hp -= other.dano;
    image_blend = c_red;

    // Direccion desde la bala hacia el enemigo
    var dir = point_direction(other.x, other.y, x, y);
    var fuerza = 10; 

    // Empuje más suave y realista
    empujeX = lengthdir_x(fuerza, dir);
    empujeY = lengthdir_y(fuerza, dir);

    alarm[1] = 20;
}