package com.gokei.components.cabinetManager
{
	import flash.display.Graphics;
	
	import spark.primitives.Rect;
	
	public class GridEquGraphicDraw extends Rect
	{
		public function GridEquGraphicDraw()
		{
			super();
		}
		override protected function draw(g:Graphics):void{
			g.beginFill(0x000000);
			//左上块
			g.moveTo(0,0);
			g.lineTo(24,0);
			g.lineTo(24,15);
			g.curveTo(24,21,15,21);
			g.lineTo(0,21);
			g.lineTo(0,0);
			//左中
			g.moveTo(0,26);
			g.lineTo(16,26);
			g.curveTo(26,26,26,18);
			g.lineTo(26,height-18);
			g.curveTo(26,height-26,18,height-26);
			g.lineTo(0,height-26);
			g.lineTo(0,26);
			//左下
			g.moveTo(0,height);
			g.lineTo(24,height);
			g.lineTo(24,height-15);
			g.curveTo(24,height-21,15,height-21);
			g.lineTo(0,height-21);
			g.lineTo(0,height);
			//右上
			g.moveTo(width,0);
			g.lineTo(width-24,0);
			g.lineTo(width-24,18);
			g.curveTo(width-24,21,width-15,21);
			g.lineTo(width,21);
			g.lineTo(width,0);
			//右中
			g.moveTo(width,26);
			g.lineTo(width-16,26);
			g.curveTo(width-26,26,width-26,18);
			g.lineTo(width-26,height-18);
			g.curveTo(width-26,height-26,width-18,height-26);
			g.lineTo(width,height-26);
			g.lineTo(width,26);
			//右下
			g.moveTo(width,height);
			g.lineTo(width-24,height);
			g.lineTo(width-24,height-15);
			g.curveTo(width-24,height-21,width-15,height-21);
			g.lineTo(width,height-21);
			g.lineTo(width,height);
			
			g.endFill();
			//四个角的圆圈
			g.beginFill(0xffffff);
			g.drawCircle(12,10,5);
			g.drawCircle(12,height-10,5);
			g.drawCircle(width-12,10,5);
			g.drawCircle(width-12,height-10,5);
			g.endFill();
		}
	}
}