/**
 * Created by m4yers on 06/02/15.
 */
package icecreamland.game.weapons
{

	import flash.utils.getTimer;

	import icecreamland.entity.Engine;
	import icecreamland.entity.Entity;

	public class Weapon
	{
		public var rounds:int;
		public var _reload:Number;
		public var _left:Number;
		public var _last:Number;

		protected var owner:Entity;
		protected var engine:Engine;

		public function Weapon( rounds:int, reload:Number = 0.0 )
		{
			this.rounds = rounds;
			_reload = reload * 1000;
			_last = 0.0;
			_left = 0.0;
		}

		final public function fire( owner:Entity, engine:Engine ):void
		{
			var time = getTimer();
			_left -= time - _last;
			_last = time;

			if (_left <= 0.0)
			{
				execute( owner, engine );
			}
		}

		protected function execute( owner:Entity, engine:Engine ):void
		{
		}

		final protected function reload():void
		{
			_left = _reload;
		}
	}
}
