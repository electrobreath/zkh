package site.components.popUpWindows {
import flash.events.MouseEvent;
import flash.geom.Point;
import flash.utils.getQualifiedClassName;

import mx.containers.HBox;
import mx.containers.TitleWindow;
import mx.controls.Alert;
import mx.controls.Image;
import mx.controls.Label;
import mx.core.UIComponent;

public class MyTitleWindow extends TitleWindow {
  private var titleLabel:Label;
  private var maxMin:HBox;

  public function MyTitleWindow() {
    super();
    titleLabel = new Label();
  }

  protected function init(name:String):void {
    setStyles();
    setTitle(name);
    //var point:Point = new Point();
    //point = parent.localToGlobal(point);
    //x = point.x + 90;
    //y = point.y - 30;
    showCloseButton = true;
  }

  private function setTitle(name:String):void {
    titleLabel.styleName = "allWindowTitleLabel";
    titleLabel.text = name;
    titleBar.addChild(titleLabel);
  }

  public function updateTitle(name:String):void {
    titleLabel.text = name;
  }

  public function addTitleBarMaxMinElement(mm:HBox):void {
    maxMin = mm;
    titleBar.addChild(maxMin);
  }

  public function getTitleBar():UIComponent {
    return titleBar;
  }

  public function setStyles():void {

    setStyle("paddingTop", 0);
    setStyle("paddingBottom", 0);
    setStyle("paddingLeft", 0);
    setStyle("paddingRight", 0);
    setStyle("borderColor", "#707070");
    setStyle("borderAlpha", 1);
    setStyle("backgroundColor", "#000000");
    setStyle("backgroundAlpha", 0.5);
    setStyle("borderThicknessTop", 0);
    setStyle("borderThicknessBottom", 0);
    setStyle("borderThicknessRight", 0);
    setStyle("borderThicknessLeft", 0);
    setStyle("cornerRadius", 10);

    //width = 650;
    //height = 463;  //450 29
    //setStyle("dropShadowColor", 0x707070);
    //setStyle("titleStyleName", "titleName")
    //setStyle("shadowDistance", 2);
    //window.setStyle("shadowDirection", "right");
  }

  override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void {
    super.updateDisplayList(unscaledWidth, unscaledHeight);
    titleLabel.setActualSize(titleLabel.getExplicitOrMeasuredWidth(), titleLabel.getExplicitOrMeasuredHeight());
    //maxMin.setActualSize(maxMin.getExplicitOrMeasuredWidth(), maxMin.getExplicitOrMeasuredHeight());
    // titleLabel.width = 200;
    // titleLabel.move(width/2 - titleLabel.text.length/2 - 35, 5);
    titleLabel.move(10, 5);
    //maxMin.width = 20;
    //maxMin.move(5, 7);
    //menuBox.setActualSize(menuBox.getExplicitOrMeasuredWidth(), menuBox.getExplicitOrMeasuredHeight());
    //menuBox.move(300, 4);
    super.validateNow();
  }
}
}