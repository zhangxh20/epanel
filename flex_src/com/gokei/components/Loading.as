package com.gokei.components
{
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.controls.ProgressBar;
	import mx.controls.SWFLoader;
	import mx.resources.ResourceManager;
	
	import spark.components.Group;
	import spark.components.Label;
	
	public class Loading extends Group
	{
		private static const VIEWER_STRINGS:String = "ViewerStrings";
		
		private var loader:SWFLoader;
		
		private var progress:ProgressBar ;
		
		private var label:Label = new Label();
		
		private var timer:Timer = new Timer(1000);
		
		private var num:Number = 0;
		
		private var totalNum:Number;
		
		public function set type(t:int):void {
			if (t == 0) {
				loader.source = "assets/images/loader.swf";
			} else {
				loader.source = "assets/images/loaderX.swf";
			}
		}
		
		public function Loading()
		{
			super();
			width = 240;
			height = 150;
			loader = new SWFLoader();
			loader.width = 100;
			loader.height = 100;
			addElement(loader);
			loader.x = 69;
			loader.y = 9
			label = new Label();
			label.text = ResourceManager.getInstance().getString(VIEWER_STRINGS,"lbLoading");
			addElement(label);
			label.x = 89;
			label.y = 117;
			progress = new ProgressBar();
			addElement(progress);
			progress.visible = false;
			progress.x = 20;
			progress.y = 120;
			progress.maximum = 100;
			progress.minimum = 0;
			progress.direction = "right";
			progress.labelPlacement = "center";
			progress.mode = "manual";
			progress.addEventListener(Event.COMPLETE,function():void{
				timer.stop();
			});
			timer.addEventListener(TimerEvent.TIMER,onTimer);
		}
		
		private function onTimer(event:TimerEvent):void {
			progress.setProgress(num,totalNum);
			progress.label = (totalNum - num) + ResourceManager.getInstance().getString(VIEWER_STRINGS,"loadingTime");
			num ++;
		}
		
		public function startLoading(type:int,seconds:int):void {
			if (type == 0) {
				//扫描
				progress.visible = true;
				label.visible = false;
				num = 2;
				totalNum = seconds;
				timer.start();
				loader.source = "assets/images/loader.swf";
			} else if (type == 1){
				//展开机柜
				progress.visible = false;
				label.visible = true;
				loader.source = "assets/images/loader.swf";
			}else {
				//刷新树形图
				progress.visible = false;
				label.visible = false;
				loader.source = "assets/images/loaderX.swf";
			}
		}
		
		public function reset():void {
			num = 0;
		}
	}
}