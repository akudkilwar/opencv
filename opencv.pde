import processing.sound.*;
import gab.opencv.*;
import processing.video.*;
import java.awt.*;

import uibooster.*;
import uibooster.components.*;
import uibooster.model.*;
import uibooster.model.formelements.*;
import uibooster.utils.*;

Capture video;
OpenCV opencv;
SoundFile file;
int numUsers = 0;

void setup() {
  
  size(640, 480);
  videoSetup();
}

void draw() {
  scale(2);
  opencv.loadImage(video);

  image(video, 0, 0 );

  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  Rectangle[] faces = opencv.detect();
  println(faces.length);
  
  playSound(faces);
  
}

void captureEvent(Capture c) {
  c.read();
}

void playSound(Rectangle[] faces) {
  if(faces.length > numUsers) {
    file.play();
  }

  for (int i = 0; i < faces.length; i++) {
    println(faces[i].x + "," + faces[i].y);
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
  }
}

void videoSetup() {
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  file = new SoundFile(this, "C:/Users/akudk/Desktop/carhorn.mp3");

  video.start();
}

void GUI_setup() {
  
  WaitingDialog dialog = new UiBooster().showWaitingDialog("Starting", "Please wait");

  while (millis() < 2000) {
    dialog.setMessage("Ready");
  }
  dialog.close();
  
  new UiBooster().showInfoDialog("About: The function of this program is to prevent multiple people from being \nin the computer display's range of view in order to preserve the privacy of \nthe user. For proper functioning, the target must be in the range of the \ncomputer's webcam. \n\nThis program was created by Atharva Kudkilwar. \n\nClick OK to start session.");
}
