function scrKinaleroDash(){
    var hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
    var ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));

    if (mouse_check_button_pressed(mb_right)) {
        if (hor != 0 || ver != 0 && accion != "Dash" && tiempoDash <= 0) {
            var dir = point_direction(0, 0, hor, ver);
            accion = "Dash";
            direccionDash = dir;
            tiempoDash = 10;
            scrKinaleroViendoA(dir);
        }
    }
}