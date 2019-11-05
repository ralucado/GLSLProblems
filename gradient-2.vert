#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;

uniform mat4 modelViewProjectionMatrix;
uniform vec3 boundingBoxMin; // cantonada mínima de la capsa englobant
uniform vec3 boundingBoxMax; // cantonada màxima de la capsa englobant
const int NUM_COLORS = 5;
vec4 red = vec4(1,0,0,1);
vec4 yellow = vec4(1,1,0,1);
vec4 green = vec4(0,1,0,1);
vec4 cyan = vec4(0,1,1,1);
vec4 blue = vec4(0,0,1,1);

vec4 colors[NUM_COLORS] = vec4[NUM_COLORS](red,yellow,green,cyan,blue);

void main()
{

    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
	float y = 2*(gl_Position.y / gl_Position.w+1.0);
	frontColor = mix(colors[int(floor(y))],colors[int(floor(y+1))],fract(y));

}
