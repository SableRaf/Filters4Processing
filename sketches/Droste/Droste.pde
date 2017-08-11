// Pixelate effect
// Original shader by SCORPION
// https://www.shadertoy.com/view/4tlGRn
// Ported to processing by Martin Prout
// Hold mouse click to show unfiltered image
PShader droste;
PImage myImage;
int m;

void setup() {
  size(512, 512, P2D);
  myImage  = loadImage("texture.jpg");
  droste = loadShader("droste.glsl");
  droste.set("sketchSize", float(width), float(height));
  m = millis();
}

void draw() {
  background(0);
  // Draw the image on the scene 
  int now = millis();
  image(myImage, 0, 0);
  droste.set("globalTime", now - m);
  // Applies the shader to everything that has already been drawn
  if (!mousePressed) {
    filter(droste);
  }
}