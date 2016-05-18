package com.gokei.components.cabinet
{
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.utils.Timer;
	
	import mx.core.UIComponent;
	
	/**
	 * 线缆
	 * 
	 * @Author zhang
	 * @Version v1.0
	 * @Date 2012-9
	 */ 
	
	public class Cable extends UIComponent
	{
		
		public var p1:Point;
		
		public var p2:Point;
		
		private var timer:Timer = new Timer(30);
		
		private var currentX:Number;
		
		private var currentY:Number;
		
		private var i:int=1;
		
		private var gapX:Number;
		
		private var gapY:Number;
		
		private var color:uint;
		
		public function Cable(p1:Point, p2:Point,linetype:int = 0)
		{
			super();
			timer.addEventListener(TimerEvent.TIMER, drawLine);
			this.p1=p1;
			this.p2=p2;
			// 起始点得圆圈
			drawcircle(p1.x, p1.y);
			currentX=p1.x;
			currentY=p1.y;
			gapX = Math.abs(p1.x - p2.x) / 20;
			gapY = Math.abs(p1.y - p2.y) / 20;
			
			color = linetype == 0 ? 0x057bff : 0xffffff
			timer.start();
		}
		
		private function drawcircle(x:Number, y:Number):void {
			this.graphics.beginFill(0, 1);
			this.graphics.lineStyle(2, 0x00FFFF, 1);
			this.graphics.drawCircle(x, y, 2);
			this.graphics.endFill();
		}
		
		private function drawLine(e:TimerEvent):void
		{
			i++;
			if (i % 2 == 0)
			{
				this.graphics.lineStyle(6, 0x057bff, 1);
			}
			else
			{
				this.graphics.lineStyle(6, color, 1);
			}
			var _lineToX:Number;
			var _lineToY:Number;
			// 起始点在上，终点在下
			if (p2.y > p1.y)
			{	// 垂直线
				if (p2.x == p1.x)
				{
					_lineToY=currentY + gapY;
					this.graphics.moveTo(currentX, currentY);
					this.graphics.lineTo(currentX, _lineToY);
					currentY=_lineToY;
					if (Math.abs(currentY - p2.y) < 1)
					{
						drawcircle(currentX, currentY);
						timer.stop();
					}
				}
				else
				{ //
					_lineToY=currentY + gapY;
					_lineToX=(_lineToY - p1.y) * (p2.x - p1.x) / (p2.y - p1.y) + p1.x;
					this.graphics.moveTo(currentX, currentY);
					this.graphics.lineTo(_lineToX, _lineToY);
					currentX=_lineToX;
					currentY=_lineToY;
					if (Math.abs(currentY - p2.y) < 1)
					{
						drawcircle(currentX, currentY);
						timer.stop();
					}
				}
			}
			// 水平线
			else if (p2.y == p1.y)
			{
				if (p2.x == p1.x)
				{
					timer.stop();
				}
				// 左右
				else if (p2.x > p1.x)
				{
					_lineToX=currentX + gapX;
					this.graphics.moveTo(currentX, currentY);
					this.graphics.lineTo(_lineToX, currentY);
					currentX=_lineToX;
					if (Math.abs(currentX - p2.x) < 1)
					{
						drawcircle(currentX, currentY);
						timer.stop();
					}
				}
				else
				{
					_lineToX=currentX - gapX;
					this.graphics.moveTo(currentX, currentY);
					this.graphics.lineTo(_lineToX, currentY);
					currentX=_lineToX;
					if (Math.abs(currentX - p2.x) < 1)
					{
						drawcircle(currentX, currentY);
						timer.stop();
					}
				}
			}
			else
			{
				if (p2.x == p1.x)
				{
					_lineToY=currentY - gapY;
					this.graphics.moveTo(currentX, currentY);
					this.graphics.lineTo(currentX, _lineToY);
					currentY=_lineToY;
					if (Math.abs(currentY - p2.y) < 1)
					{
						drawcircle(currentX, currentY);
						timer.stop();
					}
				}
				else
				{ //
					_lineToY=currentY - gapY;
					_lineToX=(_lineToY - p1.y) * (p2.x - p1.x) / (p2.y - p1.y) + p1.x;
					this.graphics.moveTo(currentX, currentY);
					this.graphics.lineTo(_lineToX, _lineToY);
					currentX=_lineToX;
					currentY=_lineToY;
					if (Math.abs(currentY - p2.y) < 1)
					{
						drawcircle(currentX, currentY);
						timer.stop();
					}
				}
			}
			
		}
	}
}