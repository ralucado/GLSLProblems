#version 330 core

uniform sampler2D colorMap;
uniform sampler2D colorMap0;
uniform sampler2D colorMap1;
in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

uniform float time;

vec4 black = vec4(0,0,0,1);
vec4 white = vec4(0.9,0.9,0.9,1);
void main()
{

	vec2 texCoord = floor(vtexCoord*8.0);
	if( mod((texCoord.s + texCoord.t),2) == 0.0) fragColor = black;
	else fragColor = white;

	//fragColor = 0.5*(c0 + c1); 2text
	//fragColor = mix(c0,c1,w); 2text variable
	//fragColor = c0.a * c0;
}
