
// Dibuja el sprite del personaje tal como está definido en su sprite_index y image_index

draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, image_angle, image_blend, image_alpha);

if (conjuntoArmas[arma.indice] != noone) {
	var escalaArma = (arma.angulo >= 90 && arma.angulo < 270) ? -1 : 1;
	var anguloArma = arma.angulo + ((arma.angulo >= 90 && arma.angulo < 270) ? 180 : 0);

	draw_sprite_ext(conjuntoArmas[arma.indice].sprite, 0, x, y - posYNegativa + posYPositiva,
	escalaArma, 1, anguloArma, c_white, 1);
}

