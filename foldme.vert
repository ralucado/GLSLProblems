#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;

uniform mat4 modelViewProjectionMatrix;
uniform float time;
vec4 blue = vec4(0,0,1,1);


void main()
{
	float sigma = -time*texCoord.s;
	mat3 theMatrix;
	theMatrix[0].xyz = vec3(cos(sigma),0.0,-sin(sigma));
	theMatrix[1].xyz = vec3(0.0,1.0,0.0);
	theMatrix[2].xyz = vec3(sin(sigma),0.0,cos(sigma));

	frontColor = blue;
    gl_Position = modelViewProjectionMatrix * vec4((theMatrix*vertex),1.0);


}
