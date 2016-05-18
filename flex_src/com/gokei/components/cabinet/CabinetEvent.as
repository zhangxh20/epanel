package com.gokei.components.cabinet
{
	import flash.events.Event;
	
	/**
	 * 机柜事件
	 * 
	 * @Author zhang
	 * @Version v1.0
	 * @Date 2012-9
	 */ 
	public class CabinetEvent extends Event
	{
		// 单击端口
		public static const PORT_CLICK:String="portCLick";
		// 单机端口，事件冒泡
		public static const PORT_CLICK_BUBBLE:String="portClickBubble";
		// 单击设备
		public static const EQUIPMENT_CLICK:String="equipmentClick";
		// 机柜事件的端口
		public var portView:PortView;
		// 机柜事件的设备
		public var equipment:Equipment;
		
		public function CabinetEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}