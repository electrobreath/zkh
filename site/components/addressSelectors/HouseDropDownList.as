package site.components.addressSelectors {
import mx.collections.ArrayCollection;

import mx.controls.Alert;
import mx.rpc.events.FaultEvent;
import mx.rpc.events.ResultEvent;
import mx.rpc.remoting.mxml.RemoteObject;

import spark.components.DropDownList;

public class HouseDropDownList extends DropDownList {
  private var itemList:ArrayCollection;
  private var _id:Number;

  public function HouseDropDownList() {
    super();
    selectedIndex = -1;
    prompt = "----";
    width = 200;
    itemList = new ArrayCollection();
  }
  
  public function refresh(id:Number):void {
    selectedIndex = -1;
    //dataProvider = new ArrayCollection();
    itemList.removeAll();
    getData(id);
    //dataProvider = itemList;
  }

  public function clear():void {
    itemList.removeAll();
  }

  private function getData(id:Number):void {
    var ro:RemoteObject = new RemoteObject("FD");
    ro.showBusyCursor = true;
    ro.addEventListener("result", result);
    ro.addEventListener("fault", fault);
    ro.getHouseListByStreetId(id);

    function result(event:ResultEvent):void {
      ro.removeEventListener("result", result);
      var list:ArrayCollection = ArrayCollection(event.result);
      for each(var item:Object in list) {
        itemList.addItem({label:item.label, data:item.data});
      }
      dataProvider = ArrayCollection(event.result);
    }

    function fault(event:FaultEvent):void {
      ro.removeEventListener("fault", fault);
      //Alert.show(event.toString());
    }
  }
}
}