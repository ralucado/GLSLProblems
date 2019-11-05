#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices=36) out;

uniform mat4 modelViewProjectionMatrix;
uniform mat4 modelViewProjectionMatrixInverse;
uniform vec3 boundingBoxMin;
uniform vec3 boundingBoxMax;

in vec4 vfrontColor[];
out vec4 gfrontColor;

const vec4 BLACK=vec4(0, 0, 0, 1);
const vec4 CYAN=vec4(0, 1, 1, 1);

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
	//Terra
	if (gl_PrimitiveIDIn==0) { 
		float R = (distance(boundingBoxMin, boundingBoxMax))/2;
		float Cx = (boundingBoxMax.x + boundingBoxMin.x)/2;
		float Cz = (boundingBoxMax.z + boundingBoxMin.z)/2;
		float Cy = boundingBoxMin.y - 0.01;
		gfrontColor = CYAN;
		gl_Position = modelViewProjectionMatrix *vec4(Cx - R, Cy, Cz - R, 1.0);
		EmitVertex();
		gl_Position = modelViewProjectionMatrix *vec4(Cx - R, Cy, Cz + R, 1.0);
		EmitVertex();
		gl_Position = modelViewProjectionMatrix *vec4(Cx + R, Cy, Cz - R, 1.0);
		EmitVertex();
		EndPrimitive();

		gl_Position = modelViewProjectionMatrix *vec4(Cx + R, Cy, Cz + R, 1.0);
		EmitVertex();
		gl_Position = modelViewProjectionMatrix *vec4(Cx - R, Cy, Cz + R, 1.0);
		EmitVertex();
		gl_Position = modelViewProjectionMatrix *vec4(Cx + R, Cy, Cz - R, 1.0);
		EmitVertex();
		EndPrimitive();
	}
}
