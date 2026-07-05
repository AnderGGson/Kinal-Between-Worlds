velocidadKinalero = 2;


global.kills = 0;              
global.aimbotListo= false; 
global.aimbotActivo = false;    
global.aimbotTemporizaodr = 0;    


accion = "Quieto";
fotograma = "Abajo";


nivelDash = 5; // valores de 0 a 6
tiempoRecargaDash = 0; // contador de tiempo para recarga
esperaDash = 0; // tiempo restante mientras estás dasheando
velocidadDash = 10;
direccionDash = 0;


// Inicializar el conjunto de armas (por ejemplo, 2 espacios vacíos)
conjuntoArmas = [noone, noone];

//posicion ajustable desde el arma usable
posYNegativa = 15;
posYPositiva = 0;

// Datos del arma activa
arma = {
	indice: 0,       // Índice del arma actualmente equipada
	angulo: 0,       // Ángulo hacia donde apunta
	frecuencia: 0,// Tiempo restante antes de poder disparar de nuevo
};

velocidadBala= 0


hp = 4;
totalHp = hp;
dano = 1;