/**
 * Created by m4yers on 07/02/15.
 */
package icecreamland.game.renderers
{

	import flash.display.Graphics;
	import flash.display.Sprite;

	public class GrenadeRenderer extends Renderer
	{
		public static const COLOR:uint = 0x33ff33;
		public static const RADIUS:Number = 3.0;
		public static const NUMBER:int = 8;
		public static const STEP:Number = Math.PI / NUMBER * 2;
		public static const DISTANCE:Number = RADIUS * 2.8;

		private var _skin:Sprite;
		private var _rotation:Number;

		public function GrenadeRenderer( rotation:Number = 30.0 ):void
		{
			_rotation = rotation;
			super ();
		}

		override public function create():void
		{
			_skin = new Sprite();
			var graphics:Graphics = _skin.graphics;
			graphics.beginFill( COLOR );
			graphics.drawCircle( 0.0, 0.0, RADIUS );
			graphics.endFill();
			var angle:Number = 0.0;
			for (var i:int = 0; i < NUMBER; ++i)
			{
				graphics.beginFill( COLOR );
				graphics.drawCircle(
					DISTANCE * Math.cos( angle ),
					DISTANCE * Math.sin( angle ),
					RADIUS
				);
				graphics.endFill();

				angle += STEP;
			}


			addChild( _skin );
		}

		override public function animate( delta:Number ):void
		{
			super.animate( delta );
			_skin.rotation += _rotation * delta / 1000;
		}
	}
}
