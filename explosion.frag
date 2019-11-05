#version 330 core

uniform sampler2D colorMap0;

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;
uniform float time;

void main()
{

    int N = int(30 * time) % 48;
	int col = N%8;
	int row = N/ 8;
	vec4 c0 = texture(colorMap0, vec2(vtexCoord.x+ col*(1.0/8.0), vtexCoord.y+ (5-row)*(1.0/6.0))); //amb moviment
	fragColor = c0;
	fragColor = fragColor.a * fragColor;
}