package site.mainPage {
import spark.components.BorderContainer;

public class MainPageModel {
  private static var topMenuArea:BorderContainer;
  private static var middleArea:BorderContainer;
  private static var bottomArea:BorderContainer;

  public function MainPageModel() {
  }

  public static function getTopMenuArea():BorderContainer {
    return topMenuArea;
  }

  public static function setTopMenuArea(value:BorderContainer):void {
    topMenuArea = value;
  }

  public static function getMiddleArea():BorderContainer {
    return middleArea;
  }

  public static function setMiddleArea(value:BorderContainer):void {
    middleArea = value;
  }

  public static function getBottomArea():BorderContainer {
    return bottomArea;
  }

  public static function setBottomArea(value:BorderContainer):void {
    bottomArea = value;
  }
}
}