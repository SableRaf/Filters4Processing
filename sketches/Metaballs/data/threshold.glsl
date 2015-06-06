#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

uniform sampler2D texture;
varying vec4 vertTexCoord;

uniform float threshold;
uniform float antialiasing;

void main(void) {
  
  vec2 coord = vertTexCoord.st;

  // Get the color of the pixel at our fragment's coordinates
  vec4 pixel = texture2D( texture, coord );

  gl_FragColor = vec4(smoothstep(threshold - antialiasing, threshold + antialiasing, pixel.r));
}
