
// Pixelate effect

// Original shader by simesgreen
// https://www.shadertoy.com/view/4sl3zr

// Ported to Processing by Raphaël de Courville <twitter: @sableRaph>

// Hold mouse click to show unfiltered image

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
  
  float oscillation = floor(map( sin(frameCount*0.005), -1.0, 1.0, 10, 30 ));
  
  myFilter.set("division", oscillation );

  if( !mousePressed ) {
    // Applies the shader to everything that has already been drawn
    filter( myFilter );
  }

}
