function scrKinaleroDash() {
    var hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
    var ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));

    if (mouse_check_button_pressed(mb_right)) {
        if ((hor != 0 || ver != 0) && accion != "Dash" && nivelDash >= 5) {
            direccionDash = point_direction(0, 0, hor, ver);
            accion = "Dash";
            esperaDash = 10; // duración del dash
            nivelDash -= 5; // consume media barra
            scrKinaleroViendoA(direccionDash);
        }
    }

    // Si NO está en dash, recarga la barra
    if (accion != "Dash") {
        if (nivelDash < 5) {
            tiempoRecargaDash += 1;
            if (tiempoRecargaDash >= room_speed) {
                nivelDash += 1;
                tiempoRecargaDash = 0;
            }
        }
    }
}
