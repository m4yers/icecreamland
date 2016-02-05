/**
 * Created by m4yers on 06/02/15.
 */
package icecreamland.game.renderers
{

	import flash.display.Graphics;
	import flash.display.Sprite;

	public class PlayerRenderer extends Renderer
	{
		public static const COLOR:uint = 0xff0000;
		public static const ANGLE:Number = 10.0 * Math.PI / 180.0;
		public static const RADIUS:Number = 25.0;

		public var filling:Sprite;
		public var masking:Sprite;
		public var circle:Sprite;

		override public function create():void
		{
			var graphics:Graphics;

			filling = new Sprite();
			graphics = filling.graphics;
			graphics.beginFill( COLOR, 0.3 );
			graphics.drawCircle( 0.0, 0.0, RADIUS );
			graphics.endFill();

			masking = new Sprite();
			graphics = masking.graphics;
			graphics.beginFill( COLOR, 1.0 );
			graphics.drawRect( -RADIUS, -RADIUS, RADIUS * 2, RADIUS * 2 );
			graphics.endFill();

			circle = new Sprite();
			graphics = circle.graphics;
			graphics.lineStyle( 5.0, 0xff0000, 1.0, true );
			graphics.drawCircle( 0.0, 0.0, RADIUS );
			graphics.lineStyle( 3.0, 0xff0000, 1.0, true );
			graphics.beginFill( 0xff0000, 1.0 );
			graphics.moveTo( 0.0, 0.0 );
			graphics.lineTo(
				RADIUS * Math.cos( ANGLE ) - Math.sin( ANGLE ),
				RADIUS * Math.sin( ANGLE ) + Math.cos( ANGLE )
			);
			graphics.curveTo(
				RADIUS, 0.0,
				RADIUS * Math.cos( ANGLE ) + Math.sin( ANGLE ),
				-RADIUS * Math.sin( ANGLE ) + Math.cos( ANGLE )
			);
			graphics.endFill();

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

		override public function lookAt( angle:Number ):void
		{
			circle.rotation = angle * 180 / Math.PI;
		}
	}
}

