#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec4 aux;
vec4 profileColor = vec4(0.7,0.6,0.0,1);

void main()
{
	vec3 dx = dFdx(aux.xyz);
    vec3 dy = dFdy(aux.xyz);
	vec3 norm = normalize(cross(dx,dy));
    fragColor = frontColor*norm.z;
}
