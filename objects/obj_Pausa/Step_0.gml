if (keyboard_check_pressed(ord("P")) && !global.cinematica) {
	global.pausa = !global.pausa;
	global.preDibujo = !global.preDibujo;
}

	if (global.pausa) {
		
		audio_pause_all();
		instance_deactivate_all(true); // Desactiva todo
        instance_activate_object(self); // Se activa a sí mismo
	} else {
		if (surface_exists(pausaCapa)) {
			surface_free(pausaCapa);
		}
		instance_activate_all();
		audio_resume_all();
	}

