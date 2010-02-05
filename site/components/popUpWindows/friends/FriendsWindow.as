package site.components.popUpWindows.friends
{
	import site.components.popUpWindows.MyTitleWindow;
	
	import mx.events.CloseEvent;
	
	import mx.managers.PopUpManager;
	
	public class FriendsWindow extends MyTitleWindow{
		
		
		public function FriendsWindow(){
			super();
			visible = false;
			addEventListener(CloseEvent.CLOSE, closeWindow);	
		}
		
		public function initWindow(name:String):void {
			init(name);
			addChild(new FriendsForm());
		}
		
		private function closeWindow(event:CloseEvent):void {
			//removeEventListener(CloseEvent.CLOSE, closeWindow);
			//removeAllChildren();
			//PopUpManager.removePopUp(this);
			visible = false;
		}
		
		override public function setStyles():void {
			styleName = "friendsWindow";
			
			width = 470;
			height = 300;
			//setStyle("dropShadowColor", 0x707070);
			//setStyle("titleStyleName", "titleName")
			//setStyle("shadowDistance", 2);
			//window.setStyle("shadowDirection", "right");
		}
	}
}