/**
 * Created by m4yers on 06/02/15.
 */
package icecreamland.game.renderers
{

	import flash.display.Graphics;
	import flash.display.Sprite;

	public class TrickyFatEnemyRenderer extends Renderer
	{
		public static const COLOR:uint = 0x00ffff;
		public static const RADIUS:Number = 50.0;

		public var filling:Sprite;
		public var masking:Sprite;
		public var circle:Sprite;

		override public function create():void
		{
			var graphics:Graphics;

			filling = new Sprite();
			graphics = filling.graphics;
			graphics.beginFill( COLOR, 1.0 );
			graphics.drawCircle( 0.0, 0.0, RADIUS );
			graphics.endFill();

			masking = new Sprite();
			graphics = masking.graphics;
			graphics.beginFill( COLOR, 1.0 );
			graphics.drawRect( -RADIUS, -RADIUS, RADIUS * 2, RADIUS * 2 );
			graphics.endFill();

			circle = new Sprite();
			graphics = circle.graphics;
			graphics.lineStyle( 3.0, COLOR, 1.0, true );
			graphics.drawCircle( 0.0, 0.0, RADIUS );

			filling.mask = masking;

			addChild( filling );
			addChild( masking );
			addChild( circle );
		}

		override public function health( current:Number, total:Number ):void
		{
			var factor:Number = 1.0 - current / total;
			masking.y = masking.height * factor;
		}
	}
}
