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

	public class SlingshotWeapon extends Weapon
	{
		public function SlingshotWeapon()
		{
			super( -1 );
		}

		override protected function execute( owner:Entity, engine:Engine ):void
		{
			var position:PositionComponent = owner.get( PositionComponent );
			var movement:MovementComponent = owner.get( MovementComponent );
			var bullet:Entity = EntityFactory.createShell(
				EntityFactory.TYPE_SHELL_ONE,
				400.0,
				movement.angle,
				position.x,
				position.y
			);

			engine.addEntity( bullet );
		}
	}
}
