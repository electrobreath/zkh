package site.model {
import org.osmf.metadata.StringIdentifier;

[Bindable]
[RemoteClass(alias="flexModel.FlexMessage")]
public class FlexMessage {
  public var id:Number;
  public var since:String;
  public var text:String;
  public var subject:String;
  public var senderId:Number;
  public var senderLogin:String;
  public var senderFirstName:String;
  public var senderLastName:String;
  public var senderFloor:String;
  public var senderApartment:String;
  public var recipientId:Number;
  public var recipientLogin:String;
  public var recipientFirstName:String;
  public var recipientLastName:String;
  public var recipientFloor:String;
  public var recipientApartment:String;
  public var isFriendRequest:Boolean;

  public function FlexMessage() {
  }
}
}