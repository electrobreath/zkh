package site.util {
import mx.rpc.events.FaultEvent;
import mx.rpc.events.ResultEvent;
import mx.rpc.remoting.mxml.RemoteObject;

import site.model.FlexAdvertisement;

public class AdvertisementHandler {
  public function AdvertisementHandler() {
  }

  public static function createAdvertisement(adv:FlexAdvertisement):void {
    var ro:RemoteObject = new RemoteObject("FD");
    ro.showBusyCursor = true;
    ro.addEventListener("result", result);
    ro.addEventListener("fault", fault);
    ro.createAdvertisement(adv);

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