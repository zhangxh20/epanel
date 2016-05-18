package widgets.WiringSheet
{
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	import mx.collections.ICollectionView;
	import mx.controls.ComboBox;
	import mx.controls.TextInput;
	import mx.resources.ResourceManager;
	
	public class FilterComBox extends ComboBox
	{
		public function FilterComBox(){
			super();
			init();
		}
		private function init():void{
			editable = true;
			rowCount = 5;
			height = 25;
//			prompt="请选择";
			prompt=ResourceManager.getInstance().getString("ViewerStrings","I00034");
			isTextBoxStringChange= false;
			isfocusInDropDown = false;
			isAutoComplete = false;
		}
		
		//获得焦点时,是否自动弹出下拉框 
		private var isfocusInDropDown:Boolean = false;
		
		//是否自动完成
		private var isAutoComplete:Boolean = false;
		
		//类默认过滤函数
		private var _filterFunction:Function = myFilterFunciton;
		
		//文本是否发生了变化
		private var isTextBoxStringChange:Boolean = false
		
		//按下的键是否是退格键
		private var isBackSpaceKeyDown:Boolean = false;
		
		/**
		 * 处理退格键按下的情况
		 * */	
		override protected function keyDownHandler(event:KeyboardEvent):void{
			if(!event.ctrlKey&&!event.shiftKey){
				if(event.keyCode == Keyboard.BACKSPACE){
					close();
					isBackSpaceKeyDown = true;
				}else{
					isBackSpaceKeyDown = false;
				}
				if(event.keyCode == Keyboard.UP && selectedIndex == 0 ){
					selectedIndex = -1;
				}
			}
		}
		/**
		 * 数据源发生变化，数据不为0弹出下拉列表
		 * */	
		override protected function collectionChangeHandler(event:Event):void{
			super.collectionChangeHandler(event);
			if(dataProvider.length>0 && text!=""){
				open();
			}
		}
		
		/**
		 *  获得焦点
		 * */
		override protected function focusInHandler(event:FocusEvent):void{
			if(isfocusInDropDown)
				open();
			super.focusInHandler(event);
		}
		
		override public function open():void{
			if(text!=""){
				super.open();
			}
		}
		/**
		 * 文本发生变化时
		 * */
		override protected function textInput_changeHandler(event:Event):void{
			if(textInput == ""){
				isTextBoxStringChange = false;
			}else{
				isTextBoxStringChange = true;
				super.textInput_changeHandler(event);
				invalidateProperties();//触发commitProperties（）
			}
		}
		override protected function commitProperties():void{
			if(isTextBoxStringChange && textInput!=""){
				prompt = text;
				filter();
				if(isAutoComplete && !isBackSpaceKeyDown){
					var autoCompleteString:String = "";
					if(dataProvider.length>0){
						autoCompleteString = itemToLabel(dataProvider[0]);
						(textInput as TextInput).setSelection(prompt.length,autoCompleteString.length);
						prompt = autoCompleteString;
					}else{
						(textInput as TextInput).setSelection((textInput as TextInput).selectionEndIndex,(textInput as TextInput).selectionEndIndex);
					}
				}else{
					(textInput as TextInput).setSelection((textInput as TextInput).selectionEndIndex,(textInput as TextInput).selectionEndIndex);
				}
			}
			super.commitProperties();
		}
		
		/**
		 * 过滤操作
		 * */
		private function filter():void{
			var tmpCollection:ICollectionView = dataProvider as ICollectionView;
			tmpCollection.filterFunction = _filterFunction;
			tmpCollection.refresh();
		}
		
		/**
		 * 过滤函数
		 * */
		private function myFilterFunciton(item:Object):Boolean{
			var myLabel:String = itemToLabel(item);
			if(myLabel.substr(0,text.length).toLowerCase() == prompt.toLowerCase()){
				return true;
			}
			return false;
		}
		public function get FilterFunction():Function{
			return _filterFunction;
		}
		public function set FilterFunction(filterFunction:Function):void{
			_filterFunction = filterFunction;
		}
		public function get IsfocusInDropDown():Boolean{
			return isfocusInDropDown;
		}
		public function set IsfocusInDropDown(value:Boolean):void{
			isfocusInDropDown = value;
		}
		public function get IsAutoComplete():Boolean{
			return isAutoComplete;
		}
		public function set IsAutoComplete(value:Boolean):void{
			isAutoComplete = value;
		}
	}
}