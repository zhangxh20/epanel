package widgets.CabinetConfig
{
	import flash.events.Event;
	
	public class ConfigEvent extends Event
	{
		// 输入框获得焦点
		public static const INPUT_FOCUSIN:String = "inputFocusIn";
		// 输入框失去焦点
		public static const INPUT_FOCUSOUT:String = "inputFocusOut";
		// 点击文本框
		public static const INPUT_CLICK:String = "inputClick";
		
		public var data:Object;
		
		public function ConfigEvent(type:String,obj:Object = null)
		{
			super(type, false, false);
			data = obj;
		}
	}
}