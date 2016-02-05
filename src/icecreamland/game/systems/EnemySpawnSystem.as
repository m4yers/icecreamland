/**
 * Created by m4yers on 06/02/15.
 */
package icecreamland.game.systems
{

	import icecreamland.entity.Entity;
	import icecreamland.entity.System;
	import icecreamland.game.components.EnemyComponent;
	import icecreamland.game.components.PlayerComponent;
	import icecreamland.game.components.PositionComponent;
	import icecreamland.game.factories.EntityFactory;

	public class EnemySpawnSystem extends System
	{
		public static const MAX_ENEMIES:int = 50;

		override public function update( delta:Number ):void
		{
			super.update( delta );

			const types:Vector.<int> = Vector.<int>(
				[
					EntityFactory.TYPE_ENEMY_ONE,
					EntityFactory.TYPE_ENEMY_TWO,
					EntityFactory.TYPE_ENEMY_THREE
				]
			);
			const weights:Vector.<Number> = Vector.<Number>( [4, 2, 1.5] );
			var enemies:Vector.<Entity> = engine.getEntities( EnemyComponent );
			var player:Entity = engine.getEntities( PlayerComponent )[0];
			var ppc:PositionComponent = player.get( PositionComponent );

			var enemy:Entity;
			var distance:Number;
			var angle:Number;
			var calc:Number;
			var big:Number = 0.0;
			var adds:int = enemies ? Math.max( MAX_ENEMIES - enemies.length, 0 ) : MAX_ENEMIES;
			var tp:int;
			var i:int;
			while (adds--)
			{
				for (i = 0; i < weights.length; ++i)
				{
					calc = weights[i] * Math.random();
					if (calc > big)
					{
						big = calc;
						tp = i;
					}
				}
				distance = Math.random() * 200.0 + 400.0;
				angle = Math.random() * Math.PI * 2;
				enemy = EntityFactory.createEnemy(
					types[tp],
					ppc.x + distance * Math.cos( angle ) - Math.sin( angle ),
					ppc.y + distance * Math.sin( angle ) + Math.cos( angle )
				);
				engine.addEntity( enemy );
			}
		}
	}
}
