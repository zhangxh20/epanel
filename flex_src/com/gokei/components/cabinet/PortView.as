package com.gokei.components.cabinet
{
	import flash.events.MouseEvent;
	
	import spark.components.Image;
	
	/**
	 * 端口
	 * 
	 * @Author zhang
	 * @Version v1.0
	 * @Date 2012-9
	 */ 
	public class PortView extends Image
	{
		public var code:String;
		
		public var infoCode:String;
		
		private  var _status:int;
		
		private var _linetype:String;
		
		public var parentType:String;
		
		//默认为正面
		public var reverse:int = 0; 
		
		public function PortView()
		{
			super();
			addEventListener(MouseEvent.CLICK,mouseClick);
		}
		
		public function set status(s:int):void {
			_status = s;
			source = "assets/images/portstatus" + _linetype + s + ".png";
		}
		
		public function get status():int {
			return _status;
		}
		
		public function set linetype(str:String):void {
			_linetype = str;
		}
		
		public function get linetype():String {
			return _linetype;
		}
		
		private function mouseClick(event:MouseEvent):void {
			var evt:CabinetEvent = new CabinetEvent(CabinetEvent.PORT_CLICK);
			evt.portView = this;
			dispatchEvent(evt);
		}
	}
}