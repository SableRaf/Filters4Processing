
// Original shader by SanchYESS
// https://www.shadertoy.com/view/4s2GRR

// Ported to Processing by Raphaël de Courville <twitter: @sableRaph>


#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D texture;

uniform float amount; // in the range [ -0.5 , 0.5 ]

uniform vec2 sketchSize;


//Inspired by http://stackoverflow.com/questions/6030814/add-fisheye-effect-to-images-at-runtime-using-opengl-es
void main(void)
{
	vec2 p = vec2(gl_FragCoord.x, 1.0 - gl_FragCoord.y) / sketchSize.x;  //normalized coords with some cheat
	                                                         //(assume 1:1 prop)
	float prop = sketchSize.x / sketchSize.y; //screen proportion
	vec2 m = vec2(0.5, -0.5 / prop);          //center coords
	vec2 d = p - m;                           //vector from center to current fragment
	float r = sqrt(dot(d, d));                // distance of pixel from center

	float power = ( 2.0 * 3.141592 / (2.0 * sqrt(dot(m, m))) ) * amount;

	float bind;                                           //radius of 1:1 effect
	if (power > 0.0) bind = sqrt(dot(m, m));              //stick to corners
	else {if (prop < 1.0) bind = m.x; else bind = m.y;}   //stick to borders

	//Weird formulas
	vec2 uv;
	if (power > 0.0) //fisheye
		uv = m + normalize(d) * tan(r * power) * bind / tan( bind * power);
	else if (power < 0.0) //antifisheye
		uv = m + normalize(d) * atan(r * -power * 10.0) * bind / atan(-power * bind * 10.0);
	else uv = p; //no effect for power = 1.0

	vec3 col = texture2D(texture, vec2(uv.x, -uv.y * prop)).xyz;//Second part of cheat
	                                                  //for round effect, not elliptical
	gl_FragColor = vec4(col, 1.0);
}