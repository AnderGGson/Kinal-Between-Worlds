
sprite_index = asset_get_index("sprKinalero" + accion + string(fotograma));

with (all) {	
//Entre mas dibujado abajo este en la sala, mas al frente, debe dibujarse
    depth = -bbox_bottom;
}