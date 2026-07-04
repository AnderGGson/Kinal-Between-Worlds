
// Dibuja el sprite del personaje tal como está definido en su sprite_index y image_index

draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, image_angle, image_blend, image_alpha);

if (arma != noone) {
    // Determina si el arma debe estar reflejada horizontalmente
    // Si el ángulo está entre 90° y 270°, el personaje está mirando hacia la izquierda
    var armaTamano = (arma.angulo >= 90 && arma.angulo < 270) ? -1 : 1;
    
    // Ajusta el ángulo de dibujo del arma si está reflejada, sumando 180°
    var armaAngulo = arma.angulo + ((arma.angulo >= 90 && arma.angulo < 270) ? 190 : 0);
    
    // Dibuja el sprite del arma con las transformaciones necesarias:
    // - sprite del arma
    // - subimagen 0
    // - posición (x, y - 4) para ajustarla un poco hacia arriba
    // - escala horizontal según la dirección (1 o -1)
    // - escala vertical normal
    // - ángulo rotado según dirección
    // - color blanco (sin tinte)
    // - opacidad completa (1)
    draw_sprite_ext(arma.sprite, 0, x , y - 15, armaTamano, 1, armaAngulo, c_white, 1);
} 
