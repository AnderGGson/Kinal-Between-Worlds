scrKinaleroArmaActual()


switch (accion) {
    case "Quieto":
    case "Caminar":
        scrKinaleroMovimiento();
        scrKinaleroDash();
        break;

    case "Dash":
        scrPersonajeMovimientoA(velocidadDash, direccionDash);
        scrKinaleroViendoA(direccionDash);
        tiempoDash -= 1;
        if (tiempoDash <= 0) {
            accion = "Quieto"; // o "Caminar"
        }
        break;
}