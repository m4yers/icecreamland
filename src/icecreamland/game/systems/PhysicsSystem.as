/**
 * Created by m4yers on 06/02/15.
 */
package icecreamland.game.systems
{

	import icecreamland.entity.Entity;
	import icecreamland.entity.System;
	import icecreamland.game.components.PhysicsComponent;
	import icecreamland.game.components.PositionComponent;
	import icecreamland.physics.Collision;

	public class PhysicsSystem extends System
	{
		override public function update( delta:Number ):void
		{
			super.update( delta );

			var entities:Vector.<Entity> = engine.getEntities(
				PhysicsComponent,
				PositionComponent
			);

			var e1:Entity;
			var e1pos:PositionComponent;
			var e1phys:PhysicsComponent;
			var e2:Entity;
			var e2pos:PositionComponent;
			var e2phys:PhysicsComponent;
			var a:Number;
			var b:Number;
			var c:Number;
			var i:int;
			var j:int;
			//TODO there are must be a better solution for cleaning
			for each (e1 in entities)
			{
				e1phys = e1.get( PhysicsComponent );
				e1phys.collisions.length = 0;
			}
			for (i = 0; i < entities.length - 1; ++i)
			{
				e1 = entities[i];
				e1pos = e1.get( PositionComponent );
				e1phys = e1.get( PhysicsComponent );

				for (j = i + 1; j < entities.length; ++j)
				{
					e2 = entities[j];
					e2pos = e2.get( PositionComponent );
					e2phys = e2.get( PhysicsComponent );

					a = e1pos.x - e2pos.x;
					b = e1pos.y - e2pos.y;
					c = Math.sqrt( a * a + b * b );

					if (c - e2phys.radius - e1phys.radius < 0)
					{
						e1phys.collisions.push( new Collision( e1, e2 ) );
						e2phys.collisions.push( new Collision( e2, e1 ) );
					}
				}
			}
		}
	}
}

