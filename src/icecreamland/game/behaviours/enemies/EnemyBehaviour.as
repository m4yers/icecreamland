/**
 * Created by m4yers on 08/02/15.
 */
package icecreamland.game.behaviours.enemies
{

	import icecreamland.entity.Engine;
	import icecreamland.entity.Entity;
	import icecreamland.game.behaviours.Behaviour;
	import icecreamland.game.components.DropContainerComponent;
	import icecreamland.game.components.HealthComponent;
	import icecreamland.game.components.MovementComponent;
	import icecreamland.game.components.PlayerComponent;
	import icecreamland.game.components.PositionComponent;
	import icecreamland.game.components.RendererComponent;
	import icecreamland.game.factories.EntityFactory;

	public class EnemyBehaviour extends Behaviour
	{
		override public function update( enemy:Entity, engine:Engine, delta:Number ):void
		{
			var player:Entity = engine.getEntities( PlayerComponent )[0];
			var ppc:PositionComponent = player.get( PositionComponent );
			var erc:RendererComponent;
			var epc:PositionComponent;
			var emc:MovementComponent;
			var ehc:HealthComponent;
			var edc:DropContainerComponent;
			var dpc:PositionComponent;
			var dx:Number;
			var dy:Number;
			erc = enemy.get( RendererComponent );
			epc = enemy.get( PositionComponent );
			emc = enemy.get( MovementComponent );
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
			}

			erc.renderer.health( ehc.current, ehc.maximum );

			dx = ppc.x - epc.x;
			dy = ppc.y - epc.y;
			emc.angle = Math.atan2( dy, dx );
		}
	}
}
