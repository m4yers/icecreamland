/**
 * Created by m4yers on 07/02/15.
 */
package icecreamland.utils
{

	public class Chance
	{
		private var _weight:Number;

		public function Chance( weight:Number )
		{
			_weight = 1.0 - weight;
		}

		public function iamlucky():Boolean
		{
			return Math.random() > _weight;
		}
	}
}
