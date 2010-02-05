package site.components.popUpWindows.register {
import site.components.popUpWindows.*;

import mx.events.CloseEvent;

import mx.managers.PopUpManager;

import site.components.popUpWindows.MyTitleWindow;

public class RegisterWindow_ extends MyTitleWindow {
  public function RegisterWindow_() {
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
    setStyle("cornerRadius", 0);
    width = 450;
    height = 400;
    //setStyle("dropShadowColor", 0x707070);
    //setStyle("titleStyleName", "titleName")
    //setStyle("shadowDistance", 2);
    //window.setStyle("shadowDirection", "right");
  }

}
}