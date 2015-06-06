
// This is a more flexible gaussian blur than 
// the one included in the Processing shader examples
// Source: http://forum.processing.org/two/discussion/comment/24078/#Comment_24078

// Move the cursor around to change the parameters of the blur

PShader gaussianBlur;

PImage myImage;

void setup() {

  size(500, 500, P2D);
  
  myImage = loadImage("texture.jpg");
  
  // Load and configure the filters
  gaussianBlur = loadShader("gaussianBlur.glsl");
  gaussianBlur.set("kernelSize", 32); // How big is the sampling kernel?
  gaussianBlur.set("strength", 7.0); // How strong is the blur?
  
}

void draw() {  

  image(myImage, 0, 0);
  
  // Control the values with the mouse
  float strength = map( mouseX, 0.0, width, 0.1, 9.0);
  int kernelSize = (int) map( mouseY, 0.0, height, 3.0, 32.0);
  gaussianBlur.set("strength", strength); 
  gaussianBlur.set("kernelSize", kernelSize);
    
  // Vertical pass
  gaussianBlur.set("horizontalPass", 0);
  filter(gauss ianBlur);
  
  // Horizontal pass
  gaussianBlur.set("horizontalPass", 1);
  filter(gaussianBlur);
  
  // Show the values on screen
  noStroke();
  fill(0, 100);
  rect(5,5,130,45);
  fill(255);
  text("kernel size =" + kernelSize, 10, 20);
  text("blur strength =" + nf(strength, 1, 2), 10, 40);
  
}

