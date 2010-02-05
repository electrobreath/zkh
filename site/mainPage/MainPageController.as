package site.mainPage{
import mx.containers.HBox;

import site.components.middleArea.onlineUserList.OnlineUserListForm;
import site.mainPage.BackGroundPhoto;
import site.components.middleArea.UserWindowsHandler;
import site.components.topMenu.TopMenu;
import site.model3D.HouseModel;
import site.util.UserHandler;
import spark.components.BorderContainer;

public class MainPageController {
  /*private var topMenuArea:Border;
  private var middleArea:Border;
  private var bottomArea:Border;
  private var backGroundPhoto:BackGroundPhoto;*/

  public function MainPageController(topMenuArea:BorderContainer, middleArea:BorderContainer, bottomArea:BorderContainer) {
    var userHandler:UserHandler = new UserHandler();

    MainPageModel.setTopMenuArea(topMenuArea);
    MainPageModel.setMiddleArea(middleArea);
    MainPageModel.setBottomArea(bottomArea);

    topMenuArea.addElement(new TopMenu());
    middleArea.addElement(new BackGroundPhoto(userHandler));
    //middleArea.addElement(new HouseModel(900, 700));
    
    var userWindowsHandler:UserWindowsHandler = new UserWindowsHandler();
    UserHandler.userWindowsHandler = userWindowsHandler;
    middleArea.addElementAt(userWindowsHandler, 1);
    var usersOnline:OnlineUserListForm = new OnlineUserListForm();
    usersOnline.visible = false;
    middleArea.addElementAt(usersOnline, 2);
    //middleArea.addElement(new LayoutConstructor(userHandler));
  }

}
}