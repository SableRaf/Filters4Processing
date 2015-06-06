
// Note: this filter is meant to be used on black & white images

// The 2D metaball filter is a combination of blur and threshold
PShader gaussianBlur, threshold;

void setup() {

  size(500, 500, P2D);
    
  // Load and configure the filters
  gaussianBlur = loadShader("gaussianBlur.glsl");
  gaussianBlur.set("kernelSize", 32); // How big is the sampling kernel?
  gaussianBlur.set("strength", 7.0); // How strong is the blur?
  
  threshold = loadShader("threshold.glsl");
  threshold.set("threshold", 0.5);
  threshold.set("antialiasing", 0.05); // values between 0.00 and 0.10 work best
  
}

void draw() {  
   
  background(255);
  
  // Draw some moving circles
  translate(width/2,height/2);
  noStroke();
  fill(0);
  ellipse(0, 0, 100, 100);
  float x = map(sin(frameCount*0.01), -1.0, 1.0, -120.0, 120.0);
  ellipse(x, 0, 100, 100);
  ellipse(-x, 0, 100, 100);
  float y = map(sin(frameCount*0.01), -1.0, 1.0, -120.0, 120.0);
  ellipse(0, y, 100, 100);
  ellipse(0, -y, 100, 100);
  
  // Vertical blur pass
  gaussianBlur.set("horizontalPass", 0);
  filter(gaussianBlur);
  
  // Horizontal blur pass
  gaussianBlur.set("horizontalPass", 1);
  filter(gaussianBlur);
  
  filter(threshold);
  
}

