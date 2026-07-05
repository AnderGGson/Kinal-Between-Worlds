function scrPersonajeMovimientoA(spd, dir) {
    var tilemap_id = layer_tilemap_get_id("tileColision");
    var arr = scrObjetosSolidos();
	
    // Intentamos movernos tratando colisión suave con ángulos
    for (var angle = 0; angle < 90; angle += 15) {
        for (var multiplier = -1; multiplier <= 1; multiplier += 2) {
            var newDir = dir + angle * multiplier;
            var xTo = x + lengthdir_x(spd, newDir);
            var yTo = y + lengthdir_y(spd, newDir);

            if ((tilemap_id == -1 || !place_meeting(xTo, yTo, tilemap_id)) && !scrObjetosColisionables(spd, newDir, arr)) {
                x = xTo;
                y = yTo;
                exit;
            }
        }
    }

    // Deslizamiento por ejes X y Y
    var xTo = x + lengthdir_x(spd, dir);
    var yTo = y + lengthdir_y(spd, dir);

    if ((tilemap_id == -1 || !place_meeting(xTo, y, tilemap_id)) && !scrObjetosColisionables(spd, dir, arr)) {
        x = xTo;
        exit;
    }
    if ((tilemap_id == -1 || !place_meeting(x, yTo, tilemap_id)) && !scrObjetosColisionables(spd, dir, arr)) {
        y = yTo;
        exit;
    }
}
