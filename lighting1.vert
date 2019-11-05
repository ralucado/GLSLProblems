#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform mat4 modelViewMatrix;
uniform vec4 matAmbient, matDiffuse, matSpecular;
uniform float matShininess;
uniform vec4 lightAmbient, lightDiffuse, lightSpecular, lightPosition;

//ka*Ia + Kd*Id(N*L) + ks*Is(N*H)^s 

vec4 light(vec3 N, vec3 V, vec3 L){
    vec3 H =normalize(V+L);
    float NL = max(0.0, dot(N,L));
    float NH = max(0.0, dot(N,H));
    return 
        matAmbient * lightAmbient +
        matDiffuse * lightDiffuse * NL +
        matSpecular * lightSpecular * pow(NH, matShininess);
    
}

void main()
{
    vec3 N = normalize(normalMatrix * normal);
    vec3 aux = (modelViewMatrix * vec4(vertex.xyz, 1.0)).xyz; //what happens if we put modelViewProjectionMatrix? nothing good
    vec3 V = normalize(-aux); //what happens if we put P? disco lights
    vec3 L = normalize(lightPosition.xyz - aux);

    frontColor = light(N,V,L) * vec4(color, 1.0);
    vtexCoord = texCoord; //can we delete this? i guess
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}
