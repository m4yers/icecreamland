/**
 * Created by m4yers on 06/02/15.
 */
package icecreamland.game.renderers
{

	import flash.display.Graphics;
	import flash.display.Sprite;

	public class QuickBastardEnemyRenderer extends Renderer
	{
		override public function create():void
		{
			const radius:Number = 10.0;

			var sprite:Sprite = new Sprite();
			var graphics:Graphics = sprite.graphics;
			graphics.beginFill( 0xff00ff, 1.0 );
			graphics.drawCircle( 0.0, 0.0, radius );
			graphics.endFill();

			addChild( sprite );
		}
	}
}
