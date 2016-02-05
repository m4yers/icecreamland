/**
 * Created by m4yers on 07/02/15.
 */
package icecreamland.game.drops
{

	import icecreamland.entity.Engine;
	import icecreamland.entity.Entity;
	import icecreamland.game.components.HealthComponent;

	public class HealthDrop extends Drop
	{
		private var _value:Number;

		public function HealthDrop( value:Number )
		{
			_value = value;
		}

		override public function apply( target:Entity, engine:Engine ):void
		{
			super.apply( target, engine );
			var health:HealthComponent = target.get( HealthComponent );
			health.current += _value;
			health.current = Math.min( health.current, health.maximum );
		}
	}
}
