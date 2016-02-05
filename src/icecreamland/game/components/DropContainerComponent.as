/**
 * Created by m4yers on 06/02/15.
 */
package icecreamland.game.components
{

	import icecreamland.entity.Entity;
	import icecreamland.utils.Chance;

	public class DropContainerComponent
	{
		public var entity:Entity;
		public var chance:Chance;

		public function DropContainerComponent( entity:Entity, chance:Chance = null )
		{
			this.entity = entity;
			this.chance = chance;
		}
	}
}
