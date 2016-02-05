/**
 * Created by m4yers on 06/02/15.
 */
package icecreamland.game.renderers
{

	import flash.display.Sprite;

	public class Renderer extends Sprite
	{
		public function Renderer()
		{
			create();
		}

		public function create():void
		{
		}

		public function lookAt( angle:Number ):void
		{
			this.rotation = angle * 180 / Math.PI;
		}

		public function animate( delta:Number ):void
		{
		}

		public function health( current:Number, total:Number ):void
		{
		}
	}
}
