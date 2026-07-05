// Solo avanza la animación hasta la imagen 3, luego se detiene
if (image_index >= 4) {
    image_speed = 0;
    image_index = 4;
}

var tilemap_id = layer_tilemap_get_id("tileColision");
var xTo = x + lengthdir_x(speed, direction);
var yTo = y + lengthdir_y(speed, direction);

if (!place_meeting(xTo, yTo, tilemap_id)) {
    x = xTo;
    y = yTo;
} else {
    instance_destroy(); // Se destruye al chocar con el tilemap
}