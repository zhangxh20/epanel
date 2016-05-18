package widgets.UserSetting
{
	import flash.events.Event;
	
	import mx.controls.treeClasses.TreeItemRenderer;
	import mx.controls.treeClasses.TreeListData;
	import mx.events.FlexEvent;
	
	import spark.components.CheckBox;
	
	public class TreeItemRender extends TreeItemRenderer
	{
		public function TreeItemRender()
		{
			super();
		}

		private var checkBox:CheckBox;
	
		override protected function createChildren():void{
			super.createChildren();
			checkBox = new CheckBox();
			addChild(checkBox);
			checkBox.addEventListener(Event.CHANGE,changeHandler);
		}
		
		/**
		 * 点击checkbox时，更新dataProvider
		 * */
		protected function changeHandler(event:Event):void{
			if(data.@selected!=""){
				data.@selected = checkBox.selected.toString();
				for(var i:int=0;i<data.children().length();i++){
					data.children()[i].@selected = checkBox.selected.toString();
				}
			}
		}
		/**
		 * 初始化空间时，给checkbox赋值
		 * 
		 * */
		override protected function commitProperties():void{
			super.commitProperties();
			if(data.@selected!=""){
				if(data.@selected == "true"){
					checkBox.selected = true;
				}else{
					checkBox.selected = false;
				}
			}else{
				checkBox.selected = false;
			}
		}
		/**
		 * 重置itemRenderer的宽度
		 * */
		override protected function measure():void{
			super.measure();
			measuredWidth += checkBox.getExplicitOrMeasuredWidth();
		}
		/**
		 * 重新排位置，将label后移
		 * 
		 * */
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void{
			super.updateDisplayList(unscaledWidth,unscaledHeight);
			var startX:Number = data?TreeListData(listData).indent:0;
			if(disclosureIcon){
				disclosureIcon.x = startX;
				startX = disclosureIcon.x + disclosureIcon.width;
				disclosureIcon.setActualSize(disclosureIcon.width,disclosureIcon.height);
				disclosureIcon.visible = data?TreeListData(listData).hasChildren:false;
			}
			if(icon){
				icon.x = startX;
				startX = icon.x + icon.measuredWidth;
				icon.setActualSize(icon.measuredWidth,icon.measuredHeight);
			}
			checkBox.move(startX,(unscaledHeight-checkBox.height)/2);
			label.x = startX + checkBox.getExplicitOrMeasuredWidth();
		}
	}
}