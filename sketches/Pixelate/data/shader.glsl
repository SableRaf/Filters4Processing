
// Pixelate effect

// Original shader by simesgreen
// https://www.shadertoy.com/view/4sl3zr

// New original shader by radiodario
// https://www.shadertoy.com/view/ltjGDh

// Ported to Processing by Raphaël de Courville <twitter: @sableRaph>

#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D texture;

uniform vec2 sketchSize;
uniform vec2 offset;

uniform float pixelSize;

void main(void)
{
	// we might not need the last term
	vec2 uv = ((floor((gl_FragCoord.xy - offset) / pixelSize ) * 0.5) * pixelSize + offset) / sketchSize + vec2(0.5) / sketchSize;
	gl_FragColor = texture2D(texture, uv);
}
