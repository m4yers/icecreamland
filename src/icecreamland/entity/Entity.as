/**
 * Created by m4yers on 03/02/15.
 */
package icecreamland.entity
{

	import flash.errors.IllegalOperationError;
	import flash.utils.Dictionary;
	import flash.utils.flash_proxy;

	import icecreamland.lang.Signal;
	import icecreamland.utils.Asserts;

	use namespace flash_proxy;

	public class Entity
	{
		internal var _components:Dictionary;
		internal var _componentAdded:Signal;
		internal var _componentRemoved:Signal;

		public function Entity():void
		{
			_components = new Dictionary();
			_componentAdded = new Signal();
			_componentRemoved = new Signal();
		}

		public function add( component:*, type:* = null ):Entity
		{
			Asserts.notNull( component, IllegalOperationError, "Component cannot be null" );
			_components[type || component.constructor] = component;
			_componentAdded.dispatch( this, component, type );

			return this;
		}

		public function get( type:* ):*
		{
			return _components[type];
		}

		public function remove( type:* ):*
		{
			var component:* = _components[type];
			delete _components[type];
			_componentRemoved.dispatch( this, component, type );
			return component;
		}
	}
}
