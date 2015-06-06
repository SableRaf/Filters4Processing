
PShader dithering;
PImage  sourceImage, noiseImage;

void setup() {

  size( 512, 512, P2D );
  
  sourceImage  = loadImage( "texture.jpg" ); 
  noiseImage  = loadImage( "noise.png" );
  
  dithering = loadShader( "dithering.glsl" );
  
  dithering.set("sketchSize", float(width), float(height));
  
  dithering.set("noiseTexture", noiseImage);
 
}


void draw() {

  background(0);

  // Draw the image on the scene
  image( sourceImage, 0, 0 );

  // Applies the shader to everything that has already been drawn
  filter( dithering );

}
