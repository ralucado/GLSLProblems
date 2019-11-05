#version 330 core

uniform sampler2D colorMap;
uniform sampler2D colorMap0;
uniform sampler2D colorMap1;
in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

uniform float time;

void main()
{

	fragColor = frontColor; //amb iluminacio

}
