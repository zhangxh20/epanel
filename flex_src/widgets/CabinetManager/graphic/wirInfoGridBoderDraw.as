package widgets.CabinetManager.graphic
{
	import flash.display.Graphics;
	
	import mx.controls.Alert;
	
	import spark.primitives.Rect;
	
	public class wirInfoGridBoderDraw extends Rect
	{
		public var uNum:int;
		
		public function wirInfoGridBoderDraw()
		{
			super();
		}
		override protected function draw(g:Graphics):void
		//function drawRoundBox (mcName : MovieClip, radius : Number, mcX : Number, mcY : Number, mcW : Number, mcH : Number) : Void
		{
			
			g.lineStyle (1, 0xDADADA, 100, true);
			
			//
			//上边线
			g.moveTo (0,0);
			g.lineTo (this.width,0);
			//
			
		
			g.lineTo (this.width,20+50*uNum);
			
			g.lineTo (0,20+50*uNum);
			//
			//左下圆角+左边线
			
			g.lineTo (0,0);
			
			g.moveTo(0,20);
			g.lineTo(this.width,20);
			//表格线
			for(var i:int =0;i<uNum;i++){
				g.moveTo(0,20+i*50);
				g.lineTo(this.width,20+i*50);
				g.moveTo(0,40+i*50);
				g.lineTo(this.width,40+i*50);
			}
			
			for(var j:int=0;j<24;j++){
				
				if(j==18||j==2||j==6||j==9||j==12||j==15||j==18||j==21){
					g.moveTo(32+j*47,0);
				}else{
					g.moveTo(32+j*47,20);
				}
				
				g.lineTo(32+j*47,20+50*uNum);
			}
			
		}
	}
}