/**
 * Created by m4yers on 06/02/15.
 */
package icecreamland.game.renderers
{

	import flash.display.Graphics;
	import flash.display.Sprite;

	public class ShotgunWeaponDropRenderer extends Renderer
	{
		override public function create():void
		{
			const color:uint = 0xbb1111;
			const radius:Number = 7.0;
			const distance:Number = radius * 1.5;
			const a1:Number = 45 * Math.PI / 180;
			const a2:Number = 160 * Math.PI / 180;
			const a3:Number = 280 * Math.PI / 180;

			var sprite:Sprite = new Sprite();
			var graphics:Graphics = sprite.graphics;
			graphics.beginFill( color, 1.0 );
			graphics.drawCircle(
				distance * Math.cos( a1 ),
				distance * Math.sin( a1 ), radius
			);
			graphics.drawCircle(
				distance * Math.cos( a2 ),
				distance * Math.sin( a2 ), radius
			);
			graphics.drawCircle(
				distance * Math.cos( a3 ),
				distance * Math.sin( a3 ), radius
			);
			graphics.endFill();

			addChild( sprite );
		}
	}
}
