if (keyboard_check_pressed(ord("E"))) {
	// Recorrer las armas en conjuntoArmas para intentar recargar
	for (var i = 0; i < 2; i++) {
		if (conjuntoArmas[i] != noone && conjuntoArmas[i].objeto == other.arma.objeto) {
			// Calcular la munición sobrante tras sumar
			var sobrante = conjuntoArmas[i].municion + other.arma.municion - other.arma.municionMaxima;
			
			// Sumar la munición al arma en conjuntoArmas
			conjuntoArmas[i].municion += other.arma.municion;
			conjuntoArmas[i].municion = min(conjuntoArmas[i].municion, conjuntoArmas[i].municionMaxima);
			
			// Si quedó munición extra, dejarla en el objeto other, sino destruirlo
			if (sobrante > 0) {
				other.arma.municion = sobrante;
			} else {
				instance_destroy(other);
			}
			
			exit; // Salir del ciclo y función
		}
	}
	
	// Si el arma actual existe, crear un objeto arma en la capa "Weapons"
	if (conjuntoArmas[arma.indice] != noone) {
		var armaObj = instance_create_layer(x, y, "balas", conjuntoArmas[arma.indice].objeto);
		armaObj.arma = conjuntoArmas[arma.indice];
	}
	
	// Cambiar el arma en conjuntoArmas al arma que se está recogiendo
	conjuntoArmas[arma.indice] = other.arma;
	
	// Destruir el objeto other (arma recogida)
	instance_destroy(other);
}
