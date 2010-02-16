package site.model {
import flash.utils.ByteArray;

[Bindable]
[RemoteClass(alias="flexModel.FlexAdvertisement")]
public class FlexAdvertisement {
  public var id:Number;
  public var since:String;
  public var text:String;
  public var binData:ByteArray;
  public var userLogin:String;

  public function FlexAdvertisement() {
  }
}
}