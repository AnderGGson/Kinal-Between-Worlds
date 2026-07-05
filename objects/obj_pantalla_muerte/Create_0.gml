tituloMuerte = "sabias que?";

datosKinal = [
	"Fundacion Kinal no solo forma adolescentes, tambien cuenta con una Escuela de Tecnicos Superiores (ETS)",
	"En marzo de 2026 Kinal conmemoro sus 65 años de historia y continua transformando jovenes",
	"Antes de tener su gran campus actual, Kinal paso 25 años alquilando y saltando de casa en casa por diferentes barrios populares de la ciudad de Guatemala",
	"El proposito de Kinal se refleja en el significado del nombre, que es “lugar donde nació el fuego” en maya",
	"Kinal esta diseñado para sacar a la gente de la pobreza y aumentar sus ingresos",
	"Muchas empresas han pedido que los cursos de formacion de Kinal se impartan en sus propias plantas para que todo su personal pueda aprender a trabajar con mayor eficiencia",
	"En 1970, una persona que ayudaba a Kinal encontro una casa cerca del vertedero de la ciudad, y alli Kinal permanecio hasta 1984",
	"En 1986 se dono un lote de tamaño y ubicacion utiles y se creo Fundacion Kinal para facilitar la recaudacion de fondos para la construccion de un nuevo centro de formacion",
	"Kinal nacio del celo cristiano de algunos miembros del Opus Dei y sus amigos que eran estudiantes universitarios y jovenes profesionales.",
	"Kinal comenzo en 1961 con un grupo de albañiles y carpinteros en una zona pobre de la Ciudad de Guatemala",
	"Sus instalaciones definitivas se construyeron gracias al impulso directo de don Álvaro del Portillo (sucesor de Escrivá de Balaguer) a partir de 1985",
	"El colegio comparte su nombre con Kinal, un importante sitio arqueologico maya de la época prehispanica situado en el departamento de Peten",
	"La institucion fue inspirada directamente por las enseñanzas de san Josemaría Escrivá de Balaguer (fundador del Opus Dei)",
	"El Trabajo Bien Hecho.",
	"Un estudio interno demostro que los egresados de Kinal logran multiplicar exponencialmente los ingresos economicos de sus familias",
];

var total_datos = array_length(datosKinal);
var indice_azar = irandom(total_datos - 1);

historia = datosKinal[indice_azar];