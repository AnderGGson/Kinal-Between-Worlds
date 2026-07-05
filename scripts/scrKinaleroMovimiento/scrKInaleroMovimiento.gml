function scrKinaleroMovimiento(velocidadActual) {
    var hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
    var ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));

    if (hor != 0 || ver != 0) {
        var dir = point_direction(0, 0, hor, ver);

        var vel = velocidadActual;
        scrPersonajeMovimientoA(vel, dir);

        accion = "Caminar";
        scrKinaleroViendoA(dir);
    } else {
        accion = "Quieto";
    }
	

}
