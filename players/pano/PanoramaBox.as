package players.pano {
import flash.events.Event;

import mx.controls.Alert;
import mx.core.UIComponent;

import mx.effects.Fade;
import mx.effects.Glow;
import mx.effects.Parallel;
import mx.events.EffectEvent;
import mx.rpc.events.FaultEvent;

import mx.rpc.events.ResultEvent;

import mx.rpc.remoting.mxml.RemoteObject;

import players.pano.components.RemoteControl;

import players.pano.components.SkyBoxRenderer;


public class PanoramaBox extends UIComponent {
  private var view:View;
  private var remoteControl:RemoteControl;
  private var _id:Number;
  private var parallelOut:Parallel = new Parallel();

  public function PanoramaBox(w:int, h:int) {
    super();
    visible = false;
    setEffects();
    width = w;
    height = h;
    view = new View();
    addChild(view);
  }

  private function setEffects():void {
    var fadeIn:Fade = new Fade();
    var fadeOut:Fade = new Fade();
    var glow:Glow = new Glow();
    var parallelIn:Parallel = new Parallel();

    glow.duration = 3000;
    glow.blurXFrom = 40;
    glow.blurXTo = 0;
    glow.blurYFrom = 40;
    glow.blurYTo = 0;
    glow.color = 0xffffff;

    fadeIn.alphaFrom = 0;
    fadeIn.alphaTo = 1;
    fadeIn.duration = 2000;
    fadeOut.alphaFrom = 1;
    fadeOut.alphaTo = 0;
    fadeOut.duration = 2000;

    parallelIn.addChild(fadeIn);
    parallelIn.addChild(glow);
    parallelOut.addChild(fadeOut);

    parallelOut.addEventListener(EffectEvent.EFFECT_END, endEffect);

    setStyle("showEffect", parallelIn);
    setStyle("hideEffect", parallelOut);
  }

  private function endEffect(event:EffectEvent):void {
    //fadeOut.removeEventListener(EffectEvent.EFFECT_END, endEffect);
    view.removeSkyBox();
    if (_id != -1) getData(_id);
  }

  public function getRemoteControl():RemoteControl {
    return remoteControl;
  }

  public function clear():void {
    parallelOut.removeEventListener(EffectEvent.EFFECT_END, endEffect);
    view.clear();
  }
}
}