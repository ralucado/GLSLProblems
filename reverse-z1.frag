#version 330 core

in vec4 frontColor;

out vec4 fragColor;
uniform float radi = 0.2;

uniform vec4 red = vec4(1.0,0.0,0.0,1.0);
uniform vec4 white = vec4(1.0,1.0,1.0,1.0);

void main()
{	
	fragColor = frontColor;
}
