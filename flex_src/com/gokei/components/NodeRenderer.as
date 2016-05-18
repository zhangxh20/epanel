package com.gokei.components
{
	import flash.display.Graphics;
	
	import fr.kapit.visualizer.base.IItem;
	import fr.kapit.visualizer.renderers.IRenderer;
	import mx.resources.ResourceManager;
	import spark.components.Group;
	import spark.components.Label;
	
	public class NodeRenderer extends Group implements IRenderer
	{
		public function NodeRenderer()
		{
			super();
			width = 50;
			height = 50;
			
			setStyle("fontSize","14");
			setStyle("fontWeight","bold");
			setStyle("fontFamily",ResourceManager.getInstance().getString("ViewerStrings","Font001"));
		}
		
		private var _data:Object;
		public function get data():Object
		{
			return _data;
		}
		public function set data(value:Object):void
		{
			
			
			_data = value;
			var label:Label = new Label();
			label.text = _data.code;
			addElement(label);
			label.width= 30;
			label.setStyle("backgroundColor",0x000000);
			label.setStyle("textAlign","center");
			label.y = 17;
			label.x = 10;
			if (_data.isMain == "1") {
				drawMain();
			} else {
				drawBranch();
			}
		}
		
		private var _item:IItem;
		public function get item():IItem
		{
			return _item;
		}
		public function set item(value:IItem):void
		{
			_item = value;
		}
		
		private var _isFixed:Boolean;
		public function get isFixed():Boolean
		{
			return false;
		}
		public function set isFixed(value:Boolean):void
		{
			_isFixed=value;
		}
		
		private function drawMain():void {
			var g:Graphics = this.graphics;
			g.lineStyle(2,0x0000ff);
			g.beginFill(0x00ff00);
			g.drawRect(0,0,10,50);
			g.drawRect(40,0,10,50);
			g.drawRect(20,0,10,50);
			g.endFill();
			g.moveTo(10,0);
			g.lineTo(20,50);
			g.moveTo(10,50);
			g.lineTo(20,0);
			g.moveTo(30,0);
			g.lineTo(40,50);
			g.moveTo(30,50);
			g.lineTo(40,0);
		}
		
		private function drawBranch():void {
			var g:Graphics = this.graphics;
			g.lineStyle(2,0x0000ff);
			g.beginFill(0xffff00);
			g.drawRect(0,0,10,50);
			g.drawRect(40,0,10,50);
			g.endFill();
			g.moveTo(10,0);
			g.lineTo(40,50);
			g.moveTo(10,50);
			g.lineTo(40,0);
		}
	
	}
}