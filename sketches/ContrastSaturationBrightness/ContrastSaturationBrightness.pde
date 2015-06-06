
PShader csb;
PImage  myImage;

void setup() {

  size( 512, 512, P2D );
  
  myImage  = loadImage( "texture.jpg" );
  
  csb = loadShader( "ContrastSaturationBrightness.glsl" );

}


void draw() {

  background(0);

  // Draw the image on the scene
  image( myImage, 0, 0 );
  
  // Value range is [0.0, 1.0] for each setting
  float c = 1.0; // Contrast is maximum
  float s = map( mouseX / (float) width,  0.0, 1.0, 0.0, 1.5 ); // map the saturation to the horizontal position of the cursor
  float b = map( mouseY / (float) height, 0.0, 1.0, 0.3, 1.5 ); // map the brightness to the vertical position of the cursor

  // Pass the parameters to the shader
  csb.set( "contrast",   c );
  csb.set( "saturation", s );
  csb.set( "brightness", b );

  // Applies the shader to everything that has already been drawn
  filter( csb );

}
