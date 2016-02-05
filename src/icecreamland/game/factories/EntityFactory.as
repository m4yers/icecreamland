/**
 * Created by m4yers on 03/02/15.
 */
package icecreamland.game.factories
{

	import icecreamland.entity.Entity;
	import icecreamland.game.behaviours.enemies.EnemyBehaviour;
	import icecreamland.game.behaviours.weapon.GrenadeBehaviour;
	import icecreamland.game.behaviours.weapon.ShellBehaviour;
	import icecreamland.game.components.BehaviourComponent;
	import icecreamland.game.components.DropComponent;
	import icecreamland.game.components.DropContainerComponent;
	import icecreamland.game.components.EnemyComponent;
	import icecreamland.game.components.HealthComponent;
	import icecreamland.game.components.MovementComponent;
	import icecreamland.game.components.PayloadComponent;
	import icecreamland.game.components.PhysicsComponent;
	import icecreamland.game.components.PlayerComponent;
	import icecreamland.game.components.PositionComponent;
	import icecreamland.game.components.RendererComponent;
	import icecreamland.game.components.ShellComponent;
	import icecreamland.game.components.TTLComponent;
	import icecreamland.game.components.WeaponComponent;
	import icecreamland.game.drops.HealthDrop;
	import icecreamland.game.drops.WeaponDrop;
	import icecreamland.game.renderers.GrenadeRenderer;
	import icecreamland.game.renderers.HealthDropRenderer;
	import icecreamland.game.renderers.PlayerRenderer;
	import icecreamland.game.renderers.QuickBastardEnemyRenderer;
	import icecreamland.game.renderers.QuickDeathBulletRenderer;
	import icecreamland.game.renderers.ShotgunWeaponDropRenderer;
	import icecreamland.game.renderers.TrickyFatEnemyRenderer;
	import icecreamland.game.renderers.YellowMinionEnemyRenderer;
	import icecreamland.game.weapons.GrenadeLauncherWeapon;
	import icecreamland.game.weapons.ShotgunWeapon;
	import icecreamland.game.weapons.SlingshotWeapon;
	import icecreamland.utils.Chance;

	public class EntityFactory
	{
		public static const TYPE_ENEMY_ONE:int = 0;
		public static const TYPE_ENEMY_TWO:int = 1;
		public static const TYPE_ENEMY_THREE:int = 2;

		public static const TYPE_DROP_HEALTH:int = 0;
		public static const TYPE_DROP_SHOTGUN:int = 1;
		public static const TYPE_DROP_GRENADE_LAUNCHER:int = 2;

		public static const TYPE_SHELL_ONE:int = 0;
		public static const TYPE_SHELL_TWO:int = 1;
		public static const TYPE_SHELL_GRENADE:int = 2;
		public static const TYPE_SHELL_GRENADE_NODE:int = 3;

		public static function createPlayer():Entity
		{
			var entity:Entity = new Entity();
			entity.add( new RendererComponent( new PlayerRenderer() ) );
			entity.add( new PhysicsComponent( 30.0 ) );
			entity.add( new PositionComponent( 0.0, 0.0 ) );
			entity.add( new MovementComponent( 0.0, 0.0, 0.0, 0.0 ) );
			entity.add( new WeaponComponent( new SlingshotWeapon() ) );
			entity.add( new HealthComponent( 10 ) );
			entity.add( new PlayerComponent() );

			return entity;
		}

		public static function createEnemy( type:int, x:Number, y:Number ):Entity
		{
			var entity:Entity;
			switch (type)
			{
				case TYPE_ENEMY_ONE:
				{
					entity = new Entity();
					entity.add( new RendererComponent( new YellowMinionEnemyRenderer() ) );
					entity.add( new PhysicsComponent( 15.0 ) );
					entity.add( new PositionComponent( x, y ) );
					entity.add( new MovementComponent( 30.0, 0.0, 0.0, 0.0 ) );
					entity.add( new HealthComponent( 2 ) );
					entity.add( new BehaviourComponent( EnemyBehaviour ) );
					entity.add(
						new DropContainerComponent(
							createDrop( TYPE_DROP_HEALTH ),
							new Chance( 0.2 )
						)
					);
					entity.add( new EnemyComponent() );
					break;
				}
				case TYPE_ENEMY_TWO:
				{
					entity = new Entity();
					entity.add( new RendererComponent( new QuickBastardEnemyRenderer() ) );
					entity.add( new PhysicsComponent( 10.0 ) );
					entity.add( new PositionComponent( x, y ) );
					entity.add( new MovementComponent( 100.0, 0.0, 0.0, 0.0 ) );
					entity.add( new HealthComponent( 1 ) );
					entity.add( new BehaviourComponent( EnemyBehaviour ) );
					entity.add( new EnemyComponent() );
					entity.add(
						new DropContainerComponent(
							createDrop( TYPE_DROP_GRENADE_LAUNCHER ),
							new Chance( 0.3 )
						)
					);
					break;
				}
				case TYPE_ENEMY_THREE:
				{
					entity = new Entity();
					entity.add( new RendererComponent( new TrickyFatEnemyRenderer() ) );
					entity.add( new PhysicsComponent( 50.0 ) );
					entity.add( new PositionComponent( x, y ) );
					entity.add( new MovementComponent( 20.0, 0.0, 0.0, 0.0 ) );
					entity.add( new HealthComponent( 10 ) );
					entity.add( new BehaviourComponent( EnemyBehaviour ) );
					entity.add(
						new DropContainerComponent(
							createDrop( TYPE_DROP_SHOTGUN ),
							new Chance( 0.5 )
						)
					);
					entity.add( new EnemyComponent() );
					break;
				}
			}

			return entity;
		}

		public static function createShell( type:int, speed:Number, angle:Number, x:Number, y:Number ):Entity
		{
			var entity:Entity;
			switch (type)
			{
				case TYPE_SHELL_ONE:
				{
					entity = new Entity();
					entity.add( new RendererComponent( new QuickDeathBulletRenderer() ) );
					entity.add( new PhysicsComponent( 5.0 ) );
					entity.add( new PositionComponent( x, y ) );
					entity.add( new MovementComponent( speed, angle, 0.0, 0.0 ) );
					entity.add( new TTLComponent( 3.0 ) );
					entity.add( new ShellComponent( 1.0 ) );
					entity.add( new BehaviourComponent( ShellBehaviour ) );
					break;
				}

				case TYPE_SHELL_TWO:
				{
					entity = new Entity();
					entity.add( new RendererComponent( new QuickDeathBulletRenderer( 0xbb1111 ) ) );
					entity.add( new PhysicsComponent( 5.0 ) );
					entity.add( new PositionComponent( x, y ) );
					entity.add( new MovementComponent( speed, angle, 0.0, 0.0 ) );
					entity.add( new TTLComponent( 3.0 ) );
					entity.add( new ShellComponent( 1.0 ) );
					entity.add( new BehaviourComponent( ShellBehaviour ) );
					break;
				}

				case TYPE_SHELL_GRENADE:
				{
					entity = new Entity();
					entity.add( new RendererComponent( new GrenadeRenderer( 200.0 ) ) );
					entity.add( new PhysicsComponent( 15.0 ) );
					entity.add( new PositionComponent( x, y ) );
					entity.add( new MovementComponent( speed, angle, 0.0, 0.0 ) );
					entity.add( new TTLComponent( 3.0 ) );
					entity.add( new ShellComponent( 0.0 ) );
					entity.add( new BehaviourComponent( GrenadeBehaviour ) );
					var payload:Vector.<Entity> = new <Entity>[];
					var i:int;
					for (i = 0; i < GrenadeRenderer.NUMBER; ++i)
					{
						payload.push(
							EntityFactory.createShell(
								EntityFactory.TYPE_SHELL_GRENADE_NODE,
								100.0,
								GrenadeRenderer.STEP * i,
								0.0,
								0.0
							)
						);
					}

					entity.add( new PayloadComponent( payload ) );

					break;
				}

				case TYPE_SHELL_GRENADE_NODE:
				{
					entity = new Entity();
					entity.add( new RendererComponent( new QuickDeathBulletRenderer( 0x33ff33, 3.0 ) ) );
					entity.add( new PhysicsComponent( 3.0 ) );
					entity.add( new PositionComponent( x, y ) );
					entity.add( new MovementComponent( speed, angle, 0.0, 0.0 ) );
					entity.add( new TTLComponent( 3.0 ) );
					entity.add( new ShellComponent( 1.0 ) );
					entity.add( new BehaviourComponent( ShellBehaviour ) );
					break;
				}
			}

			return entity;
		}

		public static function createDrop( type:int ):Entity
		{
			var entity:Entity;
			switch (type)
			{
				case TYPE_DROP_HEALTH:
				{
					entity = new Entity();
					entity.add( new RendererComponent( new HealthDropRenderer() ) );
					entity.add( new PhysicsComponent( 10.0 ) );
					entity.add( new PositionComponent( 0.0, 0.0 ) );
					entity.add( new TTLComponent( 5.0 ) );
					entity.add( new DropComponent( new HealthDrop( 1 ) ) );
					break;
				}

				case TYPE_DROP_SHOTGUN:
				{
					entity = new Entity();
					entity.add( new RendererComponent( new ShotgunWeaponDropRenderer() ) );
					entity.add( new PhysicsComponent( 10.0 ) );
					entity.add( new PositionComponent( 0.0, 0.0 ) );
					entity.add( new TTLComponent( 5.0 ) );
					entity.add( new DropComponent( new WeaponDrop( new ShotgunWeapon( 10 ) ) ) );
					break;
				}

				case TYPE_DROP_GRENADE_LAUNCHER:
				{
					entity = new Entity();
					entity.add( new RendererComponent( new GrenadeRenderer() ) );
					entity.add( new PhysicsComponent( 10.0 ) );
					entity.add( new PositionComponent( 0.0, 0.0 ) );
					entity.add( new TTLComponent( 5.0 ) );
					entity.add( new DropComponent( new WeaponDrop( new GrenadeLauncherWeapon( 10 ) ) ) );
					break;
				}
			}
			return entity;
		}

		public static function destroy( entity:Entity ):void
		{
			// ;)
		}
	}
}
