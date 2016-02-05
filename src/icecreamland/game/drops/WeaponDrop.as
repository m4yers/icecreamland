/**
 * Created by m4yers on 07/02/15.
 */
package icecreamland.game.drops
{

	import icecreamland.entity.Engine;
	import icecreamland.entity.Entity;
	import icecreamland.game.components.WeaponComponent;
	import icecreamland.game.weapons.Weapon;

	public class WeaponDrop extends Drop
	{
		private var _weapon:Weapon;

		public function WeaponDrop( weapon:Weapon )
		{
			_weapon = weapon;
		}

		override public function apply( target:Entity, engine:Engine ):void
		{
			super.apply( target, engine );

			var wc:WeaponComponent = target.get( WeaponComponent );
			wc.push( _weapon );
		}
	}
}
