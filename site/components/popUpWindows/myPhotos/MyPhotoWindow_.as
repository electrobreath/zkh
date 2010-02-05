package site.components.popUpWindows.myPhotos {
import mx.events.CloseEvent;

import mx.managers.PopUpManager;

import site.components.popUpWindows.MyTitleWindow;

public class MyPhotoWindow_ extends MyTitleWindow {
  public function MyPhotoWindow_() {
    super();
    visible = false;
    addEventListener(CloseEvent.CLOSE, closeWindow);
  }

  public function initWindow(name:String):void {
    init(name);
    addChild(new MyPhotoForm());
  }

  private function closeWindow(event:CloseEvent):void {
    //removeEventListener(CloseEvent.CLOSE, closeWindow);
    //removeAllChildren();
    //PopUpManager.removePopUp(this);
    visible = false;
  }

  override public function setStyles():void {
    setStyle("paddingTop", 0);
    setStyle("paddingBottom", 0);
    setStyle("paddingLeft", 0);
    setStyle("paddingRight", 0);
    setStyle("borderColor", "#707070");
    setStyle("borderAlpha", 0.5);
    setStyle("backgroundColor", "#000000");
    setStyle("backgroundAlpha", 0.5);
    setStyle("borderThicknessTop", 0);
    setStyle("borderThicknessBottom", 0);
    setStyle("borderThicknessRight", 0);
    setStyle("borderThicknessLeft", 0);
    setStyle("cornerRadius", 0);
    width = 470;
    height = 300;
    //setStyle("dropShadowColor", 0x707070);
    //setStyle("titleStyleName", "titleName")
    //setStyle("shadowDistance", 2);
    //window.setStyle("shadowDirection", "right");
  }
}
}