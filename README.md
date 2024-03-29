Filters4Processing
==================

A growing collection of pixel shaders ported to Processing to be used with the `filter()` function. Most of these shaders come from the excellent [Shadertoy](https://www.shadertoy.com) by Iñigo Quilez.

*Note: This repository focuses on filters. If you want to port any other type of shader from Shadertoy to Processing, check out this other repository [Shadertoy2Processing](https://github.com/SableRaf/Shadertoy2Processing)*

## Filters

### Gaussian blur
![screenshot](https://github.com/SableRaf/Filters4Processing/blob/master/screenshots/GaussianBlur.jpg)

_Original shader by Callum Hay: http://callumhay.blogspot.com/2010/09/gaussian-blur-shader-glsl.html_

### Barrel Blur Chroma
![screenshot](https://github.com/SableRaf/Filters4Processing/blob/master/screenshots/BarrelBlurChroma.jpg) 

_Original shader by hornet: https://www.shadertoy.com/view/XssGz8_

### Barrel & Pincushion
![screenshot](https://github.com/SableRaf/Filters4Processing/blob/master/screenshots/BarrelPincushion.png)

_Original shader by SanchYESS: https://www.shadertoy.com/view/4s2GRR_

### Bicubic Filter
![screenshot](https://github.com/SableRaf/Filters4Processing/blob/master/screenshots/Bicubic.jpg)

_Original shader by inigo quilez - iq/2013 ([CC BY-NC-SA 3.0](https://creativecommons.org/licenses/by-nc-sa/3.0/))_

### Bilateral Filter (denoise)
![screenshot](https://github.com/SableRaf/Filters4Processing/blob/master/screenshots/Bilateral.jpg)

_Original shader by mrharicot: https://www.shadertoy.com/view/4dfGDH_

### Contrast, Saturation, Brightness
![screenshot](https://github.com/SableRaf/Filters4Processing/blob/master/screenshots/ConSatBri.jpg)

_Original shader by Romain Dura: http://mouaif.wordpress.com/?p=94_

### Dithering
![screenshot](https://github.com/SableRaf/Filters4Processing/blob/master/screenshots/Dithering.jpg)

_Original shader by RavenWorks: https://www.shadertoy.com/view/Xs23zW_

### Edge filter
![screenshot](https://github.com/SableRaf/Filters4Processing/blob/master/screenshots/Edge.jpg)

_Original shader by Ken Slade: https://www.shadertoy.com/view/ldsSWr_

### Metaballs
![screenshot](https://github.com/SableRaf/Filters4Processing/blob/master/screenshots/Metaballs.jpg)

_Uses the blur shader by Callum Hay: http://callumhay.blogspot.com/2010/09/gaussian-blur-shader-glsl.html_

### Droste
![screenshot](https://github.com/SableRaf/Filters4Processing/blob/master/screenshots/Droste.png)

_Original shader by ArKano22: http://www.gamedev.net/topic/590070-glsl-droste/ (adapted by @monkstone)_

## Usage

This is a minimal example showing how to import a shader file in Processing and use it as a filter.

*Note: Some shaders require additional uniforms. For details, refer to the example sketches included.*

```Processing

// Create an image object
PImage  myImage;

// Create a shader object
PShader myFilter;

void setup() {

  size( 512, 512, P2D );

  // Import the image file
  myImage  = loadImage( "texture.jpg" );

  // Import the shader file
  myFilter = loadShader( "shader.glsl" );

  // Pass the size of the window to the shader
  myFilter.set("sketchSize", float(width), float(height));

}

void draw() {

  // Draw the image on the scene
  image( myImage, 0, 0 );

  // Apply the shader to the scene
  filter( myFilter );

}
```

## Notes about porting filters from Shadertoy

Shadertoy and Processing both have their own quirks when it comes to shader programming. We need to make some changes in order to make Shadertoy code work with Processing.

Replace:
`void mainImage( out vec4 fragColor, in vec2 fragCoord )` -> `void main( void )`

Replace all:
* `iChannel0` -> `texture`
* `fragCoord` -> `gl_FragCoord`
* `fragColor` -> `gl_FragColor`

There is more to it than this but these tips should cover most basic filters.

Now go dig for some [shaders](https://www.shadertoy.com/results?query=filter) and help us extend the library of filters available for Processing!

## Acknowledgments
Thanks to all the Shadertoy contributors for their hard work. This collection wouldn't exist without them. Thanks to Andres Colubri for his work on the Processing Shader API.

## License
All shaders from Shadertoy belong to there respective authors. Unless otherwise specified in the shader file, they are licensed under Creative Commons ([CC BY-NC-SA 3.0](http://creativecommons.org/licenses/by-nc-sa/3.0/deed.en_US))
