/**
 * Created by m4yers on 03/02/15.
 */
package icecreamland.game.systems
{

	import icecreamland.entity.Entity;
	import icecreamland.entity.System;
	import icecreamland.game.components.MovementComponent;
	import icecreamland.game.components.PositionComponent;

	public class MovementSystem extends System
	{
		override public function update( delta:Number ):void
		{
			super.update( delta );

			var rate:Number = delta / 1000;
			var entities:Vector.<Entity> = engine.getEntities( MovementComponent, PositionComponent );

			var entity:Entity;
			var movement:MovementComponent;
			var position:PositionComponent;
			var angle:Number;
			var speed:Number;
			for each (entity in entities)
			{
				movement = entity.get( MovementComponent );
				position = entity.get( PositionComponent );

				angle = movement.angle;
				speed = movement.speed;

				position.x += (speed * Math.cos( angle ) + movement.dx ) * rate;
				position.y += (speed * Math.sin( angle ) + movement.dy ) * rate;
			}
		}
	}
}
