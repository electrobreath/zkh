package site.util {
import com.adobe.images.JPGEncoder;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.TimerEvent;
import flash.geom.Rectangle;
import flash.utils.ByteArray;

import flash.utils.Timer;

import mx.collections.ArrayCollection;
import mx.controls.Alert;
import mx.core.ByteArrayAsset;
import mx.rpc.events.FaultEvent;
import mx.rpc.events.ResultEvent;
import mx.rpc.remoting.mxml.RemoteObject;

import site.components.middleArea.UserWindowsButtons;
import site.model.FlexPhoto;
import site.model.FlexUser;
import site.model.FlexMessage;

public class UserHandler extends EventDispatcher {
  public static const LOGIN_COMPLETE:String = "complete";
  private static var flexUser:FlexUser;
  private var usedLogins:ArrayCollection;
  public static var userWindowsHandler:UserWindowsButtons;

  public function UserHandler(...args) {
    if (args[0] is Boolean) {
      getUsedLogins();
    }
  }

  public static function createUser(user:FlexUser):void {
    var ro:RemoteObject = new RemoteObject("FD");
    ro.showBusyCursor = true;
    ro.addEventListener("result", result);
    ro.addEventListener("fault", fault);
    ro.createUser(user);

    function result(event:ResultEvent):void {
      ro.removeEventListener("result", result);
      //Alert.show(String(event.result));
    }

    function fault(event:FaultEvent):void {
      ro.removeEventListener("fault", fault);
      //Alert.show(event.toString());
    }
  }

  public static function updateUser(user:FlexUser):void {
    var ro:RemoteObject = new RemoteObject("FD");
    ro.showBusyCursor = true;
    ro.addEventListener("result", result);
    ro.addEventListener("fault", fault);
    ro.updateUser(user);

    function result(event:ResultEvent):void {
      ro.removeEventListener("result", result);
      //Alert.show(String(event.result));
    }

    function fault(event:FaultEvent):void {
      ro.removeEventListener("fault", fault);
      //Alert.show(event.toString());
    }
  }

  public static function createMessage(message:FlexMessage):void {
    var ro:RemoteObject = new RemoteObject("FD");
    ro.showBusyCursor = true;
    ro.addEventListener("result", result);
    ro.addEventListener("fault", fault);
    ro.createMessage(message);

    function result(event:ResultEvent):void {
      ro.removeEventListener("result", result);
      //Alert.show(String(event.result));
    }

    function fault(event:FaultEvent):void {
      ro.removeEventListener("fault", fault);
      //Alert.show(event.toString());
    }
  }

  public static function delIncomingMessageById(id:Number):void {
    var ro:RemoteObject = new RemoteObject("FD");
    ro.showBusyCursor = true;
    ro.addEventListener("result", result);
    ro.addEventListener("fault", fault);
    ro.delIncomingMessageById(id);

    function result(event:ResultEvent):void {
      ro.removeEventListener("result", result);
      //Alert.show(String(event.result));
    }

    function fault(event:FaultEvent):void {
      ro.removeEventListener("fault", fault);
      //Alert.show(event.toString());
    }
  }

  public static function delOutcomingMessageById(id:Number):void {
    var ro:RemoteObject = new RemoteObject("FD");
    ro.showBusyCursor = true;
    ro.addEventListener("result", result);
    ro.addEventListener("fault", fault);
    ro.delOutcomingMessageById(id);

    function result(event:ResultEvent):void {
      ro.removeEventListener("result", result);
      //Alert.show(String(event.result));
    }

    function fault(event:FaultEvent):void {
      ro.removeEventListener("fault", fault);
      //Alert.show(event.toString());
    }
  }

  public static function createFriendRequest(message:FlexMessage):void {
    var ro:RemoteObject = new RemoteObject("FD");
    ro.showBusyCursor = true;
    ro.addEventListener("result", result);
    ro.addEventListener("fault", fault);
    ro.createFriendRequest(message);

    function result(event:ResultEvent):void {
      ro.removeEventListener("result", result);
      //Alert.show(String(event.result));
    }

    function fault(event:FaultEvent):void {
      ro.removeEventListener("fault", fault);
      //Alert.show(event.toString());
    }
  }

  private function getUsedLogins():void {
    var ro:RemoteObject = new RemoteObject("FD");
    ro.showBusyCursor = true;
    ro.addEventListener("result", result);
    ro.addEventListener("fault", fault);
    ro.getUsedLoginsList();

    function result(event:ResultEvent):void {
      ro.removeEventListener("result", result);
      //Alert.show(String(event.result));
      usedLogins = ArrayCollection(event.result);
    }

    function fault(event:FaultEvent):void {
      ro.removeEventListener("fault", fault);
      //Alert.show(event.toString());
    }
  }

  public function isLoginFree(login:String):Boolean {
    return !usedLogins.contains(login);
  }

  public function prepareLoginProccess(user:FlexUser):void {
    var ro:RemoteObject = new RemoteObject("FD");
    ro.showBusyCursor = true;
    ro.addEventListener("result", result);
    ro.addEventListener("fault", fault);
    ro.checkUser(user);

    function result(event:ResultEvent):void {
      ro.removeEventListener("result", result);
      flexUser = FlexUser(event.result);
      if (flexUser.avatar == null) {
        flexUser.avatar = getDefaultAvatar();
      }
    }

    function fault(event:FaultEvent):void {
      ro.removeEventListener("fault", fault);
      //Alert.show(event.toString());
    }
  }

  public function startLogin():void {
    var t:Timer = new Timer(10, 0);
    t.addEventListener(TimerEvent.TIMER, timerHandler);
    function timerHandler(event:TimerEvent):void {
      if (null != flexUser && flexUser.id > -1) {
        t.removeEventListener(TimerEvent.TIMER, timerHandler);
        t.stop();
        dispatchEvent(new Event(UserHandler.LOGIN_COMPLETE));
      }
    }

    t.start();
  }

  public function logout():void {
    delOnlineUser(flexUser);
    userWindowsHandler.hideAllPopUpWindows();
  }

  public static function isLoggedIn():Boolean {
    return null != flexUser && flexUser.id > -1;
  }

  public static function getUser():FlexUser {
    return flexUser;
  }

  private function delOnlineUser(user:FlexUser):void {
    var ro:RemoteObject = new RemoteObject("FD");
    ro.showBusyCursor = true;
    ro.addEventListener("result", result);
    ro.addEventListener("fault", fault);
    ro.delOnlineUser(user);

    function result(event:ResultEvent):void {
      flexUser = null;
      ro.removeEventListener("result", result);
    }

    function fault(event:FaultEvent):void {
      ro.removeEventListener("fault", fault);
    }
  }

  public static function getDefaultAvatar():ByteArray {
    [Embed(source="/images/no_avatar.gif")]
    var img:Class;
    var ret:ByteArray = new ByteArray();
    var encoder:JPGEncoder = new JPGEncoder(100);
    var b:Bitmap = new img();
    ret = encoder.encode(b.bitmapData);
    return ret;
  }
}
}