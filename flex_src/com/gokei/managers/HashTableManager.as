package com.gokei.managers
{
	import com.esri.viewer.utils.Hashtable;

	public class HashTableManager
	{
		public static const instance:HashTableManager = new HashTableManager();
		
		private var dataTable:Hashtable;
		
		public function HashTableManager()
		{
			dataTable = new Hashtable();
		}
		
		public static function getInstance():HashTableManager {
			return instance;
		}
		
		public function put(key:String,obj:Object):void {
			if (key)
			{
				if (dataTable.containsKey(key))
				{
					dataTable.remove(key);
				}
				dataTable.add(key, obj);
			}
		}
		
		public function get(key:String):Object {
			return dataTable.find(key);
		}
			
	}
}