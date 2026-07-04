if (global.cinematica){
       instance_deactivate_all(true); // Desactiva todo
        instance_activate_object(self); // Se activa a sí mismo
        instance_activate_object(global.cinematicaDialogo);
}
		
// Solo dibuja la surface si está en pausa Y no está en modo cinemática
if (global.pausa && !global.cinematica) {
    
    // Si la surface no existe, la creamos y capturamos la pantalla
    if (!surface_exists(pausaCapa)) {
        instance_deactivate_all(true); // Desactiva todo
        instance_activate_object(self); // Se activa a sí mismo
        instance_activate_object(global.cinematicaDialogo); // Activa el diálogo si está

        pausaCapa = surface_create(surface_get_width(application_surface), surface_get_height(application_surface));
        surface_set_target(pausaCapa);
        draw_surface(application_surface, 0, 0); // Captura actual
        surface_reset_target();
    }

    // Dibujamos la surface y el fondo de pausa
    var vistaX = camera_get_view_x(view_camera[0]);
    var vistaY = camera_get_view_y(view_camera[0]);
    var vistaAncho = camera_get_view_width(view_camera[0]);
    var vistaAlto = camera_get_view_height(view_camera[0]);

    draw_surface_stretched(pausaCapa, vistaX, vistaY, vistaAncho, vistaAlto);

    draw_set_color(c_black);
    draw_set_alpha(0.5);
    draw_rectangle(vistaX, vistaY, vistaX + vistaAncho, vistaY + vistaAlto, false);
    draw_set_alpha(1);

    draw_set_color(c_white);
    draw_set_font(fntDaydream);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(vistaX + vistaAncho / 2, vistaY + vistaAlto / 2, "Juego Pausado");
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}

