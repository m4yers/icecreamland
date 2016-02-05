/**
 * Created by m4yers on 06/02/15.
 */
package icecreamland.game.components
{

	import icecreamland.physics.Collision;

	public class PhysicsComponent
	{
		public var radius:Number;
		public var collisions:Vector.<Collision>;

		public function PhysicsComponent( radius:Number )
		{
			this.radius = radius;
			this.collisions = new Vector.<Collision>();
		}
	}
}
