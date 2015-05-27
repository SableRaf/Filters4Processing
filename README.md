Filters4Processing
==================

Filters4Processing is a growing collection of filters for Processing, most of them ported from Shadertoy. 

## Filters

### Barrel Blur Chroma
![screenshot](https://github.com/SableRaf/Filters4Processing/blob/master/screenshots/BarrelBlurChroma.jpg)

### Barrel & Pincushion
![screenshot](https://github.com/SableRaf/Filters4Processing/blob/master/screenshots/BarrelPincushion.png)

### Bicubic Filter
![screenshot](https://github.com/SableRaf/Filters4Processing/blob/master/screenshots/Bicubic.jpg)

### Bilateral Filter (denoise)
![screenshot](https://github.com/SableRaf/Filters4Processing/blob/master/screenshots/Bilateral.jpg)

### Contrast, Saturation, Brightness
![screenshot](https://github.com/SableRaf/Filters4Processing/blob/master/screenshots/ConSatBri.jpg)

### Dithering
![screenshot](https://github.com/SableRaf/Filters4Processing/blob/master/screenshots/Dithering.jpg)

### Edge filter
![screenshot](https://github.com/SableRaf/Filters4Processing/blob/master/screenshots/Edge.jpg)

## Usage

This is a minimal example showing how to import shader file in Processing and use it as a filter. 

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

  // Applie the shader to the scene
  filter( myFilter );

}
```

Note: Some shaders require additional uniforms. Refer to the example sketches included for details.


## Notes about porting filters from Shadertoy

Here are some useful tips if you want to help extend the library of filters available for Processing.

Replace:
`void mainImage( out vec4 fragColor, in vec2 fragCoord )` -> `void main( void )`

Replace all:
* `iChannel0` -> `texture`
* `fragCoord` -> `gl_FragCoord`
* `fragColor` -> `gl_FragColor`

There is more to it than this but these tips should cover most basic filters.

Now go dig for some [filters](https://www.shadertoy.com/results?query=filter)!

*Note: It is possible to port other types of shaders, but this repository focuses on filters.*

## License
All shaders from Shadertoy belong to there respective authors. Unless otherwise specified in the shader file, they are licensed under Creative Commons ([CC BY-NC-SA 3.0](http://creativecommons.org/licenses/by-nc-sa/3.0/deed.en_US))