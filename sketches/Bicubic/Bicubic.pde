
// Bicubic filtering (see shader file for details)

// Hold mouse click to show regular texture map filtering

PShader bicubic;
PImage  myImage;

void setup() {

  size( 512, 512, P2D );
  
  myImage  = loadImage( "texture.jpg" );
  bicubic = loadShader( "bicubic.glsl" );
  
  bicubic.set("sketchSize", float(width), float(height));

}


void draw() {

  background(0);  

  // Draw the image on the scene
  image( myImage, 0, 0 );
  
  bicubic.set("mode", mousePressed ? 0 : 1);
  
  float oscillation = map( sin(frameCount*0.005), -1.0, 1.0, 0.1, 0.5 );
  
  bicubic.set("zoomLevel", oscillation );

  // Applies the shader to everything that has already been drawn
  filter( bicubic );

}
