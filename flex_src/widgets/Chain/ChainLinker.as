package widgets.Chain
{
	import flash.display.Graphics;
	
	import spark.primitives.Line;
	
	
	public class ChainLinker extends Line
	{
		public var lineRadius:Number ;
		public var lineWidth:Number;
		public var lineColor:uint;
		
		public function ChainLinker()
		{
			super();
		}
		
		override protected function draw(g:Graphics):void{
			g.beginFill(lineColor);
			//外边
			g.moveTo(xFrom,yFrom);
			g.lineTo(xFrom,yFrom+30-lineRadius);
			g.curveTo(xFrom,yFrom+30,xFrom+lineRadius,yFrom+30);
			g.lineTo(xTo-lineRadius,yTo+30);
			g.curveTo(xTo,yTo+30,xTo,yTo+30-lineRadius);
			g.lineTo(xTo,yTo);
			//内边
			g.lineTo(xTo-lineWidth,yTo);
			g.lineTo(xTo-lineWidth,yTo+30-lineWidth-lineRadius);
			g.curveTo(xTo-lineWidth,yTo+30-lineWidth,xTo-lineWidth-lineRadius,yTo+30-lineWidth);
			g.lineTo(xFrom+lineWidth+lineRadius,yFrom+30-lineWidth);
			g.curveTo(xFrom+lineWidth,yFrom+30-lineWidth,xFrom+lineWidth,yFrom+30-lineWidth-lineRadius);
			g.lineTo(xFrom+lineWidth,yFrom);
			g.lineTo(xFrom,yFrom);
			g.endFill();
		}
	}
}