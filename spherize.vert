#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform vec2 min = vec2(-1,-1);
uniform vec2 max = vec2(1,1);

void main()
{
	vec3 N = normalize(normalMatrix * normal);
	frontColor = vec4(color,1.0);
    gl_Position = modelViewProjectionMatrix * vec4(texCoord,0.0,1.0);

}
