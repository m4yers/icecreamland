/**
 * Created by m4yers on 03/02/15.
 */
package icecreamland.game.systems
{

	import flash.display.DisplayObjectContainer;
	import flash.geom.Point;

	import icecreamland.entity.Entity;
	import icecreamland.entity.System;
	import icecreamland.game.components.PositionComponent;
	import icecreamland.game.components.RendererComponent;

	public class RendererSystem extends System
	{
		private var _canvas:DisplayObjectContainer;

		public function RendererSystem( canvas:DisplayObjectContainer )
		{
			_canvas = canvas;
		}

		override public function update( delta:Number ):void
		{
			super.update( delta );

			var camera:CameraSystem = engine.getSystem( CameraSystem ) as CameraSystem;
			var offset:Point = camera.offset;

			while (_canvas.numChildren)
			{
				_canvas.removeChildAt( 0 );
			}

			var entities:Vector.<Entity> = engine.getEntities(
				RendererComponent,
				PositionComponent
			);

			var entity:Entity;
			var renderer:RendererComponent;
			var position:PositionComponent;
			for each (entity in entities)
			{
				renderer = entity.get( RendererComponent );
				position = entity.get( PositionComponent );

				renderer.renderer.x = position.x + offset.x;
				renderer.renderer.y = position.y + offset.y;

				_canvas.addChild( renderer.renderer );
			}
		}
	}
}
