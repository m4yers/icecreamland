/**
 * Created by m4yers on 08/02/15.
 */
package icecreamland.game.behaviours.weapon
{

	import icecreamland.entity.Engine;
	import icecreamland.entity.Entity;
	import icecreamland.game.components.EnemyComponent;
	import icecreamland.game.components.HealthComponent;
	import icecreamland.game.components.PhysicsComponent;
	import icecreamland.game.components.ShellComponent;
	import icecreamland.game.behaviours.Behaviour;
	import icecreamland.game.factories.EntityFactory;
	import icecreamland.physics.Collision;

	public class ShellBehaviour extends Behaviour
	{
		override public function update( shell:Entity, engine:Engine, delta:Number ):void
		{
			var spc:PhysicsComponent;
			var ssc:ShellComponent;
			var ehc:HealthComponent;
			var col:Collision;

			spc = shell.get( PhysicsComponent );
			if (spc.collisions)
			{
				ssc = shell.get( ShellComponent );
				for each (col in spc.collisions)
				{
					if (col.other.get( EnemyComponent ))
					{
						ehc = col.other.get( HealthComponent );
						ehc.current -= ssc.power;
						engine.removeEntity( shell );
						EntityFactory.destroy( shell );
						break;
					}
				}
			}
		}
	}
}
