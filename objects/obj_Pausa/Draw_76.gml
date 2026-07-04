if (global.pausa && !global.cinematica && !surface_exists(pausaCapa)) {
    instance_deactivate_object(global.cinematicaDialogo);

    pausaCapa = surface_create(surface_get_width(application_surface), surface_get_height(application_surface));
    surface_set_target(pausaCapa);
    draw_surface(application_surface, 0, 0);
    surface_reset_target();

    global.surfaceFondoCinematica = pausaCapa; // ← Guardamos la surface como fondo
    global.preDibujo = false;

    instance_deactivate_all(true);
    instance_activate_object(self);
    instance_activate_object(global.cinematicaDialogo);
}
