/**
 * Created by m4yers on 03/02/15.
 */
package icecreamland.game
{

	import flash.display.Stage;
	import flash.events.Event;
	import flash.utils.getTimer;

	import icecreamland.entity.Engine;
	import icecreamland.game.behaviours.enemies.EnemyBehaviour;
	import icecreamland.game.components.AnimationSystem;
	import icecreamland.game.behaviours.weapon.GrenadeBehaviour;
	import icecreamland.game.behaviours.weapon.ShellBehaviour;
	import icecreamland.game.factories.EntityFactory;
	import icecreamland.game.systems.CameraSystem;
	import icecreamland.game.systems.EnemyBehaviourSystem;
	import icecreamland.game.systems.EnemySpawnSystem;
	import icecreamland.game.systems.MovementSystem;
	import icecreamland.game.systems.PhysicsSystem;
	import icecreamland.game.systems.PlayerSystem;
	import icecreamland.game.systems.RendererSystem;
	import icecreamland.game.systems.TTLSystem;
	import icecreamland.game.systems.BehaviourSystem;

	public class IceCreamLandGame
	{
		private var _stage:Stage;
		private var _engine:Engine;
		private var _running:Boolean;

		private var _time:Number;

		public function IceCreamLandGame( stage:Stage )
		{
			_stage = stage;

			_engine = new Engine();
			/**
			 * Order matters here
			 */
			_engine.addSystem( new PhysicsSystem() );
			_engine.addSystem(
				new BehaviourSystem(
					new EnemyBehaviour(),
					new ShellBehaviour(),
					new GrenadeBehaviour()
				)
			);
			_engine.addSystem( new TTLSystem() );
			_engine.addSystem( new PlayerSystem( _stage ) );
			_engine.addSystem( new EnemySpawnSystem() );
//			_engine.addSystem( new EnemyBehaviourSystem() );
			_engine.addSystem( new MovementSystem() );
			_engine.addSystem( new CameraSystem( _stage, 800.0, 600.0 ) );
			_engine.addSystem( new AnimationSystem() );
			_engine.addSystem( new RendererSystem( _stage ) );

			_engine.addEntity( EntityFactory.createPlayer() );

			_time = getTimer();
		}

		private function enterFrameHandler( event:Event ):void
		{
			var time:Number = getTimer();
			var delta:Number = time - _time;
			_time = time;

			_engine.advance( delta );
		}

		public function start():void
		{
			if (!_running)
			{
				_stage.addEventListener( Event.ENTER_FRAME, enterFrameHandler );
				_running = true;
			}
		}

		public function stop():void
		{
			if (_running)
			{
				_stage.removeEventListener( Event.ENTER_FRAME, enterFrameHandler );
				_running = false;
			}
		}
	}
}
