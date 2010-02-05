package site.model {
import flash.utils.ByteArray;

[Bindable]
[RemoteClass(alias="flexModel.FlexUser")]
public class FlexUser {
  public var id:Number;
  public var login:String;
  public var password:String;
  public var firstName:String;
  public var lastName:String;
  public var email:String;
  public var mobile:String;
  //public var addressId:Number;
  public var city:String;
  public var street:String;
  public var houseNumber:String;
  public var floor:int;
  public var apartmentNumber:int;
  public var avatar:ByteArray;

  public function FlexUser() {
  }
}
}