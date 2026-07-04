function scrKinaleroViendoA(dir){

	if (dir < 22.5 || dir >= 337.5) {
		fotograma = "Derecha";
	} else if (dir >= 22.5 && dir < 67.5) {
		fotograma = "ArribaDerecha";
	} else if (dir >= 67.5 && dir < 112.5) {
		fotograma = "Arriba";
	} else if (dir >= 112.5 && dir < 157.5) {
		fotograma = "ArribaIzquierda";
	} else if (dir >= 157.5 && dir < 202.5) {
		fotograma = "Izquierda";
	} else if (dir >= 202.5 && dir < 247.5) {
		fotograma = "AbajoIzquierda";
	} else if (dir >= 247.5 && dir < 292.5) {
		fotograma = "Abajo";
	} else if (dir >= 292.5 && dir < 337.5) {
		fotograma = "AbajoDerecha";
	}
}