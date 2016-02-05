#  ICECREAM LAND
It is a test project i've developed some time ago in bare Flash without using any framework at all.
![alt tag](https://raw.githubusercontent.com/m4yers/icecreamland/master/pics/pic3.jpg)

## MECHANICS
You start with a simple Slingshot weapon. Kill enemies. Collect drop. Survive;)

## PLAYER
Has 10 health.

## ENEMIES
 - YellowMinion - dumb yellow relatively quick enemy, has 2 health.
 - QuickBastard - quick purple enemy, has 1 health.
 - TrickyFatty - slow fat bluish enemy, has 10 health.

## DROP
 - Health - drops from YellowMinion with 0.2 chance.
 - Grenade - drops from QuickBastard with 0.3 chance
 - Shotgun - drops from TrickyFatty with 0.5 chance.

## WEAPONARY
 - Slingshot - simple one click - one shot weapon.
 - Grenade - upon impact bursts into 8 Slingahot-like bullets
 - Shotgun - fires three bullets, has 0.2 seconds cooldown.

## SYSTEMS
 - PhysicsSystem - very basic collision detection.
 - BehaviourSystem - a top level behaviour system, controlls concrete Behaviours(enemy, shells)
 - TTLSystem - tracks how long an Entity is going to live.
 - PlayerSystem - responsible for player WASD movement and Mouse, also checks collisions against
 - Enemies and Drops.
 - EnemySpawnSystem - tracks how many Enemies are on Stage and adds more.
 - MovementSystem - moves Entities.
 - CameraSystem - moves Camera to Players coordinates
 - AnimationSystem - animate something.
 - RendererSystem - renderers Entities.

## ADDING NEW STUFF
- decide what you gonna create a drop/enemy/shell or something else?
- create Renderer
- go EntityFactory
- add new Entity creation to a desired method
- make it appear
