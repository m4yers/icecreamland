/**
 * Created by m4yers on 06/02/15.
 */
package icecreamland.game.components
{

	public class HealthComponent
	{
		public var current:Number;
		public var maximum:Number;

		public function HealthComponent( value:Number )
		{
			this.current = value;
			this.maximum = value;
		}
	}
}
