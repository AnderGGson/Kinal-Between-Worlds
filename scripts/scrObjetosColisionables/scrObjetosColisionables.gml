function scrObjetosColisionables(spd, dir, arrObjetos) {
    // Calculamos la nueva posición que queremos probar
    var xTo = x + lengthdir_x(spd, dir);
    var yTo = y + lengthdir_y(spd, dir);

    // Verificamos si hay colisión con alguno de los objetos del array
    for (var i = 0; i < array_length(arrObjetos); i++) {
        if (place_meeting(xTo, yTo, arrObjetos[i])) {
            return true;  // Colisión detectada
        }
    }
    return false;  // No colisiona con ninguno
}
