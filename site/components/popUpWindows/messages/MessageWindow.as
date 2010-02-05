package site.components.popUpWindows.messages {
import site.components.popUpWindows.*;
import site.components.popUpWindows.messages.*;

import mx.events.CloseEvent;
import mx.managers.PopUpManager;

import site.components.popUpWindows.MyTitleWindow;
import site.components.popUpWindows.PopUpStore;

public class MessageWindow extends MyTitleWindow {
  private var incomingMessageForm:IncomingMessageForm;
  private var outcomingMessageForm:OutcomingMessageForm;
  public static var incoming:String = "incoming";
  public static var outcoming:String = "outcoming";

  public function MessageWindow() {
    super();
    visible = false;
    horizontalScrollPolicy = "off";
    verticalScrollPolicy = "off";
    addEventListener(CloseEvent.CLOSE, closeWindow);
  }

  public function initWindow(name:String):void {
    init(name);
    if (name == "входящие сообщения") {
      this.name = incoming;
      addChild(incomingMessageForm = new IncomingMessageForm());
      incomingMessageForm.startAutoUpdate();
    }
    if (name == "отправленные сообщения") {
      this.name = outcoming;
      addChild(outcomingMessageForm = new OutcomingMessageForm());
    }
  }

  public function updateIncomingMessages():void {
    incomingMessageForm.updateIncomingMessages();
  }

  public function updateOutcomingMessages():void {
    outcomingMessageForm.updateOutcomingMessages();
  }

  public function getIncomingForm():IncomingMessageForm {
    return incomingMessageForm;
  }

  public function getOutcomingForm():OutcomingMessageForm {
    return outcomingMessageForm;
  }

  private function closeWindow(event:CloseEvent):void {
    //removeEventListener(CloseEvent.CLOSE, closeWindow);
    //messageForm.stopAutoUpdateMessages();
    //removeAllChildren();
    //PopUpManager.removePopUp(this);
    visible = false;
  }

  override public function setStyles():void {
    styleName = "messageWindow";
    width = 750;
    height = 200;
    //setStyle("dropShadowColor", 0x707070);
    //setStyle("titleStyleName", "titleName")
    //setStyle("shadowDistance", 2);
    //window.setStyle("shadowDirection", "right");
  }
}
}