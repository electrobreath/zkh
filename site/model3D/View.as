package site.model3D {
import away3d.cameras.HoverCamera3D;
import away3d.containers.ObjectContainer3D;
import away3d.containers.Scene3D;
import away3d.containers.View3D;

import away3d.core.base.Object3D;
import away3d.core.clip.RectangleClipping;

import away3d.core.math.Number3D;
import away3d.events.Loader3DEvent;
import away3d.loaders.Collada;
import away3d.loaders.Loader3D;
import away3d.loaders.LoaderCube;
import away3d.loaders.Max3DS;
import away3d.primitives.Cube;
import away3d.primitives.Skybox;

import flash.events.Event;
import flash.events.MouseEvent;

import mx.controls.Alert;
import mx.core.UIComponent;

import mx.events.ModuleEvent;

import players.pano.components.PanoSkybox6;


public class View extends UIComponent {
  private var scene:Scene3D;
  private var camera:HoverCamera3D;
  private var view:View3D;
  private var object3D:Object3D;

  private var max3ds:Max3DS;
  private var loader:LoaderCube;
  private var model:ObjectContainer3D;

  private var isMove:Boolean = false;
  private var lastPanAngle:Number;
  private var lastTiltAngle:Number;
  private var lastMouseX:Number;
  private var lastMouseY:Number;

  public function View() {
    super();
    addEventListener(Event.ENTER_FRAME, renderScene);
  }

  override protected function createChildren():void {
    super.createChildren();
    if (!view) {
      viewInit();
    }
  }

  override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void {
    super.updateDisplayList(unscaledWidth, unscaledHeight);
    if (parent.width / 2 != view.x) view.x = parent.width / 2;
    if (parent.height / 2 != view.y) view.y = parent.height / 2;
  }

  private function viewInit():void {
    init3D();
    addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
    addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
    addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
    createModel();
  }

  private function renderScene(evt:Event):void {
    //camera.targetpanangle += 0.05;
    if (isMove) {
      camera.targetpanangle = 0.5 * (mouseX - lastMouseX) + lastPanAngle;
      camera.targettiltangle = 0.5 * (mouseY - lastMouseY) + lastTiltAngle;
    }
    if (view && view.stage) {
      camera.hover();
      view.render();
    }
  }

  private function init3D():void {
    scene = new Scene3D();
    camera = new HoverCamera3D();
    camera.zoom = 7;
    camera.focus = 50;
    camera.mintiltangle = -80;
    camera.maxtiltangle = 20;
    camera.targetpanangle = camera.panangle = 0;
    camera.targettiltangle = camera.tiltangle = 0;
    view = new View3D({scene:scene, camera:camera, stats:false});
    view.clipping = new RectangleClipping({minX:(-parent.width / 2) + 1, minY:(-parent.height / 2) + 1, maxX:(parent.width / 2) - 1, maxY:(parent.height / 2) - 1});
    view.x = parent.width / 2;
    view.y = parent.height / 2;
    view.camera.position = new Number3D(400, 1000, 900);
    //view.camera.lookAt( new Number3D(-500, 500, -800) );
    addChild(view);
  }

  private function onMouseDown(event:MouseEvent):void {
    lastPanAngle = camera.targetpanangle;
    lastTiltAngle = camera.targettiltangle;
    lastMouseX = mouseX;
    lastMouseY = mouseY;
    isMove = true;
    addEventListener(Event.MOUSE_LEAVE, onStageMouseLeave);
  }

  private function onMouseUp(event:MouseEvent):void {
    isMove = false;
    removeEventListener(Event.MOUSE_LEAVE, onStageMouseLeave);
  }

  private function onMouseOut(event:MouseEvent):void {
    //isMove = false;
    //removeEventListener(Event.MOUSE_LEAVE, onStageMouseLeave);
  }

  private function onStageMouseLeave(event:Event):void {
    isMove = false;
    removeEventListener(Event.MOUSE_LEAVE, onStageMouseLeave);
  }

  private function createModel():void {
    view.scene.addChild(new PanoSkybox6());
  }

  private function onLoaderSuccess(event:Loader3DEvent):void {
    model = event.loader.handle as ObjectContainer3D;
    model.scale(10);
    //view.camera.lookAt(new Number3D(-500, 500, -800));
    view.camera.position = new Number3D(400, 1000, 9000);

    //model.addOnMouseUp(onClickModel);
  }

  public function clear():void {
    removeEventListener(Event.ENTER_FRAME, renderScene);
    removeEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
    removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
    removeEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
    view.clear();
    view = null;
  }
}
}