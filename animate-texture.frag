#version 330 core

uniform sampler2D colorMap;
uniform sampler2D colorMap0;
uniform sampler2D colorMap1;
in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;


void main()
{

	vec4 c0 = texture(colorMap0, vtexCoord); // textura tal cual
	fragColor = frontColor * c0.a * c0;
}
