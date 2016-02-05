/**
 * Created by m4yers on 07/02/15.
 */
package icecreamland.game.renderers
{

	import flash.display.Graphics;
	import flash.display.Sprite;

	public class HealthDropRenderer extends Renderer
	{
		private var _skin:Sprite;

		override public function create():void
		{
			const color:uint = 0xff5555;
			const radius:Number = 15.0;

			_skin = new Sprite();
			var graphics:Graphics = _skin.graphics;
			graphics.beginFill( color );
			graphics.drawRect( -radius / 6, -radius / 2, radius / 3, radius );
			graphics.endFill();
			graphics.beginFill( color );
			graphics.drawRect( -radius / 2, -radius / 6, radius, radius / 3 );
			graphics.endFill();
			graphics.lineStyle( 3.0, color, 1.0, true );
			graphics.drawCircle( 0.0, 0.0, radius );

			addChild( _skin );
		}

		override public function animate( delta:Number ):void
		{
			super.animate( delta );
			_skin.rotation += 50 * delta / 1000;
		}
	}
}
