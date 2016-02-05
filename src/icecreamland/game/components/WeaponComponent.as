/**
 * Created by m4yers on 06/02/15.
 */
package icecreamland.game.components
{

	import icecreamland.game.weapons.Weapon;

	public class WeaponComponent
	{
		private var _weapons:Vector.<Weapon>;

		public function WeaponComponent( weapon:Weapon )
		{
			_weapons = new <Weapon>[];
			_weapons.push( weapon );
		}

		public function push( weapon:Weapon ):void
		{
			_weapons.push( weapon );
		}

		public function pop( weapon:Weapon ):Weapon
		{
			return _weapons.pop();
		}

		public function clear():void
		{
			_weapons.length = 0;
		}

		public function get current():Weapon
		{
			return _weapons[_weapons.length - 1];
		}
	}
}
