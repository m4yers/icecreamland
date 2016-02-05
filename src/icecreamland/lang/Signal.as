/**
 * Created by m4yers on 04/02/15.
 */
package icecreamland.lang
{

	public class Signal
	{
		private var _head:HandlerRecord;
		private var _tail:HandlerRecord;

		public function add( handler:Function ):void
		{
			addHandler( handler, false );
		}

		public function addOnce( handler:Function ):void
		{
			addHandler( handler, true );
		}

		private function addHandler( handler:Function, once:Boolean ):void
		{
			/**
			 * You can add new Handlers to the end during current dispatching cycle
			 */
			if (_tail)
			{
				_tail.next = new HandlerRecord( handler, once );
				_tail = _tail.next;
			}
			else
			{
				_tail = _head = new HandlerRecord( handler, once );
			}
		}

		public function remove( handler:Function ):void
		{
			var record:HandlerRecord = _head;
			var next:HandlerRecord;
			var prev:HandlerRecord;
			while (record)
			{
				next = record.next;

				if (record.handler === handler)
				{
					if (prev)
					{
						prev.next = next;
					}

					record.next = null;
				}
				else
				{
					prev = record;
				}

				record = next;
			}
		}

		public function dispatch( ...rest ):void
		{
			var record:HandlerRecord = _head;
			var prev:HandlerRecord;
			var next:HandlerRecord;
			while (record)
			{
				next = record.next;

				record.handler.apply(
					rest.slice(
						Math.min(
							record.handler.length,
							rest.length
						)
					)
				);

				if (record.once)
				{
					if (prev)
					{
						prev.next = next;
					}

					record.next = null;
				}
				else
				{
					prev = record;
				}

				record = next;
			}
		}
	}
}

internal class HandlerRecord
{
	public var next:HandlerRecord;

	public var handler:Function;
	public var once:Boolean;

	public function HandlerRecord( handler:Function, once:Boolean ):void
	{
		this.handler = handler;
		this.once = once;
	}
}
