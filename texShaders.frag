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


   	// fragColor = frontColor;
	//vec4 c0 = texture(colorMap0, vec2(vtexCoord.x+ col*(1.0/8.0), vtexCoord.y+ (5-row)*(1.0/6.0))); //amb moviment
//vec4 c1 = texture(colorMap1, vtexCoord + vec2(time, time));
	vec4 c0 = texture(colorMap0, vtexCoord); // textura tal cual
	fragColor = frontColor * c0; //amb iluminacio
	//fragColor = 0.5*(c0 + c1); 2text
	//fragColor = mix(c0,c1,w); 2text variable
	//fragColor = c0.a * c0;
}
