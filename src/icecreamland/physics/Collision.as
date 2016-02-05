/**
 * Created by m4yers on 06/02/15.
 */
package icecreamland.physics
{

	import icecreamland.entity.Entity;

	public class Collision
	{
		public var self:Entity;
		public var other:Entity;

		public function Collision( self:Entity, other:Entity )
		{
			this.self = self;
			this.other = other;
		}
	}
}
