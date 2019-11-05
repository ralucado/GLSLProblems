#version 330 core


layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix, modelViewMatrixInverse;
uniform mat3 normalMatrix;

uniform vec4 lightPosition;

uniform float n = 4;

void main()
{
	vec4 F = modelViewMatrixInverse*vec4(lightPosition.xyz,1.0);
    float d = distance(vertex.xyz,F.xyz);
    float w = clamp(1/pow(d,n),0,1);
    vec3 P = (1.0 - w) * vertex.xyz + w*F.xyz;
    frontColor = vec4(normalize(normalMatrix * normal).z); //nomes volem iluminacio
    gl_Position = modelViewProjectionMatrix * vec4(P, 1);

}
