/**
 * Created by m4yers on 04/02/15.
 */
package icecreamland.utils
{

	public class Asserts
	{
		public static function notNull( value:*, throws:Class, message:String ):void
		{
			if (!value)
			{
				throw new throws(message);
			}
		}

		public static function notZero( value:int, throws:Class, message:String ):void
		{
			if (value == 0)
			{
				throw new throws(message);
			}
		}
	}
}
