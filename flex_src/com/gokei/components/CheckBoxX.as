package com.gokei.components
{
	import flash.events.Event;
	
	import spark.components.CheckBox;
	
	public class CheckBoxX extends CheckBox
	{
		private var _data:Object;
		private var dg:DataGridX;
		
		public function CheckBoxX()
		{
			super();
			addEventListener(Event.CHANGE,onChange);
		}
		
		public function set data(value:Object):void {
			if (value == null) {
				return;
			}
			_data = value;
			dg = parent.parent.parent.parent.parent.parent.parent.parent.
				parent.parent as DataGridX;
			if (dg.isInSelected(_data)) {
				selected = true;
			} else {
				selected = false;
			}
		}
		
		private function onChange(event:Event):void {
			if (selected) {
				dg.addItem(_data);
			} else {
				dg.removeItem(_data);
			}
		}
	}
}