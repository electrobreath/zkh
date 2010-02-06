package site.components.popUpWindows.setting {
import site.components.popUpWindows.*;

import mx.events.CloseEvent;
import mx.managers.PopUpManager;

import site.components.popUpWindows.MyTitleWindow;

public class SettingWindow extends MyTitleWindow {
  public function SettingWindow() {
    super();
    addEventListener(CloseEvent.CLOSE, closeWindow);
  }

  public function initWindow(name:String):void {
    init(name);
  }

  private function closeWindow(event:CloseEvent):void {
    removeEventListener(CloseEvent.CLOSE, closeWindow);
    removeAllChildren();
    PopUpManager.removePopUp(this);
  }

  override public function setStyles():void {
    styleName = "settingsWindow";
    width = 650;
    height = 463;
    y = 45;
    x = 167;
    //setStyle("dropShadowColor", 0x707070);
    //setStyle("titleStyleName", "titleName")
    //setStyle("shadowDistance", 2);
    //window.setStyle("shadowDirection", "right");
  }

}
}