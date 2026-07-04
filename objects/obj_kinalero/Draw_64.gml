//El clamp se asegura de que solo puedan ser valores entre 1 y 4
var vidaActual = clamp(hp, 1, 4);

var posicionX = 20;
var posicionY = 20;

draw_sprite_ext(sprVida, vidaActual, posicionX, posicionY, 2, 2, 0, c_white, 1);