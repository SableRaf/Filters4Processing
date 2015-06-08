// Fake Floyd-Steinberg dithering
// https://www.shadertoy.com/view/4sjGRD

// Adapted for Processing by Martin Prout <@monkstoneT>

import processing.video.*;

PShader steinberg;
Capture cam;

void setup() {
  size(640, 480, P2D);
  steinberg = loadShader("steinberg.glsl");
  steinberg.set("sketchSize", (float)width, (float)height);
  startCapture(width, height);
}

void startCapture(int w, int h) {
  cam = new Capture(this, w, h);
  cam.start();
}

void draw(){
  image(cam, 0, 0);
  if (!mousePressed) {
  filter(steinberg);
  }
}


void captureEvent(Capture c) {
  c.read();
}
