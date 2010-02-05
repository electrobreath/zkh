package site.components.popUpWindows.searchUsers {
import mx.events.CloseEvent;

import mx.managers.PopUpManager;

import site.components.popUpWindows.MyTitleWindow;
import site.components.popUpWindows.PopUpStore;

public class SearchWindow extends MyTitleWindow {
  public static const _name:String = "SEARCH_WINDOW";

  public function SearchWindow() {
    super();
    name = _name;
    visible = false;
    horizontalScrollPolicy = "off";
    verticalScrollPolicy = "off";
    addEventListener(CloseEvent.CLOSE, closeWindow);
  }

  public function initWindow(name:String):void {
    init(name);
    addChild(new SearchForm());
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
    setStyle("borderAlpha", 0.9);
    setStyle("backgroundColor", "#707070");
    setStyle("backgroundAlpha", 0.6);
    setStyle("borderThicknessTop", 0);
    setStyle("borderThicknessBottom", 0);
    setStyle("borderThicknessRight", 0);
    setStyle("borderThicknessLeft", 0);
    setStyle("cornerRadius", 0);
    width = 550;
    height = 100;
    //setStyle("dropShadowColor", 0x707070);
    //setStyle("titleStyleName", "titleName")
    //setStyle("shadowDistance", 2);
    //window.setStyle("shadowDirection", "right");
  }
}
}