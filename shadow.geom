#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices=36) out;

uniform mat4 modelViewProjectionMatrix;
uniform mat4 modelViewProjectionMatrixInverse;
uniform vec3 boundingBoxMin;

in vec4 vfrontColor[];
out vec4 gfrontColor;

const vec4 BLACK=vec4(0, 0, 0, 1);

void main(void) {
	//primitiva original
	for (int i=0; i<3; ++i) {
	    gfrontColor=vfrontColor[i];
	    gl_Position=modelViewProjectionMatrix*gl_in[i].gl_Position;
	    EmitVertex();
  	}
	EndPrimitive();
	//primitiva ombra
	for (int i=0; i<3; ++i) {
	    gfrontColor=BLACK;
	    //multiplicar per la inversa per poder canviar la posicio de la Y
	    vec4 V=gl_in[i].gl_Position;
	    V.y=boundingBoxMin.y;
	    //tornem a multiplicar per passar a eye(?) space
	    gl_Position=modelViewProjectionMatrix*V;
	    EmitVertex();
  	}	
	EndPrimitive();
}
