function scrActualizacionArma(){
	
	if (keyboard_check_pressed(ord("1"))) {
		arma.indice = 0;
	} else if (keyboard_check_pressed(ord("2"))) {
		arma.indice = 1;
	}

}