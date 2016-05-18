package widgets.Chain
{
	import mx.graphics.SolidColorStroke;
	
	import spark.components.Group;
	import spark.components.Image;
	import spark.components.Label;
	import spark.primitives.Rect;
	
	public class ChainGroup extends Group
	{
		public static const FRAME_WIDTH:Number = 200; //容器的宽
		public static const FRAME_HEIGHT:Number = 140;  //容器的高
		public static const FRAME_COLOR:int = 0x00ff00; //容器的颜色
		private var _type:String ; //初始化时 判断这个grup的类型（0 配线架 1 设备 2 信息点）
		private var groupOutFrame:Rect; //外边框
		private var groupInFrame:Rect ; //内边框
		
		public function ChainGroup(type:String){
			super();
			var scs:SolidColorStroke = new SolidColorStroke();
			scs.color = FRAME_COLOR;
			scs.weight = 2;
			//初始化边框
			groupOutFrame = new Rect();
			groupOutFrame.stroke = scs;
			addElement(groupOutFrame);
			
			groupOutFrame.width = FRAME_WIDTH;
			groupOutFrame.height = FRAME_HEIGHT;
			groupOutFrame.topLeftRadiusX = 5;
			groupOutFrame.topRightRadiusX = 5;
			
			groupInFrame = new Rect();
			groupInFrame.stroke = scs;
			addElement(groupInFrame);
			
			groupInFrame.width = FRAME_WIDTH - 20;
			groupInFrame.height = 40;
			groupInFrame.x = 10;
			groupInFrame.y = 100;
			_type = type;
		}
		
		/**
		 * 初始化group上的端口
		 * @param frontBack : 端口的前后 1 前面端口  2后面端口
		 * @param firstSecond :配线架的顺序 0第一个端口 1 第二个端倪可察
		 * @param portCode :  端口编号
		 * @return : 返回一个端口图片
		 * */
		public function portLocation(frontBack:String,firstSecond:Boolean,portCode:String):Image{
			var codeLabel:Label = new Label();
			codeLabel.setStyle("color","0xffff00");
			var port : Image  = new Image();
			addElement(port);
			codeLabel.text = portCode;
			addElement(codeLabel);
			if (_type == "2") {
				//如果group是信息点
				port.source = "assets/images/portstatus01.png";
				port.x = 90;
				port.y = 110;
				codeLabel.x = 120;
				codeLabel.y = 120;
			} else if (_type == "0") {
				//如果group是配线架
				if (firstSecond) {
					port.x = 60;
					port.y = 110;
					codeLabel.x = 30;
					codeLabel.y = 120;
				} else {
					port.x = 110;
					port.y = 110;
					codeLabel.x = 140;
					codeLabel.y = 120;
				}
				//如果是第一个配线架
				if(frontBack == '1') {
					port.source = "assets/images/portstatus01.png";
				} else {
					port.source = "assets/images/backPort.png"
				}
			} else if (_type == "1") {
				port.source = "assets/images/portstatus01.png";
				if (firstSecond) {
					port.x = 60;
					port.y = 110;
					codeLabel.x = 30;
					codeLabel.y = 120;
				} else {
					port.x = 110;
					port.y = 110;
					codeLabel.x = 140;
					codeLabel.y = 120;
				}
			}
			return port;
		}
		
		/**
		 * 初始化group上的内容
		 * @param location ：位置
		 * @param code: 编号
		 * */
		public function initLable(location:String,code:String):void{
			var locLable:Label = new Label();
			locLable.text = location;
			locLable.setStyle("color","0xffff00");
			addElement(locLable);
			locLable.x = 10;
			locLable.y = 10;
			
			var codeLabel:Label = new Label();
			codeLabel.text = code;
			codeLabel.setStyle("color","0xffff00");
			addElement(codeLabel);
			codeLabel.x = 10;
			codeLabel.y = 83;
		}
	}
}