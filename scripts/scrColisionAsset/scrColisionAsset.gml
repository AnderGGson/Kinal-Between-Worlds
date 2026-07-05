function scrColisionAsset(spd, dir) {
    // Calculamos la nueva posición que queremos probar
    var xTo = x + lengthdir_x(spd, dir);
    var yTo = y + lengthdir_y(spd, dir);

    // Recorremos todas las instancias de objetos en la capa "npcColisiones"
    var npcLayer_id = layer_get_id("npcColisiones");

    // Asegurarnos de que la capa existe
    if (npcLayer_id == -1) return false;

    return false;  // No colisiona con ningún objeto
}
