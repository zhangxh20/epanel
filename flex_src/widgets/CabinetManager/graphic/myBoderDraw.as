package widgets.CabinetManager.graphic
{
	import flash.display.Graphics;
	
	import spark.primitives.Rect;
	
	public class myBoderDraw extends Rect
	{
		public var radius:Number;
		public var mcX:Number;
		public var mcY:Number;
		public var mcW:Number;
		public var mcH:Number;
	
		
		public function myBoderDraw()
		{
			super();
		}
		override protected function draw(g:Graphics):void
		//function drawRoundBox (mcName : MovieClip, radius : Number, mcX : Number, mcY : Number, mcW : Number, mcH : Number) : Void
		{
			g.lineStyle (1, 0xDADADA, 100, true);
			
			//
			//上边线
			g.moveTo ((mcX + radius) , mcY);
			g.lineTo ((mcX + (mcW - radius)) , mcY);
			//
			//右上圆角+右边线
			g.curveTo ((mcX + mcW) , mcY, (mcX + mcW) , (mcY + radius));
			g.lineTo ((mcX + mcW) , (mcY + (mcH - radius)));
			//
			//右下圆角+下边线
			g.curveTo ((mcX + mcW) , (mcY + mcH) , (mcX + (mcW - radius)) , (mcY + mcH));
			g.lineTo ((mcX-80 + radius) , (mcY + mcH));
			//
			//左下圆角+左边线
			g.curveTo (mcX-80, (mcY + mcH) , mcX-80, (mcY + (mcH - radius)));
			g.lineTo(mcX-80,mcY+mcH-40+radius);
			g.curveTo(mcX-80,mcY+mcH-40,mcX-80+radius,mcY+mcH-40);
			g.lineTo(mcX-radius,mcY+mcH-40);
			g.curveTo(mcX,mcY+mcH-40,mcX,mcY+mcH-40-radius);
			g.lineTo (mcX, (mcY + radius));
			//
			//左上圆角
			g.curveTo (mcX, mcY, (mcX + radius) , mcY);
			 
		
			//////////////////////////////////////////////////////////////////////
			//左边的框体
			g.moveTo(mcX-400+radius,mcY);
			g.lineTo(mcX-10-radius,mcY);
			//右上圆角+右边线
			g.curveTo ((mcX - 10) , mcY, (mcX -10) , (mcY + radius));
			g.lineTo ((mcX -10) , (mcY + (mcH -50 - radius)));
			//
			//右下圆角+下边线
			g.curveTo ((mcX -10) , (mcY + mcH -50) , (mcX - (10 + radius)) , (mcY + mcH-50));
			g.lineTo ((mcX-90 + radius) , (mcY + mcH-50));
			//右下凸角
			g.curveTo(mcX-90,mcY+mcH-50,mcX-90,mcY+mcH-50+radius);
			g.lineTo(mcX-90,mcY+mcH-radius);
			g.curveTo(mcX-90,mcY+mcH,mcX-90-radius,mcY+mcH);
			g.lineTo(mcX-400+radius,mcY+mcH);
			g.curveTo(mcX-400,mcY+mcH,mcX-400,mcY+mcH-radius);
			g.lineTo(mcX-400,mcY+radius);
			g.curveTo(mcX-400,mcY,mcX-400+radius,mcY);
			//放图片的矩形框
			//g.beginFill(0xffffff,0.8);
			g.drawRect(mcX-385,mcY+20,360,mcH-80);
			//g.endFill ();
		}
	}
}