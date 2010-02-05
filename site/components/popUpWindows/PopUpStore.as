package site.components.popUpWindows {
import mx.collections.ArrayCollection;
import mx.managers.PopUpManager;

public class PopUpStore {
  private static var store:ArrayCollection = new ArrayCollection();

  public static function addWindow(myWindow:MyTitleWindow):void {
    store.addItem(myWindow);
  }

  public static function checkWindowByName(name:String):Boolean {
    var ret:Boolean = false;
    for each(var window:MyTitleWindow in store) {
      if (window.name == name) ret = true;
    }
    return ret;
  }

  public static function getWindowByName(name:String):MyTitleWindow {
    var ret:MyTitleWindow;
    for each(var window:MyTitleWindow in store) {
      if (window.name == name) return window;
    }
    return ret;
  }

  public static function delWindowByName(name:String):void {
    for (var i:int = 0; i < store.length; i++) {
      var window:MyTitleWindow = MyTitleWindow(store.getItemAt(i));
      if (window.name == name) {
        store.removeItemAt(i);
        PopUpManager.removePopUp(window);
      }
    }
  }

  public static function hideAllWindows():void {
    for each(var window:MyTitleWindow in store) {
      (window.visible = false);
    }
  }
}
}
