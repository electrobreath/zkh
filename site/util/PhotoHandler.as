package site.util {
import mx.rpc.events.FaultEvent;
import mx.rpc.events.ResultEvent;
import mx.rpc.remoting.mxml.RemoteObject;

import site.model.FlexPhoto;

public class PhotoHandler {
  public function PhotoHandler() {
  }

  public static function savePhoto(photo:FlexPhoto):void {
    var ro:RemoteObject = new RemoteObject("FD");
    ro.showBusyCursor = true;
    ro.addEventListener("result", result);
    ro.addEventListener("fault", fault);
    ro.savePhoto(photo, UserHandler.getUser().id);

    function result(event:ResultEvent):void {
      ro.removeEventListener("result", result);
      //Alert.show(String(event.result));
    }

    function fault(event:FaultEvent):void {
      ro.removeEventListener("fault", fault);
      //Alert.show(event.toString());
    }
  }

}
}