package site.components.popUpWindows.profile {
import mx.events.CloseEvent;
import mx.managers.PopUpManager;

import site.components.popUpWindows.MyTitleWindow;

public class ProfileWindow extends MyTitleWindow {
  public var photoViewer;

  public function ProfileWindow() {
    super();
    layout = "horizontal";
    addEventListener(CloseEvent.CLOSE, closeWindow);
  }

  public function initEditProfileWindow(name:String):void {
    init(name);
    addChild(new EditProfileForm());
  }

  public function initViewProfileWindow(name:String, id:Number):void {
    init(name);
    setStyles1();
    var viewProfileForm:ViewProfileForm = new ViewProfileForm();
    viewProfileForm.updateInfo(id);
    addChild(viewProfileForm);
    photoViewer = new PhotoViewer();
    photoViewer.updatePhotos(id);
    addChild(photoViewer);
  }

  private function closeWindow(event:CloseEvent):void {
    removeEventListener(CloseEvent.CLOSE, closeWindow);
    removeAllChildren();
    PopUpManager.removePopUp(this);
  }

  override public function setStyles():void {
    styleName = "profileWindow";
    horizontalScrollPolicy = "off";
    verticalScrollPolicy = "off";

    width = 470;
    height = 300;

    y = 45;
    x = 167;
    //setStyle("dropShadowColor", 0x707070);
    //setStyle("titleStyleName", "titleName")
    //setStyle("shadowDistance", 2);
    //window.setStyle("shadowDirection", "right");
  }

  public function setStyles1():void {
    //styleName = "profileWindow";

    width = 650;
    height = 400;

    //y = 45;
    //x = 167;
    //setStyle("dropShadowColor", 0x707070);
    //setStyle("titleStyleName", "titleName")
    //setStyle("shadowDistance", 2);
    //window.setStyle("shadowDirection", "right");
  }
}
}