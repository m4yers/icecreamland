/**
 * Created by m4yers on 04/02/15.
 */
package icecreamland.game.systems
{

	import flash.display.DisplayObjectContainer;
	import flash.geom.Point;

	import icecreamland.entity.Entity;
	import icecreamland.entity.System;
	import icecreamland.game.components.PlayerComponent;
	import icecreamland.game.components.PositionComponent;

	public class CameraSystem extends System
	{
		public static const HELPER_POINT:Point = new Point();

		public var offset:Point;

		private var _canvas:DisplayObjectContainer;
		private var _center:Point;

		public function CameraSystem( canvas:DisplayObjectContainer, sx:Number, sy:Number )
		{
			_canvas = canvas;
			_center = new Point( sx / 2, sy / 2 );

			offset = new Point();
		}

		override public function update( delta:Number ):void
		{
			super.update( delta );

			/**
			 * We always follow player
			 */
			var player:Entity = engine.getEntities( PlayerComponent )[0];
			var entities:Vector.<Entity> = engine.getEntities( PositionComponent );
			var position:PositionComponent = player.get( PositionComponent );

			HELPER_POINT.x = position.x;
			HELPER_POINT.y = position.y;
			var screen:Point = _canvas.localToGlobal( HELPER_POINT );
			offset.x = _center.x - screen.x;
			offset.y = _center.y - screen.y;
		}
	}
}
