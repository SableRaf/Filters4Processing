
// Original shader by hornet
// https://www.shadertoy.com/view/XssGz8

// Ported to Processing by Raphaël de Courville <twitter: @sableRaph>

#ifdef GL_ES
precision highp float;
#endif

// This line is optional from Processing 2.1 and up
#define PROCESSING_TEXTURE_SHADER

uniform sampler2D texture;

uniform vec2 sketchSize;

uniform float barrelPower;


const int num_iter = 12;
const float reci_num_iter_f = 1.0 / float(num_iter);

vec2 barrelDistortion(vec2 coord, float amt) {
    vec2 cc = coord - 0.5;
    float dist = dot(cc, cc);
    return coord + cc * dist * amt;
}

float sat( float t )
{
    return clamp( t, 0.0, 1.0 );
}

float linterp( float t ) {
    return sat( 1.0 - abs( 2.0*t - 1.0 ) );
}

float remap( float t, float a, float b ) {
    return sat( (t - a) / (b - a) );
}

vec3 spectrum_offset( float t ) {
    vec3 ret;
    float lo = step(t,0.5);
    float hi = 1.0-lo;
    float w = linterp( remap( t, 1.0/6.0, 5.0/6.0 ) );
    ret = vec3(lo,1.0,hi) * vec3(1.0-w, w, 1.0-w);

    return pow( ret, vec3(1.0/2.2) );
}

void main()
{   
    vec2 uv=(gl_FragCoord.xy/sketchSize.xy*.5)+.25;

    vec3 sumcol = vec3(0.0);
    vec3 sumw = vec3(0.0);  
    for ( int i=0; i<num_iter;++i )
    {
        float t = float(i) * reci_num_iter_f;
        vec3 w = spectrum_offset( t );
        sumw += w;
        sumcol += w * texture2D( texture, barrelDistortion(uv, barrelPower*t ) ).rgb;
    }
        
    gl_FragColor = vec4(sumcol.rgb / sumw, 1.0);
}