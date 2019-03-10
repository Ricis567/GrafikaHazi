#version 130

// VBO-b�l �rkez� v�ltoz�k
in vec3 vs_in_pos;
in vec3 vs_in_col;

// a pipeline-ban tov�bb adand� �rt�kek
out vec3 vs_out_col;

// shader k�ls� param�terei - most a h�rom transzform�ci�s m�trixot k�l�n-k�l�n vessz�k �t
uniform mat4 world;
uniform mat4 view;
uniform mat4 proj;

uniform float time;

void main()
{
	gl_Position = proj * view * world * vec4( vs_in_pos, 1 );
	
	if(vs_in_col.x > 0)
	{
		vs_out_col.x = vs_in_col.x;
		vs_out_col.y = vs_in_col.y;
		vs_out_col.z = 1 * time;
	}
	else if(vs_in_col.y > 0)
	{
		vs_out_col.x = 1 * time;
		vs_out_col.y = vs_in_col.y;
		vs_out_col.z = vs_in_col.z;
	}
	else if(vs_in_col.z > 0)
	{
		vs_out_col.x = vs_in_col.x;
		vs_out_col.y = 1 * time;
		vs_out_col.z = vs_in_col.z;
	}
	
	// vs_out_col = vs_in_col;
}