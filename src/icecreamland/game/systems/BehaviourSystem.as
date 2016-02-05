/**
 * Created by m4yers on 08/02/15.
 */
package icecreamland.game.systems
{

	import flash.utils.Dictionary;

	import icecreamland.entity.Entity;
	import icecreamland.entity.System;
	import icecreamland.game.behaviours.Behaviour;
	import icecreamland.game.components.BehaviourComponent;

	public class BehaviourSystem extends System
	{
		private var _behaviours:Dictionary;

		public function BehaviourSystem( ...behaviours ):void
		{
			_behaviours = new Dictionary();
			for each (var behaviour:* in behaviours)
			{
				if (behaviour is Behaviour)
				{
					_behaviours[behaviour.constructor] = behaviour;
				}
			}
		}

		override public function update( delta:Number ):void
		{
			var entities:Vector.<Entity> = engine.getEntities( BehaviourComponent );
			var shell:Entity;
			var sbc:BehaviourComponent;
			if (entities)
			{
				for each (shell in entities)
				{
					sbc = shell.get( BehaviourComponent );
					if (sbc && _behaviours[sbc.type])
					{
						_behaviours[sbc.type].update( shell, engine, delta );
					}
				}
			}
		}
	}
}
