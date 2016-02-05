/**
 * Created by m4yers on 08/02/15.
 */
package icecreamland.game.behaviours.weapon
{

	import icecreamland.entity.Engine;
	import icecreamland.entity.Entity;
	import icecreamland.game.components.EnemyComponent;
	import icecreamland.game.components.HealthComponent;
	import icecreamland.game.components.PayloadComponent;
	import icecreamland.game.components.PhysicsComponent;
	import icecreamland.game.components.PositionComponent;
	import icecreamland.game.components.ShellComponent;
	import icecreamland.game.factories.EntityFactory;
	import icecreamland.physics.Collision;

	public class GrenadeBehaviour extends ShellBehaviour
	{
		override public function update( shell:Entity, engine:Engine, delta:Number ):void
		{
			var sphc:PhysicsComponent;
			var spc:PositionComponent;
			var ssc:ShellComponent;
			var ehc:HealthComponent;
			var pc:PayloadComponent;
			var node:Entity;
			var npc:PositionComponent;
			var col:Collision;

			sphc = shell.get( PhysicsComponent );
			if (sphc.collisions)
			{
				ssc = shell.get( ShellComponent );
				for each (col in sphc.collisions)
				{
					if (col.other.get( EnemyComponent ))
					{
						ehc = col.other.get( HealthComponent );
						ehc.current -= ssc.power;
						pc = shell.get( PayloadComponent );
						spc = shell.get( PositionComponent );
						for each (node in pc.entities)
						{
							npc = node.get( PositionComponent );
							npc.x = spc.x;
							npc.y = spc.y;
							engine.addEntity( node );
						}
						engine.removeEntity( shell );
						EntityFactory.destroy( shell );
						break;
					}
				}
			}
		}
	}
}
