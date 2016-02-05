/**
 * Created by m4yers on 07/02/15.
 */
package icecreamland.game.components
{

	import icecreamland.entity.Entity;
	import icecreamland.entity.System;

	public class AnimationSystem extends System
	{
		override public function update( delta:Number ):void
		{
			super.update( delta );

			var entities:Vector.<Entity> = engine.getEntities( RendererComponent );
			var entity:Entity;
			var r:RendererComponent;
			for each (entity in entities)
			{
				r = entity.get( RendererComponent );
				r.renderer.animate( delta );
			}
		}
	}
}
