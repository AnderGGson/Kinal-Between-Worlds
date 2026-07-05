// POSICIÓN BASE
draw_set_font(fntMinecraft)

var posX = 20;
var posY = 20;

// VIDA
draw_sprite_ext(sprVida, clamp(hp, 1, 4), posX, posY, 2, 2, 0, c_white, 1);

// AIMBOT (debajo de la vida)

var teclaAimbot = (global.kills >= 5) ? sprFuncionalesPresionadas : sprFuncionales;
draw_sprite_ext(teclaAimbot, 2, posX +18, posY +60, 2, 2, 0, c_white, 1);

draw_sprite_ext(sprBarraAimbot, global.kills, posX + 78, posY + 60, 1, 1, 0, c_white, 1);

// DASH (debajo del aimbot)
var iconoDash = (nivelDash >= 5) ? 2 : 0;
draw_sprite_ext(sprMouse, iconoDash, posX + 18, posY +120 , 1.2, 1.2, 0, c_white, 1);


draw_sprite(sprBarraDash, nivelDash, posX +78, posY + 120);

// ARMA Y MUNICIÓN (debajo del dash)
if (conjuntoArmas[arma.indice] != noone) {
    var arma_actual = conjuntoArmas[arma.indice];
    
    // Ícono del arma (sprite del objeto del arma)
    var spriteArma = object_get_sprite(arma_actual.objeto);
    if (spriteArma != -1) {
        draw_sprite(spriteArma, 0, posX + 18, posY + 180);
    }
    
    // Munición (al lado derecho del ícono)
    var textoMunicion = string(arma_actual.municion) + " / " + string(arma_actual.municionMaxima);
    
    // Calcular frame para la barra de munición (0 a 5)
    var frameBarra;
    if (arma_actual.municion == 0) {
        frameBarra = 0; // barra vacía si no hay balas
    } else {
        var max_divisiones = 5;
        frameBarra = floor((arma_actual.municion / arma_actual.municionMaxima) * max_divisiones);
        frameBarra = clamp(frameBarra, 1, max_divisiones); // de 1 a 5 si hay balas
    }

    // Dibujar la barra de munición
    draw_sprite(sprBarraMunicion, frameBarra, posX + 78, posY + 170);

    // Dibujar el texto de munición (color negro para que resalte)
    draw_set_color(c_black);
    draw_text(posX + 78, posY + 188, textoMunicion);
}



