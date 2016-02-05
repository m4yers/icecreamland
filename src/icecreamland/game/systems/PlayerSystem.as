/**
 * Created by m4yers on 04/02/15.
 */
package icecreamland.game.systems
{

	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.ui.Keyboard;

	import icecreamland.entity.Entity;
	import icecreamland.entity.System;
	import icecreamland.game.components.DropComponent;
	import icecreamland.game.components.EnemyComponent;
	import icecreamland.game.components.HealthComponent;
	import icecreamland.game.components.MovementComponent;
	import icecreamland.game.components.PhysicsComponent;
	import icecreamland.game.components.PlayerComponent;
	import icecreamland.game.components.PositionComponent;
	import icecreamland.game.components.RendererComponent;
	import icecreamland.game.components.WeaponComponent;
	import icecreamland.game.factories.EntityFactory;
	import icecreamland.game.weapons.SlingshotWeapon;
	import icecreamland.game.weapons.Weapon;
	import icecreamland.physics.Collision;

	public class PlayerSystem extends System
	{
		public static const SPEED:Number = 150.0;
		public static const STRAFE:Number = 75.0;

		private var _stage:Stage;
		private var _up:Boolean;
		private var _right:Boolean;
		private var _down:Boolean;
		private var _left:Boolean;

		public function PlayerSystem( stage:Stage )
		{
			_stage = stage;
			_stage.addEventListener( MouseEvent.CLICK, mouseClickHandler );
			_stage.addEventListener( KeyboardEvent.KEY_DOWN, keyDownHandler );
			_stage.addEventListener( KeyboardEvent.KEY_UP, keyUpHandler );
		}

		private function keyDownHandler( event:KeyboardEvent ):void
		{
			switch (event.keyCode)
			{
				case Keyboard.W:
					_up = true;
					break;

				case Keyboard.D:
					_right = true;
					break;

				case Keyboard.S:
					_down = true;
					break;

				case Keyboard.A:
					_left = true;
					break;
			}
		}

		private function keyUpHandler( event:KeyboardEvent ):void
		{
			switch (event.keyCode)
			{
				case Keyboard.W:
					_up = false;
					break;

				case Keyboard.D:
					_right = false;
					break;

				case Keyboard.S:
					_down = false;
					break;

				case Keyboard.A:
					_left = false;
					break;
			}
		}

		private function mouseClickHandler( event:MouseEvent ):void
		{
			var player:Entity = engine.getEntities( PlayerComponent )[0];
			var weapon:Weapon = WeaponComponent( player.get( WeaponComponent ) ).current;
			weapon.fire( player, engine );
		}

		override public function update( delta:Number ):void
		{
			super.update( delta );

			var camera:CameraSystem = engine.getSystem( CameraSystem ) as CameraSystem;
			var offset:Point = camera.offset;
			var player:Entity = engine.getEntities( PlayerComponent )[0];

			var position:PositionComponent = player.get( PositionComponent );
			var movement:MovementComponent = player.get( MovementComponent );
			var renderer:RendererComponent = player.get( RendererComponent );

			var dx:Number = _stage.mouseX - position.x - offset.x;
			var dy:Number = _stage.mouseY - position.y - offset.y;
			var an:Number = Math.atan2( dy, dx );

			movement.angle = an;

			if (_up)
			{
				movement.dy = -SPEED;
			}
			else if (_down)
			{
				movement.dy = SPEED;
			}
			else
			{
				movement.dy = 0.0;
			}

			if (_left)
			{
				movement.dx = -SPEED;
			}
			else if (_right)
			{
				movement.dx = SPEED;
			}
			else
			{
				movement.dx = 0.0;
			}

			//FPS like
//			if (_up)
//			{
//				movement.speed = SPEED;
//			}
//			else if (_down)
//			{
//				movement.speed = -SPEED;
//			}
//			else
//			{
//				movement.speed = 0.0;
//			}
//
//			if (_left)
//			{
//				var lan:Number = an - Math.PI / 2;
//				movement.dx = STRAFE * Math.cos( lan ) - Math.sin( lan );
//				movement.dy = STRAFE * Math.sin( lan ) + Math.cos( lan );
//			}
//			else if (_right)
//			{
//				var ran:Number = an + Math.PI / 2;
//				movement.dx = STRAFE * Math.cos( ran ) - Math.sin( ran );
//				movement.dy = STRAFE * Math.sin( ran ) + Math.cos( ran );
//			}
//			else
//			{
//				movement.dx = 0.0;
//				movement.dy = 0.0;
//			}


			//TODO not a place for it
			renderer.renderer.lookAt( an );

			var phc:PhysicsComponent = player.get( PhysicsComponent );
			var hc:HealthComponent = player.get( HealthComponent );
			var wc:WeaponComponent = player.get( WeaponComponent );
			var dc:DropComponent;
			var col:Collision;
			if (phc.collisions)
			{
				for each (col in phc.collisions)
				{
					dc = col.other.get( DropComponent );
					if (dc)
					{
						dc.drop.apply( player, engine );
						engine.removeEntity( col.other );
						EntityFactory.destroy( col.other );
					}
					else if (col.other.get( EnemyComponent ))
					{
						hc.current -= delta / 1000;
					}
				}
			}

			if (hc.current <= 0)
			{
				// basically restart
				var all:Vector.<Entity> = engine.getEntities( RendererComponent );
				var entity:Entity;
				for each (entity in all)
				{
					if (entity !== player)
					{
						engine.removeEntity( entity );
						EntityFactory.destroy( entity );
					}
				}
				wc.clear();
				wc.push( new SlingshotWeapon() );
				position.x = 0.0;
				position.y = 0.0;
				hc.current = hc.maximum;
			}

			renderer.renderer.health( hc.current, hc.maximum );
		}
	}
}
