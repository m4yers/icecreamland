/**
 * Created by m4yers on 03/02/15.
 */
package icecreamland.game.components
{

	public class MovementComponent
	{
		public var speed:Number;
		public var angle:Number;
		public var dx:Number;
		public var dy:Number;

		public function MovementComponent( speed:Number, angle:Number, dx:Number, dy:Number ):void
		{
			this.speed = speed;
			this.angle = angle;
			this.dx = dx;
			this.dy = dy;
		}
	}
}
