package site.mainPage{

import flash.display.Bitmap;
import flash.display.Loader;
import flash.display.MovieClip;
import flash.events.Event;
import flash.filters.BitmapFilter;
import flash.filters.BitmapFilterQuality;
import flash.filters.BitmapFilterType;
import flash.filters.GlowFilter;
import flash.filters.GradientGlowFilter;
import flash.utils.ByteArray;

import flash.utils.getQualifiedClassName;

import mx.containers.Canvas;
import mx.controls.Alert;
import mx.controls.Button;
import mx.controls.Image;
import mx.controls.Label;
import mx.core.UIComponent;
import mx.effects.Fade;
import mx.rpc.events.FaultEvent;
import mx.rpc.events.ResultEvent;
import mx.rpc.remoting.mxml.RemoteObject;
import mx.utils.ObjectUtil;

import site.util.UserHandler;

public class BackGroundPhoto extends UIComponent {

  public function BackGroundPhoto(userHandler:UserHandler) {
    super();
    visible = false;
    setEffects();
    setPhotoTemp();
    //setStyles();
  }

  private function setPhotoTemp():void {
    [Embed(source="/images/Untitled-22.jpg")]
    var imageSrc:Class;

    var image:Image = new Image();
    image.source = imageSrc;
    image.width = 960;
    image.height = 720;
    //image.percentWidth = 100;
    //image.percentHeight = 100;
    image.alpha = 0.93;
    addChild(image);
    visible = true;
  }

  private function setPhoto(byteArray:ByteArray):void {
    var loader:Loader = new Loader();
    loader.contentLoaderInfo.addEventListener(Event.COMPLETE, finishLoader);
    function finishLoader(event:Event):void {
      loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, finishLoader);
      addChild(loader);
      visible = true;
    }

    loader.loadBytes(byteArray);
  }

  private function setStyles():void {
    setStyle("backgroundAlpha", 0.2);
  }

  private function setEffects():void {
    var fadeIn:Fade = new Fade();
    fadeIn.duration = 5000;
    fadeIn.alphaFrom = 0;
    fadeIn.alphaTo = 1;
    setStyle("showEffect", fadeIn);
    setStyle("dropShadowEnabled", false);
    //setStyle("shadowDistance", 3);
    //setStyle("shadowDirection", "right");
  }
}
}