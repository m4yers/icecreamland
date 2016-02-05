/**
 * Created by m4yers on 03/02/15.
 */
package icecreamland.entity
{

	import flash.errors.IllegalOperationError;
	import flash.utils.Dictionary;

	import icecreamland.utils.Asserts;

	public class Engine
	{
		private var _systems:Vector.<System>;
		private var _systemsByType:Dictionary;
		private var _entities:Dictionary;

		public function Engine()
		{
			_systems = new <System>[];
			_systemsByType = new Dictionary();
			_entities = new Dictionary();
		}

		public function advance( delta:Number ):void
		{
			var system:System;
			for each (system in _systems)
			{
				system.update( delta );
			}
		}

		public function addSystem( system:System, type:* = null ):void
		{
			system.engine = this;
			_systems.indexOf( system ) == -1 &&
			_systems.push( system );
			_systemsByType[type || Object( system ).constructor] = system;
		}

		public function getSystem( type:* ):System
		{
			return _systemsByType[type];
		}

		public function addEntity( entity:Entity ):void
		{
			entity._componentAdded.add( addComponent );
			entity._componentRemoved.add( removeComponent );

			var type:*;
			for (type in entity._components)
			{
				addComponent( entity, entity._components[type], type );
			}
		}

		public function removeEntity( entity:Entity ):void
		{
			entity._componentAdded.remove( addComponent );
			entity._componentRemoved.remove( removeComponent );

			var type:*;
			for (type in entity._components)
			{
				removeComponent( entity, entity._components[type], type );
			}
		}

		public function getEntities( ...types ):Vector.<Entity>
		{
			Asserts.notZero( types.length, IllegalOperationError, "You need to pass a Type" );
			var result:Vector.<Entity> = _entities[types.shift()];
			var entities:Vector.<Entity>;
			var type:*;
			var i:int;

			if (result && result.length)
			{
				result = result.concat();

				for each (type in types)
				{
					entities = _entities[type];
					for (i = result.length - 1; i >= 0; i--)
					{
						if (entities.indexOf( result[i] ) == -1)
						{
							result.splice( i, 1 );
						}
					}
				}

				return result;
			}

			return null;
		}

		private function addComponent( entity:Entity, component:*, type:* ):void
		{
			var entities:Vector.<Entity> = _entities[type];
			entities = entities || new Vector.<Entity>();
			entities.indexOf( entity ) == -1 &&
			entities.push( entity );
			_entities[type] = entities;
		}

		private function removeComponent( entity:Entity, component:*, type:* ):void
		{
			var entities:Vector.<Entity> = _entities[type];
			var index:int;
			if (entities)
			{
				index = entities.indexOf( entity );
				index != -1 &&
				entities.splice( index, 1 );
			}
		}
	}
}
