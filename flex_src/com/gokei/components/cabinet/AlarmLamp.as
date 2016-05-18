package com.gokei.components.cabinet
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.core.UIComponent;
	
	import spark.components.Group;

	/**
	 * 告警灯
	 * 
	 * @Author zhang
	 * @Version v1.0
	 * @Date 2012-9
	 */ 
	public class AlarmLamp extends Group
	{
		private var red:UIComponent;
		
		private var white:UIComponent;
		
		private var timer:Timer;
		
		public function AlarmLamp(width:int = 15,height:int = 5)
		{
			red = new UIComponent();
			red.graphics.beginFill(0xfd4747);
			red.graphics.drawRect(0,0,width,height);
			white = new UIComponent();
			white.graphics.beginFill(0x5e5d52);
			white.graphics.drawRect(0,0,width,height);
			addElement(red);
			addElement(white);
			white.visible = true;
			timer = new Timer(200);
			timer.addEventListener(TimerEvent.TIMER,onTimer);
		}
		
		private function onTimer(event:TimerEvent):void {
			if (white.visible) {
				white.visible = false;
				red.visible = true;
			} else {
				white.visible = true;
				red.visible = false;
			}
		}
		
		/**
		 * 告警灯开始闪烁
		 */ 
		public function startAlarm():void {
			timer.reset();
			timer.start();
		}
		
		/**
		 * 停止告警，告警灯停止闪烁
		 */ 
		public function stopAlarm():void {
			timer.stop();
			white.visible = true;
			red.visible = false;
		}
	}
}