package site.components.middleArea {

import mx.effects.Glow;
import mx.managers.PopUpManager;

import flash.events.Event;
import flash.events.MouseEvent;

import site.components.popUpWindows.PopUpStore;
import site.components.popUpWindows.advertisement.AdvertisementWindow;
import site.components.popUpWindows.friends.FriendsWindow;
import site.components.popUpWindows.messages.MessageWindow;
import site.components.popUpWindows.myPhotos.MyPhotoWindow;
import site.components.popUpWindows.searchUsers.SearchWindow;
import site.mainPage.MainPageModel;

import spark.components.Button;
import spark.components.Label;
import spark.components.VGroup;

public class UserWindowsHandler extends VGroup {
  private var userPanel:VGroup;

  private var messagePanel:VGroup;
  private var actionPanel:VGroup;
  private var servicePanel:VGroup;

  private var searchButton:Button;
  private var friendButton:Button;
  private var photoButton:Button;
  private var forumButton:Button;
  private var advertisementButton:Button;

  private var glow:Glow;

  public function UserWindowsHandler() {
    super();
    visible = false;
    name = "userPanels";
    userPanel = new VGroup();
    userPanel.gap = 12;
    userPanel.paddingTop = 30;
    userPanel.paddingLeft = 10;
    userPanel.alpha = 0.7;
    userPanel.percentWidth = 100;
    userPanel.height = 300;
    greateGlow();

    createMessagePanel();
    createActionPanel();
    createServicePanel();
    // createSearchWindow();
    // createFriendsWindow();
    // createMyPhotosWindows();

    userPanel.addElement(messagePanel);
    userPanel.addElement(actionPanel);
    userPanel.addElement(servicePanel);
    //buttons.addElement(searchButton);
    //buttons.addElement(friendButton);
    //buttons.addElement(photoButton);
    addElement(userPanel);

  }

  private function createMessagePanel():void {
    messagePanel = new VGroup();
    messagePanel.styleName = "messageButtons"
    messagePanel.width = 120;
    messagePanel.height = 100;

    var incomingMessageButton:Button = new Button();
    incomingMessageButton.styleName = "messButton";
    incomingMessageButton.height = 30;
    incomingMessageButton.width = 120;
    incomingMessageButton.label = "входящие";
    incomingMessageButton.toolTip = "входящие";
    incomingMessageButton.setStyle("rollOverEffect", glow);

    var outcomingMessageButton:Button = new Button();
    outcomingMessageButton.styleName = "messButton";
    outcomingMessageButton.height = 30;
    outcomingMessageButton.width = 120;
    outcomingMessageButton.label = "исходящие";
    outcomingMessageButton.toolTip = "исходящие";
    outcomingMessageButton.setStyle("rollOverEffect", glow);

    var label:Label = new Label();
    label.text = "Cообщения";
    label.styleName = "messLabel";

    messagePanel.addElement(label);
    messagePanel.addElement(incomingMessageButton);
    messagePanel.addElement(outcomingMessageButton);

    var incomingWin:MessageWindow = MessageWindow(PopUpManager.createPopUp(MainPageModel.getMiddleArea(), MessageWindow, false));
    incomingWin.initWindow("входящие сообщения");
    incomingWin.getIncomingForm().setFormButton(incomingMessageButton);
    PopUpManager.centerPopUp(incomingWin);
    PopUpStore.addWindow(incomingWin);

    incomingMessageButton.addEventListener(MouseEvent.CLICK, function(event:Event) {
      if (!incomingWin.visible) {
        incomingWin.updateIncomingMessages();
        incomingWin.visible = !incomingWin.visible;
      }
      PopUpManager.bringToFront(incomingWin);

    });

    var outcomingWin:MessageWindow = MessageWindow(PopUpManager.createPopUp(MainPageModel.getMiddleArea(), MessageWindow, false));
    outcomingWin.initWindow("отправленные сообщения");
    outcomingWin.getOutcomingForm().setFormButton(outcomingMessageButton);
    PopUpManager.centerPopUp(outcomingWin);
    PopUpStore.addWindow(outcomingWin);
    outcomingMessageButton.addEventListener(MouseEvent.CLICK, function(event:Event) {
      if (!outcomingWin.visible) {
        outcomingWin.updateOutcomingMessages();
        outcomingWin.visible = !outcomingWin.visible;
      }
      //outcomingWin.visible = !outcomingWin.visible;
      PopUpManager.bringToFront(outcomingWin);
    });
  }

  private function createActionPanel():void {
    actionPanel = new VGroup();
    actionPanel.width = 120;
    actionPanel.height = 80;

    var label:Label = new Label();
    label.text = "Действия";
    label.styleName = "messLabel";
    actionPanel.addElement(label);
    actionPanel.addElement(createSearchWindow());
  }

  private function createServicePanel():void {
    servicePanel = new VGroup();
    servicePanel.width = 120;
    servicePanel.height = 120;


    var label:Label = new Label();
    label.text = "Сервисы";
    label.styleName = "messLabel";
    servicePanel.addElement(label);

    //servicePanel.addElement(createFriendsWindow());
    servicePanel.addElement(createMyPhotosWindows());
    servicePanel.addElement(createAdvertisementButton());
    servicePanel.addElement(createForumButton());
  }

  private function createSearchWindow():Button {
    searchButton = new Button();
    searchButton.width = 120;
    searchButton.height = 38;
    searchButton.label = "поиск жильцов";
    searchButton.setStyle("rollOverEffect", glow);

    var win:SearchWindow = SearchWindow(PopUpManager.createPopUp(MainPageModel.getMiddleArea(), SearchWindow, false));
    win.initWindow("поиск жильцов");
    PopUpManager.centerPopUp(win);
    PopUpStore.addWindow(win);

    searchButton.addEventListener(MouseEvent.CLICK, function(event:Event) {
      if (!win.visible) {
        win.visible = !win.visible;
      }
      PopUpManager.bringToFront(win);
    });
    return searchButton;
  }

  private function createFriendsWindow():Button {
    friendButton = new Button();
    friendButton.width = 120;
    friendButton.height = 38;
    friendButton.label = "друзья";
    friendButton.styleName = "friendButton";
    friendButton.setStyle("rollOverEffect", glow);

    var win:FriendsWindow = FriendsWindow(PopUpManager.createPopUp(MainPageModel.getMiddleArea(), FriendsWindow, false));
    win.initWindow("друзья");
    PopUpManager.centerPopUp(win);
    PopUpStore.addWindow(win);

    friendButton.addEventListener(MouseEvent.CLICK, function(event:Event) {
      if (!win.visible) {
        win.visible = !win.visible;
      }
      PopUpManager.bringToFront(win);
    });

    return friendButton;
  }

  private function createMyPhotosWindows():Button {
    photoButton = new Button();
    photoButton.width = 120;
    photoButton.height = 38;
    photoButton.label = "мои фотографии";
    photoButton.styleName = "photoButton";
    photoButton.setStyle("rollOverEffect", glow);

    var win:MyPhotoWindow = MyPhotoWindow(PopUpManager.createPopUp(MainPageModel.getMiddleArea(), MyPhotoWindow, false));

    win.initWindow("мои фотографии");

    PopUpManager.centerPopUp(win);
    PopUpStore.addWindow(win);
    photoButton.addEventListener(MouseEvent.CLICK, function(event:Event) {
      if (!win.visible) {
        win.visible = !win.visible;
      }
      PopUpManager.bringToFront(win);
    });
    return photoButton;
  }

  private function createForumButton():Button {
    forumButton = new Button();
    forumButton.width = 120;
    forumButton.height = 38;
    forumButton.label = "форум";
    forumButton.styleName = "forumButton";
    forumButton.setStyle("rollOverEffect", glow);
    return forumButton;

  }

  private function createAdvertisementButton():Button {
    advertisementButton = new Button();
    advertisementButton.width = 120;
    advertisementButton.height = 38;
    advertisementButton.label = "объявления";
    advertisementButton.styleName = "advertisementButton";
    advertisementButton.setStyle("rollOverEffect", glow);

    var win:AdvertisementWindow = AdvertisementWindow(PopUpManager.createPopUp(MainPageModel.getMiddleArea(), AdvertisementWindow, false));

    win.initWindow("объявления");

    PopUpManager.centerPopUp(win);

    PopUpStore.addWindow(win);
    advertisementButton.addEventListener(MouseEvent.CLICK, function(event:Event) {
      if (!win.visible) {
        win.visible = !win.visible;
      }

      PopUpManager.bringToFront(win);
    });

    return advertisementButton;

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

  private function greateGlow():void {
    glow = new Glow();
    glow.duration = 1000;
    glow.blurXFrom = 0;
    glow.blurXTo = 100;
    glow.blurYFrom = 0;
    glow.blurYTo = 100;
    glow.color = 0x33ff33;
  }
}
}