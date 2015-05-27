
// Hold mouse click to disable the filter temporarily

// The videoclip is from NASA: http://youtu.be/CBwdZ1yloHA

import processing.video.*;
Movie movie;

// Create the shader object
PShader myShader;

// How much barrel effect do we want?
// Values between 0.5 and 3.0 work best, but feel free to try other values
float barrel = 2.2;

void setup() {

  size(640, 360, P2D);
 
  // Load and play the video in a loop
  movie = new Movie(this, "iss.mov");
  movie.loop();
  
  // Load and configure the shader
  myShader = loadShader("shader.glsl");
  myShader.set("sketchSize", float(width), float(height));
  myShader.set("barrelPower", barrel);

}

// Read each new frame of the movie
void movieEvent(Movie m) {
  m.read();
}

void draw() {  

  image(movie, 0, 0, width, height);

  if( !mousePressed ) {
    filter(myShader);
  }
  
}
