/**
 * Created by m4yers on 06/02/15.
 */
package icecreamland.game.renderers
{

	import flash.display.Graphics;
	import flash.display.Sprite;

	public class QuickDeathBulletRenderer extends Renderer
	{
		private var _color:uint;
		private var _size:Number;

		public function QuickDeathBulletRenderer( color:int = 0x999999, size:Number = 5.0 )
		{
			_color = color;
			_size = size;
			super();
		}

		override public function create():void
		{
			var sprite:Sprite = new Sprite();
			var graphics:Graphics = sprite.graphics;
			graphics.beginFill( _color, 1.0 );
			graphics.drawCircle( 0.0, 0.0, _size );
			graphics.endFill();

			addChild( sprite );
		}
	}
}
