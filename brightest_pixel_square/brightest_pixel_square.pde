import processing.video.*;

Capture video;

void setup() {
  size(640, 480);
  // Uses the default video input, see the reference if this causes an error
  video = new Capture(this, width, height);
  video.start();  
  noStroke();
  smooth();
}


void draw() {
  fill(4,23,5);
  rect(0,0,12,480);
  fill(45, 56, 200);
  rect(24, 0, 36, 480);
  fill(255,255,25);
  rect (48, 0, 48, 480);
  rect(96, 0, 96, 480);
  rect(120, 0, 34, 480, 10);
  
  if (video.available()) {
    video.read();
    image(video, 0, 0, width, height); // Draw the camera video onto the screen

    int brightestX = 0; // X-coordinate of the brightest video pixel
    int brightestY = 0; // Y-coordinate of the brightest video pixel

    float brightestValue = 0; // Brightness of the brightest video pixel
    // Search for the brightest pixel: For each row of pixels in the video image and
    // for each pixel in the yth row, compute each pixel's index in the video
    video.loadPixels();
    int index = 0; // assign 0 to index at start
    for (int y = 0; y < video.height; y++) {
      for (int x = 0; x < video.width; x++) {
        // Get the color stored in each pixel
        int pixelValue = video.pixels[index];
        // Determine the brightness of the pixel
        float pixelBrightness = brightness(pixelValue);
        // If that value is brighter than any previous, then store the
        // brightness of that pixel, as well as its (x,y) location
        if (pixelBrightness > brightestValue) {
        // logic to find brightest pixel 
          brightestValue = pixelBrightness;
          brightestY = y;
          brightestX = x;
        }
        index++; // update index by 1
      }
    }
    // Draw a large, yellow circle centered at the brightest pixel
    fill(255, 204, 0, 128);
    rect(brightestX, brightestY, 200, 200);
    fill(23, 255, 45,128);
    rect(brightestX, brightestY, 400, 400);
    updatePixels();
  }
}
