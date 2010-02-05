package site.components.popUpWindows.profile {
import mx.events.CloseEvent;
import mx.managers.PopUpManager;

import site.components.popUpWindows.MyTitleWindow;

public class ProfileWindow_ extends MyTitleWindow {
  public var photoViewer;

  public function ProfileWindow_() {
    super();
    layout = "horizontal";
    addEventListener(CloseEvent.CLOSE, closeWindow);
  }

  public function initWindow(name:String):void {
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

  public function setStyles1():void {
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
    width = 650;
    height = 400;
    //setStyle("dropShadowColor", 0x707070);
    //setStyle("titleStyleName", "titleName")
    //setStyle("shadowDistance", 2);
    //window.setStyle("shadowDirection", "right");
  }
}
}