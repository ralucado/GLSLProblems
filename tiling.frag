#version 330 core

uniform sampler2D colorMap;
uniform sampler2D colorMap0;
uniform sampler2D colorMap1;
in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;
uniform float w = 0.5;
uniform float time;
float deltaTime;
float lastTime;
uniform float speed = 0.1;
void main()
{

	vec4 c0 = texture(colorMap0, vtexCoord); // textura tal cual
	fragColor = c0.a * c0;
}
