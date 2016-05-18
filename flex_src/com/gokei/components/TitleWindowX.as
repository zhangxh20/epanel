package com.gokei.components
{
	import flash.geom.Rectangle;
	
	import mx.events.MoveEvent;
	
	import spark.components.TitleWindow;
	
	public class TitleWindowX extends TitleWindow
	{
		public function TitleWindowX()
		{
			super();
			addEventListener(MoveEvent.MOVE, window_moveHandler);
		}
		
		protected function window_moveHandler(event:MoveEvent):void {
			var window:TitleWindow = event.currentTarget as TitleWindow;
			var bounds:Rectangle = new Rectangle(0, 0, stage.stageWidth, stage.stageHeight);
			var windowBounds:Rectangle = window.getBounds(stage);
			var x:Number;
			var y:Number;
			if (windowBounds.left <= bounds.left)
				x = bounds.left;
			else if (windowBounds.right >= bounds.right)
				x = bounds.right - window.width;
			else
				x = window.x;
			if (windowBounds.top <= bounds.top+45)
				y = bounds.top+45;
			else if (windowBounds.bottom >= bounds.bottom)
				y = bounds.bottom - window.height;
			else
				y = window.y;
			window.move(x, y);
		}
	}
}