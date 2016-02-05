/**
 * Created by m4yers on 06/02/15.
 */
package icecreamland.game.weapons
{

	import icecreamland.entity.Engine;
	import icecreamland.entity.Entity;
	import icecreamland.game.components.MovementComponent;
	import icecreamland.game.components.PositionComponent;
	import icecreamland.game.factories.EntityFactory;

	public class ShotgunWeapon extends Weapon
	{
		public function ShotgunWeapon( rounds:int )
		{
			super( rounds, 0.2 );
		}

		override protected function execute( owner:Entity, engine:Engine ):void
		{
			const speed:Number = 500.0;

			var position:PositionComponent = owner.get( PositionComponent );
			var movement:MovementComponent = owner.get( MovementComponent );
			var bullet:Entity;

			bullet = EntityFactory.createShell(
				EntityFactory.TYPE_SHELL_TWO,
				speed,
				movement.angle,
				position.x,
				position.y
			);

			engine.addEntity( bullet );

			bullet = EntityFactory.createShell(
				EntityFactory.TYPE_SHELL_TWO,
				speed,
				movement.angle - Math.PI / 15,
				position.x,
				position.y
			);

			engine.addEntity( bullet );

			bullet = EntityFactory.createShell(
				EntityFactory.TYPE_SHELL_TWO,
				speed,
				movement.angle + Math.PI / 15,
				position.x,
				position.y
			);

			engine.addEntity( bullet );

			reload();
		}
	}
}
