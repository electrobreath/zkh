package players.pano.components {
import away3d.core.base.Object3D;
import away3d.core.utils.Cast;
import away3d.materials.BitmapMaterial;
import away3d.primitives.Skybox;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.TimerEvent;
import flash.geom.Rectangle;
import flash.utils.ByteArray;

import flash.utils.Timer;

import mx.controls.Alert;

import site.model.PanoramaData;

public class SkyBoxRenderer extends EventDispatcher{
	private var frontSide:BitmapMaterial;
	private var leftSide:BitmapMaterial;
	private var backSide:BitmapMaterial;
	private var rightSide:BitmapMaterial;
	private var upSide:BitmapMaterial;
	private var downSide:BitmapMaterial;
	private var skyBox:Skybox;
	private var countSides:int = 0;
	public static const COMPLETE:String = "complete";

	public function SkyBoxRenderer(panoramaData:PanoramaData) {
		setMaterials(panoramaData);
	}

	private function setMaterials(panoramaData:PanoramaData):void {
		setBitmapMaterialSide("frontSide", panoramaData.frontSide);
		setBitmapMaterialSide("leftSide", panoramaData.leftSide);
		setBitmapMaterialSide("backSide", panoramaData.backSide);
		setBitmapMaterialSide("rightSide", panoramaData.rightSide);
		setBitmapMaterialSide("upSide", panoramaData.upSide);
		setBitmapMaterialSide("downSide", panoramaData.downSide);
	}

	public function getSkybox():Skybox {
		return skyBox;
	}

	private function setBitmapMaterialSide(type:String, byteArray:ByteArray):void {
		var loader:Loader = new Loader();
		loader.contentLoaderInfo.addEventListener(Event.COMPLETE, finishLoader);
		function finishLoader(event:Event):void {
			loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, finishLoader);
			if ("frontSide" == type) frontSide = new BitmapMaterial(Cast.bitmap(Bitmap(loader.content)));
			if ("leftSide" == type) leftSide = new BitmapMaterial(Cast.bitmap(Bitmap(loader.content)));
			if ("backSide" == type) backSide = new BitmapMaterial(Cast.bitmap(Bitmap(loader.content)));
			if ("rightSide" == type) rightSide = new BitmapMaterial(Cast.bitmap(Bitmap(loader.content)));
			if ("upSide" == type) upSide = new BitmapMaterial(Cast.bitmap(Bitmap(loader.content)));
			if ("downSide" == type) downSide = new BitmapMaterial(Cast.bitmap(Bitmap(loader.content)));
			countSides += 1;
		}
		loader.loadBytes(byteArray);
	}

	public function render():void {
		var t:Timer = new Timer(10, 0);
		t.addEventListener(TimerEvent.TIMER, timerHandler);
		function timerHandler(event:TimerEvent):void {
			if (countSides == 6) {
				t.removeEventListener(TimerEvent.TIMER, timerHandler);
				t.stop();
				skyBox = new Skybox(frontSide, leftSide, backSide, rightSide, upSide, downSide);
				skyBox.quarterFaces();
				dispatchEvent(new Event(SkyBoxRenderer.COMPLETE));
			}
		}
		t.start();
	}
}
}