package site.components.popUpWindows.myPhotos {
import flashx.textLayout.container.ScrollPolicy;

import mx.events.CloseEvent;

import mx.managers.PopUpManager;

import site.components.popUpWindows.MyTitleWindow;

public class MyPhotoWindow extends MyTitleWindow {
 
	public function MyPhotoWindow() {
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
    styleName = "myPhotoWindow";
	horizontalScrollPolicy = "off";
	verticalScrollPolicy = "off"; 
    
	width = 770;
    height = 600;
	
	//setStyle("dropShadowColor", 0x707070);
    //setStyle("titleStyleName", "titleName")
    //setStyle("shadowDistance", 2);
    //window.setStyle("shadowDirection", "right");
  }
}
}