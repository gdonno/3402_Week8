/*
 * Creative Coding
 * Week 2, Foldout 02: Conditionals: if statement
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 
 * This program illustrates the use of the if statement.
 * The general form is:
 * if (condition) {
 *   execute the code between the { and }
 *   if the condition is true
 * } else {
 *   executre the code
 *   in here
 * }
 *
 * The else { ... } component is optional.
 * 
 */   
import processing.video.*;

Capture video;

void setup() {
  size(640, 300);
  video = new Capture(this, width, height);
  video.start();  
  noStroke();
  smooth();
}

void draw() {
  background(0);
  
  stroke(255); 
  
  for (int i = 0; i < width; i += 4) {
    if (i%3 == 0) {
      // this section of code is executed if the remainder of
      // dividing i by 4 equals 0
       strokeWeight(1);
      line(i, 0, i, 100);
    }
    else if (i%3 == 1) {
      // this section is executed if i%4 == 1
       strokeWeight(2);
      line(i, 100, i, 200);
    }
    else if (i%3 == 2) {
      // this section if i%4 == 2
      // you can have as many lines of code as you like
      // between the opening and closing { }
      // You can even have other if statements!
       strokeWeight(3);
      line(i, 200, i, 300);
    //} // end if
    //else if (i%4 == 3) {
    //  // this section if i%4 == 3
    //  // you can have as many lines of code as you like
    //  // between the opening and closing { }
    //  // You can even have other if statements!
      strokeWeight(4);
      line(i, 300, i, 400);
    } // end if
  } // end for
  
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
    updatePixels();
  }
  
  
} // end draw
