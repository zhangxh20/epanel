package com.gokei.components.cabinetManager
{
	import flash.events.Event;

	public class GridCabinetEvent extends Event
	{
		// 单机端口，事件冒泡
		public static const PORT_CLICK:String="portClick";
		
		public static const PORT_CLICK_BUBBLE:String="portClickBubble";
		
		public var equipment:GridEquipment;
		
		public var portDraw:PortDrawer;
		
		public function GridCabinetEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}