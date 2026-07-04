if (alarm[1] <= 0) {
    if (instance_exists(obj_kinalero) && distance_to_object(obj_kinalero) < distanciaHaciaJugador){
        objetivoX = obj_kinalero.x;
        objetivoY = obj_kinalero.y;
    } else {
        objetivoX = random_range(xstart - 100, xstart + 100);
        objetivoY = random_range(ystart - 100, ystart + 100);
    }
}

alarm[0] = 30;
