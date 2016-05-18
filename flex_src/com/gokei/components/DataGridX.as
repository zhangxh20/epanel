package com.gokei.components
{
	import mx.collections.ArrayCollection;
	
	import spark.components.DataGrid;
	
	public class DataGridX extends DataGrid
	{
		
		private var _checkList:ArrayCollection;
		
		public function DataGridX()
		{
			super();
			_checkList = new ArrayCollection();
		}
		
		public function isInSelected(item:Object):Boolean {
			for (var i:int = 0; i<_checkList.length; i++) {
				if (_checkList.getItemAt(i).userId == item.userId) {
					return true;
				}
			}
			return false;  
			
		}
		
		public function addItem(item:Object):void {
			_checkList.addItem(item);
		}
		
		public function removeItem(item:Object):void {
			for (var i:int = 0; i<_checkList.length; i++) {
				if (item.userId == _checkList.getItemAt(i).userId) {
					_checkList.removeItemAt(i);
					break;
				}
			}
			
		}
		
		public function get checkList ():ArrayCollection {
			return _checkList;
		}
		
		public function set checkList (list:ArrayCollection):void {
			this._checkList = list;
		}
	}
}