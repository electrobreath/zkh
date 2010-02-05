package site.components.middleArea {
import flash.events.Event;
import flash.events.MouseEvent;
import flash.geom.Rectangle;
import flash.ui.Mouse;

import mx.controls.DataGrid;


import mx.events.ModuleEvent;
import mx.managers.PopUpManager;

import site.components.popUpWindows.PopUpStore;
import site.components.popUpWindows.messages.MessageWindow;
import site.components.popUpWindows.myPhotos.MyPhotoWindow;
import site.components.popUpWindows.searchUsers.SearchWindow;
import site.mainPage.MainPageModel;
import site.util.UserHandler;

import spark.components.Button;
import spark.components.HGroup;
import spark.components.Label;
import spark.components.Panel;
import spark.components.VGroup;

public class UserWindowsHandler_ extends VGroup {
  private var buttons:VGroup;
  private var messageButtons:HGroup;
  private var searchButton:Button;
  private var friendButton:Button;
  private var photoButton:Button;

  public function UserWindowsHandler_() {
    super();
    visible = false;
    name = "userPanels";
    buttons = new VGroup();
    buttons.gap = 12;
    buttons.paddingTop = 10;
    buttons.paddingLeft = 10;
    buttons.alpha = 0.7;
    buttons.percentWidth = 100;
    buttons.height = 300;

    createMessageWindows();
    createSearchWindow();
    createFriendsWindow();
    createMyPhotosWindows();

    buttons.addElement(messageButtons);
    buttons.addElement(searchButton);
    buttons.addElement(friendButton);
    buttons.addElement(photoButton);
    addElement(buttons);
  }

  private function createSearchWindow():void {
    searchButton = new Button();
    searchButton.width = 120;
    searchButton.height = 48;
    searchButton.label = "поиск жильцов";
    var win:SearchWindow = SearchWindow(PopUpManager.createPopUp(MainPageModel.getMiddleArea(), SearchWindow, false));
    win.initWindow("поиск жильцов");
    PopUpManager.centerPopUp(win);
    PopUpStore.addWindow(win);
    searchButton.addEventListener(MouseEvent.CLICK, function(event:Event) {
      win.visible = !win.visible;
    });
  }

  private function createMessageWindows():void {
    messageButtons = new HGroup();
    messageButtons.width = 120;
    messageButtons.height = 48;
    var incomingMessageButton:Button = new Button();
    incomingMessageButton.height = 48;
    incomingMessageButton.width = 57;
    incomingMessageButton.label = "входящие";
    incomingMessageButton.setStyle("fontSize", 12);
    incomingMessageButton.setStyle("fontFamily", "tahoma");
    incomingMessageButton.toolTip = "входящие";
    var outcomingMessageButton:Button = new Button();
    outcomingMessageButton.height = 48;
    outcomingMessageButton.width = 57;
    outcomingMessageButton.label = "исходящие";
    outcomingMessageButton.setStyle("fontSize", 12);
    outcomingMessageButton.setStyle("fontFamily", "tahoma");
    outcomingMessageButton.toolTip = "исходящие";
    messageButtons.addElement(incomingMessageButton);
    messageButtons.addElement(outcomingMessageButton);

    var incomingWin:MessageWindow = MessageWindow(PopUpManager.createPopUp(MainPageModel.getMiddleArea(), MessageWindow, false));
    incomingWin.initWindow("входящие сообщения");
    incomingWin.getIncomingForm().setFormButton(incomingMessageButton);
    PopUpManager.centerPopUp(incomingWin);
    PopUpStore.addWindow(incomingWin);
    incomingMessageButton.addEventListener(MouseEvent.CLICK, function(event:Event) {
      if(!incomingWin.visible) {
        incomingWin.updateIncomingMessages();
      }
      incomingWin.visible = !incomingWin.visible;
    });

    var outcomingWin:MessageWindow = MessageWindow(PopUpManager.createPopUp(MainPageModel.getMiddleArea(), MessageWindow, false));
    outcomingWin.initWindow("отправленные сообщения");
    outcomingWin.getOutcomingForm().setFormButton(outcomingMessageButton);
    PopUpManager.centerPopUp(outcomingWin);
    PopUpStore.addWindow(outcomingWin);
    outcomingMessageButton.addEventListener(MouseEvent.CLICK, function(event:Event) {
      if(!outcomingWin.visible) {
        outcomingWin.updateOutcomingMessages();
      }
      outcomingWin.visible = !outcomingWin.visible;
    });
  }

  private function createFriendsWindow():void {
    friendButton = new Button();
    friendButton.width = 120;
    friendButton.height = 48;
    friendButton.label = "друзья";
  }

  private function createMyPhotosWindows():void {
    photoButton = new Button();
    photoButton.width = 120;
    photoButton.height = 48;
    photoButton.label = "мои фотографии";

    var win:MyPhotoWindow = MyPhotoWindow(PopUpManager.createPopUp(MainPageModel.getMiddleArea(), MyPhotoWindow, false));
    win.initWindow("мои фотографии");
    PopUpManager.centerPopUp(win);
    PopUpStore.addWindow(win);
    photoButton.addEventListener(MouseEvent.CLICK, function(event:Event) {
      win.visible = !win.visible;
    });

  }

  public function hideAllPopUpWindows():void {
    PopUpStore.hideAllWindows();
  }

  public function updateIncomingMessages():void {
    (PopUpStore.getWindowByName(MessageWindow.incoming) as MessageWindow).updateIncomingMessages();
  }

  public function updateOutcomingMessages():void {
    (PopUpStore.getWindowByName(MessageWindow.outcoming) as MessageWindow).updateOutcomingMessages();
  }
}
}