#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;
uniform float radi = 0.2;

uniform vec4 red = vec4(1.0,0.0,0.0,1.0);
uniform vec4 white = vec4(1.0,1.0,1.0,1.0);

void main()
{	
	vec2 centre = vec2(0.5,0.5);
	if(distance(vtexCoord,centre) <= radi) fragColor = red;
	else fragColor = white;
}
