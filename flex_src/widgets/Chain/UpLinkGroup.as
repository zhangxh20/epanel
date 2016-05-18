package widgets.Chain
{
	import mx.graphics.SolidColorStroke;
	import mx.resources.ResourceManager;
	
	import spark.components.Group;
	import spark.components.Label;
	import spark.primitives.Rect;
	
	public class UpLinkGroup extends Group
	{
		public static const FRAME_COLOR:int = 0x00ff00; //容器的颜色
		private var label:Label = new Label();
		private var rect:Rect;
		public function UpLinkGroup()
		{
			super();
			var scs:SolidColorStroke = new SolidColorStroke();
			scs.color = FRAME_COLOR;
			scs.weight = 2;
			
			rect = new Rect();
			rect.stroke = scs;
			rect.width = 100;
			rect.height = 40;
			addElement(rect);
			
			addElement(label);
			label.x = 25;
			label.y = 15;
			label.setStyle("color","0xffff00");
//			label.text = "引入光缆";
			label.text = ResourceManager.getInstance().getString("ViewerStrings","T00180");
			
		}
	}
}