
// Bilinear smoothing

// Original shader by mrharicot
// https://www.shadertoy.com/view/4dfGDH

// Ported to Processing by Raphaël de Courville <twitter: @sableRaph>

// Hold mouse click to show unfiltered image

PShader fisheyePincushion;
PImage  myImage;

void setup() {

  size( 512, 512, P2D );
  
  myImage  = loadImage( "texture.jpg" );

  fisheyePincushion = loadShader( "fisheyePincushion.glsl" );
  
  fisheyePincushion.set("sketchSize", float(width), float(height));

}


void draw() {

  background(0);  

  // Draw the image on the scene
  image( myImage, 0, 0 );
  
  // Set the fisheye amount (the range is between -0.5 and 0.5)
  // Negative for pincushion and positive for fisheye
  fisheyePincushion.set("amount", sin(frameCount * 0.01) * 0.5 );

  if( !mousePressed ) {
    // Applies the shader to everything that has already been drawn
    filter( fisheyePincushion );
  }

}
