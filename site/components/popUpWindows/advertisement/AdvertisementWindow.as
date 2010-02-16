package site.components.popUpWindows.advertisement
{
	import site.components.popUpWindows.MyTitleWindow;
	import mx.events.CloseEvent;
	import mx.managers.PopUpManager;
	
	public class AdvertisementWindow extends MyTitleWindow{
		
		
		public function AdvertisementWindow(){
			super();
			visible = false;
			addEventListener(CloseEvent.CLOSE, closeWindow);
		}
		
		public function initWindow(name:String):void {
			init(name);
			addChild(new Advertisements());
		}
		
		private function closeWindow(event:CloseEvent):void {
			visible = false;
		}
		
		override public function setStyles():void {
			styleName = "advertisementWindow";
			
			width = 470;
			height = 300;
			//setStyle("dropShadowColor", 0x707070);
			//setStyle("titleStyleName", "titleName")
			//setStyle("shadowDistance", 2);
			//window.setStyle("shadowDirection", "right");
		}
	}
}