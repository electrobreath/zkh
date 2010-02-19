package site.components.popUpWindows.advertisement
{
import mx.containers.VBox;

import org.osmf.layout.AbsoluteLayoutFacet;

import site.components.popUpWindows.MyTitleWindow;
	import mx.events.CloseEvent;
	import mx.managers.PopUpManager;
	
	public class AdvertisementWindow extends MyTitleWindow{
    var adv:Advertisements;
		public function AdvertisementWindow(){
			super();
      layout = "horizontal";
      horizontalScrollPolicy = "off";
			visible = false;
			addEventListener(CloseEvent.CLOSE, closeWindow);
		}
		
		public function initWindow(name:String):void {
			init(name);
      var a:AdvertisementForm = new AdvertisementForm();
      a.create();
      adv = a.getAdvertisementsList();
			addChild(a);

      /*var adv:Advertisements = new Advertisements();
      var a:NewAdvertisement = new NewAdvertisement();
      a.setAdvertisementList(adv);
      addElement(a);
      addElement(adv);*/
		}
		
		private function closeWindow(event:CloseEvent):void {
			visible = false;
		}
		
		override public function setStyles():void {
			styleName = "advertisementWindow";
			
			width = 670;
			height = 440;
			//setStyle("dropShadowColor", 0x707070);
			//setStyle("titleStyleName", "titleName")
			//setStyle("shadowDistance", 2);
			//window.setStyle("shadowDirection", "right");
		}

    public function getAdvertisementsList():Advertisements {
      return adv;
    }
	}
}