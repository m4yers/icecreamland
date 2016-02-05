/**
 * Created by m4yers on 03/02/15.
 */
package icecreamland.game.systems
{

	import icecreamland.entity.Entity;
	import icecreamland.entity.System;
	import icecreamland.game.components.DropContainerComponent;
	import icecreamland.game.components.EnemyComponent;
	import icecreamland.game.components.HealthComponent;
	import icecreamland.game.components.MovementComponent;
	import icecreamland.game.components.PhysicsComponent;
	import icecreamland.game.components.PlayerComponent;
	import icecreamland.game.components.PositionComponent;
	import icecreamland.game.components.RendererComponent;
	import icecreamland.game.factories.EntityFactory;

	public class EnemyBehaviourSystem extends System
	{
		override public function update( delta:Number ):void
		{
			super.update( delta );

			var player:Entity = engine.getEntities( PlayerComponent )[0];
			var ppc:PositionComponent = player.get( PositionComponent );
			var enemies:Vector.<Entity> = engine.getEntities( EnemyComponent );
			var enemy:Entity;
			var erc:RendererComponent;
			var epc:PositionComponent;
			var emc:MovementComponent;
			var eph:PhysicsComponent;
			var ehc:HealthComponent;
			var edc:DropContainerComponent;
			var dpc:PositionComponent;
			var dx:Number;
			var dy:Number;
			for each (enemy in enemies)
			{
				erc = enemy.get( RendererComponent );
				epc = enemy.get( PositionComponent );
				emc = enemy.get( MovementComponent );
				eph = enemy.get( PhysicsComponent );
				ehc = enemy.get( HealthComponent );

				if (ehc.current <= 0)
				{
					// Drop if has some
					edc = enemy.get( DropContainerComponent );
					if (edc && (!edc.chance || edc.chance.iamlucky()))
					{
						dpc = edc.entity.get( PositionComponent );
						dpc.x = epc.x;
						dpc.y = epc.y;
						engine.addEntity( edc.entity );
					}

					engine.removeEntity( enemy );
					EntityFactory.destroy( enemy );
					continue;
				}

				erc.renderer.health( ehc.current, ehc.maximum );

				dx = ppc.x - epc.x;
				dy = ppc.y - epc.y;
				emc.angle = Math.atan2( dy, dx );
			}
		}
	}
}
