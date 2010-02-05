package players.pano.components {
import away3d.core.utils.Cast;
import away3d.materials.BitmapMaterial;
import away3d.primitives.Skybox;
import away3d.primitives.Skybox6;

public class PanoSkybox6 extends Skybox{
	//[Embed(source="/images/pano.cubic1.jpg")]
	//var img:Class;

	[Embed(source="/images/1/1.back.jpg")]
	var back_m:Class;
	[Embed(source="/images/1/1.bottom.jpg")]
	var down_m:Class;
	[Embed(source="/images/1/1.left.jpg")]
	var left_m:Class;
	[Embed(source="/images/1/1.right.jpg")]
	var right_m:Class;
	[Embed(source="/images/1/1.front.jpg")]
	var front_m:Class;
	[Embed(source="/images/1/1.top.jpg")]
	var up_m:Class;

	public function PanoSkybox6() {
		//super(new BitmapMaterial(Cast.bitmap(img),{repeat:false}));
		var back_material:BitmapMaterial = new BitmapMaterial(Cast.bitmap(back_m));
		var bottom_material:BitmapMaterial = new BitmapMaterial(Cast.bitmap(down_m));
		var left_material:BitmapMaterial = new BitmapMaterial(Cast.bitmap(left_m));
		var right_material:BitmapMaterial = new BitmapMaterial(Cast.bitmap(right_m));
		var front_material:BitmapMaterial = new BitmapMaterial(Cast.bitmap(front_m));
		var top_material:BitmapMaterial = new BitmapMaterial(Cast.bitmap(up_m));
		super(front_material, left_material, back_material, right_material, top_material, bottom_material);
		quarterFaces();
	}
}
}