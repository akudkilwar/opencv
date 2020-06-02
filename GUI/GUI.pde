import uibooster.*;
import uibooster.components.*;
import uibooster.model.*;
import uibooster.model.formelements.*;
import uibooster.utils.*;

void setup() {
  size(600, 600);
  
  WaitingDialog dialog = new UiBooster().showWaitingDialog("Starting", "Please wait");

  while (millis() < 2000) {
    dialog.setMessage("Ready");
  }
  dialog.close();
  
  new UiBooster().showInfoDialog("About: The function of this program is to prevent multiple people from being \nin the computer display's range of view in order to preserve the privacy of \nthe user. For proper functioning, the target must be in the range of the \ncomputer's webcam. \n\nThis program was created by Atharva Kudkilwar. \n\nClick OK to start session.");
}

void draw() {

  

  
}
