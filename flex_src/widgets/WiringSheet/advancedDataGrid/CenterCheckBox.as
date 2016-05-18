package widgets.WiringSheet.advancedDataGrid
{
	import flash.display.DisplayObject;
	import flash.text.TextField;
 
	
	import spark.components.CheckBox;

	public class CenterCheckBox extends spark.components.CheckBox
	{
		public function CenterCheckBox()
		{
			super();
		}
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void{
			super.updateDisplayList(unscaledWidth,unscaledHeight);
			var n:int = numChildren;
			for(var i:int=0;i<n;i++){
				var c:DisplayObject = getChildAt(i);
				if(!(c is TextField)){
					c.x = Math.round((unscaledWidth-c.width)/2);
					c.x = 6;
					c.y = Math.round((unscaledHeight-c.height)/2);
				}
			}
		}
	}
}