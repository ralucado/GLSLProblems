#version 330 core


layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform float amplitude=0.1;
uniform float freq = 2; // expressada en Hz

uniform float time;

void main()
{

    frontColor = vec4(normalize(normalMatrix * normal).z); //nomes volem iluminacio
    vtexCoord = texCoord;
    vec3 P = vertex.xyz + normal * (amplitude * abs(sin(time*2*freq*3.1415)));
    gl_Position = modelViewProjectionMatrix * vec4(P, 1);

}
