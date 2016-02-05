/**
 * Created by m4yers on 08/02/15.
 */
package icecreamland.game.components
{

	import icecreamland.entity.Entity;

	public class PayloadComponent
	{
		public var entities:Vector.<Entity>;

		public function PayloadComponent( entities:Vector.<Entity> )
		{
			this.entities = entities;
		}
	}
}
