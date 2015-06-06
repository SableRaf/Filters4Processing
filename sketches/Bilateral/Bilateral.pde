
// Bilateral smoothing

// Original shader by mrharicot
// https://www.shadertoy.com/view/4dfGDH

// Ported to Processing by Raphaël de Courville <twitter: @sableRaph>

// Hold mouse click to show unfiltered image

PShader bilateral; 
PImage  myImage;

void setup() {

  size( 512, 512, P2D );
  
  myImage  = loadImage( "texture.jpg" );
  bilateral = loadShader( "bilateral.glsl" );
  
  bilateral.set("sketchSize", float(width), float(height));

}


void draw() {

  background(0);  

  // Draw the image on the scene
  image( myImage, 0, 0 );

  if( !mousePressed ) {
    // Applies the shader to everything that has already been drawn
    filter( bilateral );
  }

}
