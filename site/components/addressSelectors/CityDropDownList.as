package site.components.addressSelectors {
import mx.collections.ArrayCollection;

import mx.controls.Alert;
import mx.rpc.events.FaultEvent;

import mx.rpc.events.ResultEvent;

import mx.rpc.remoting.mxml.RemoteObject;

import spark.components.DropDownList;

public class CityDropDownList extends DropDownList {
  private var itemList:ArrayCollection;
  private var _id:Number;

  public function CityDropDownList() {
    super();
    selectedIndex = -1;
    prompt = "----";
    width = 200;
    itemList = new ArrayCollection();
    getData();
    dataProvider = itemList;
  }

  private function getData():void {
    var ro:RemoteObject = new RemoteObject("FD");
    ro.showBusyCursor = true;
    ro.addEventListener("result", result);
    ro.addEventListener("fault", fault);
    ro.getCityList();

    function result(event:ResultEvent):void {
      ro.removeEventListener("result", result);
      var list:ArrayCollection = ArrayCollection(event.result);
      for each(var item:Object in list) {
        itemList.addItem({label:item.label, data:item.data});
      }
    }

    function fault(event:FaultEvent):void {
      ro.removeEventListener("fault", fault);
      //Alert.show(event.toString());
    }
  }
}
}