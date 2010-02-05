package site.model {
import flash.utils.ByteArray;

[Bindable]
[RemoteClass(alias="flexModel.FlexPhoto")]
public class FlexPhoto {
  public var id:Number;
  public var name:String;
  public var descr:String;
  public var binData:ByteArray;

  public function FlexPhoto() {
  }
}
}