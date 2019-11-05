#version 330 core

in vec4 frontColor;
out vec4 fragColor;
uniform int n = 2;

void main()
{
    if (int(gl_FragCoord.y)%n != 0) {
    	discard;
	}
	else fragColor = frontColor;
}

/*
Escriu un fragment shader que simuli l’aparença de les imatges dels antics tubs CRT. Per aconseguir
aquest efecte, caldrà eliminar (discard) tots els fragments d’algunes línies del viewport. En concret, caldrà
que només sobrevisquin els fragments d’una de cada n línies, on n és un uniform int proporcionat per
l’usuari.
Observació: quan feu servir gl_FragCoord, tingueu en compte que per defecte les coordenades (x,y) en
window space fan referència al centre del píxel. Per exemple, un fragment a la cantonada inferior esquerra
de la finestra té coordenades (0.5, 0.5).*/

