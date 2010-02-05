package site.components.popUpWindows.register {
import site.components.popUpWindows.*;

import mx.events.CloseEvent;

import mx.managers.PopUpManager;

import site.components.popUpWindows.MyTitleWindow;

public class RegisterWindow extends MyTitleWindow {
  public function RegisterWindow() {
    super();
    addEventListener(CloseEvent.CLOSE, closeWindow);
  }

  public function initWindow(name:String):void {
    init(name);
    addChild(new RegisterForm());
  }

  private function closeWindow(event:CloseEvent):void {
    removeEventListener(CloseEvent.CLOSE, closeWindow);
    removeAllChildren();
    PopUpManager.removePopUp(this);
  }

  override public function setStyles():void {

    styleName = "registerWindow";

    width = 440;
    height = 400;
    y = 45;
    x = 167;
    /*
     setStyle("paddingTop", 0);
     setStyle("paddingBottom", 0);
     setStyle("paddingLeft", 0);
     setStyle("paddingRight", 0);
     setStyle("borderColor", "#707070");
     setStyle("borderAlpha", 0.5);
     setStyle("backgroundColor", "#707070");
     setStyle("backgroundAlpha", 0.5);

     setStyle("borderThicknessTop", 0);
     setStyle("borderThicknessBottom", 0);
     setStyle("borderThicknessRight", 0);
     setStyle("borderThicknessLeft", 0);
     setStyle("cornerRadius", 3);
     */

    //setStyle("dropShadowColor", 0x707070);
    //setStyle("titleStyleName", "titleName")
    //setStyle("shadowDistance", 2);
    //window.setStyle("shadowDirection", "right");
  }

}
}