
// Pixelate effect

// Original shader by simesgreen
// https://www.shadertoy.com/view/4sl3zr

// Ported to Processing by Raphaël de Courville <twitter: @sableRaph>

#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D texture;

uniform vec2 sketchSize;

uniform float division;

void main(void)
{
	vec2 uv = gl_FragCoord.xy / sketchSize.xy;
	vec2 divs = vec2(sketchSize.x * division / sketchSize.y, division);
	uv = floor(uv * divs)/ divs;
	gl_FragColor = texture2D(texture, uv);
}
