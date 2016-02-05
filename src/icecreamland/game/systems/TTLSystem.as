/**
 * Created by m4yers on 05/02/15.
 */
package icecreamland.game.systems
{

	import icecreamland.entity.Entity;
	import icecreamland.entity.System;
	import icecreamland.game.components.TTLComponent;
	import icecreamland.game.factories.EntityFactory;

	public class TTLSystem extends System
	{
		override public function update( delta:Number ):void
		{
			super.update( delta );

			var dt:Number = delta / 1000;
			var entities:Vector.<Entity> = engine.getEntities( TTLComponent );
			var entity:Entity;
			var ttl:TTLComponent;
			for each (entity in entities)
			{
				ttl = entity.get( TTLComponent );
				ttl.seconds -= dt;

				if (ttl.seconds <= 0.0)
				{
					engine.removeEntity( entity );
					EntityFactory.destroy( entity );
				}
			}
		}
	}
}
