function scrArmasKinalero(arma_indice, conjunto) {

    var tipo_bala = obj_bala;
    var velocidadBala = 5;
    var posOrigenBalaX = 0;
    var posOrigenBalaY = -15;

    if (arma_indice >= 0 && arma_indice < array_length(conjunto)) {
        if (conjunto[arma_indice] != noone) {
            switch (conjunto[arma_indice].objeto) {
                case obj_compas:
                    tipo_bala = obj_bala_compas;
                    velocidadBala = 0;
                    posOrigenBalaX = 0;
                    posOrigenBalaY = -20;
                    break;

                default:
                    tipo_bala = obj_bala;
                    velocidadBala = 5;
                    posOrigenBalaX = 0;
                    posOrigenBalaY = -15;
                    break;
            }
        }
    }

    return [tipo_bala, velocidadBala, posOrigenBalaX, posOrigenBalaY];
}

