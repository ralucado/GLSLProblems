#version 330 core

uniform sampler2D c0;
uniform sampler2D c1;
uniform sampler2D c2;
uniform sampler2D c3;
in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

uniform float time;

void main()
{


	vec4 noise = texture(c0,vtexCoord);
	vec4 rock = texture(c1,vtexCoord);
	vec4 grass = texture(c2, vtexCoord); // textura tal cual
	vec4 grid = texture(c3,vtexCoord);
	fragColor = mix(grid,grass,noise.z);

}
