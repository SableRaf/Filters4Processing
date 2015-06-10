
// Pixelate effect

// Original shader by simesgreen
// https://www.shadertoy.com/view/4sl3zr

// Ported to Processing by Raphaël de Courville <twitter: @sableRaph>

// Hold mouse click to show unfiltered image

// Note: this version has unwanted artifacts that do not appear on the shadertoy original
// See http://forum.processing.org/two/discussion/1723/unwanted-artifacts-in-a-simple-pixelation-shader

// Now based on the following shadertoy sketch
// https://www.shadertoy.com/view/ltjGDh

PShader myFilter;
PImage  myImage;

void setup() {

  size( 512, 512, P2D );
  
  myImage  = loadImage( "texture.jpg" );
  myFilter = loadShader( "shader.glsl" );
  
  myFilter.set("sketchSize", float(width), float(height));

}


void draw() {

  background(0);  

  // Draw the image on the scene
  image( myImage, 0, 0 );
  
  // works only on even pixel sizes, we need to ensure that
  // we use oscillation as pixel size
  float oscillation = makeEven(floor(map( sin(frameCount*0.01), -1.0, 1.0, 2, width )));

  // we add and offset, so the origin of the pixelation is in the middle of the screen
  // this paramater also needs to be an even integer
  float offset_x = makeEven(width % oscillation * 0.5f);
  float offset_y = makeEven(height % oscillation * 0.5f);
  
  myFilter.set("pixelSize", oscillation );
  myFilter.set("offset", offset_x, offset_y );

  if( !mousePressed ) {
    // Applies the shader to everything that has already been drawn
    filter( myFilter );
  }

}

int makeEven(float source) {
  return floor(source / 2f) * 2;
}