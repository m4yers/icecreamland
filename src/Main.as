package
{

	import flash.display.Sprite;
	import flash.events.Event;

	import icecreamland.game.IceCreamLandGame;

	import sample.MurmurHash.MurmurHash3;

	[SWF(width="800", height="600", backgroundColor="#333333")]
	public class Main extends Sprite
	{
		public function Main()
		{
			if (stage)
			{
				addedToStageHandler();
			}
			else
			{
				addEventListener( Event.ADDED_TO_STAGE, addedToStageHandler );
			}
		}

		private function addedToStageHandler( event:Event = null ):void
		{
			stage.frameRate = 60;
			new IceCreamLandGame( stage ).start();
		}
	}
}
