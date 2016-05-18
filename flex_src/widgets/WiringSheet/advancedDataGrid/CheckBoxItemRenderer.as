package widgets.WiringSheet.advancedDataGrid
{
	import flash.events.Event;
	
	import mx.controls.advancedDataGridClasses.AdvancedDataGridColumnGroup;
	import mx.controls.listClasses.IListItemRenderer;
	import mx.resources.ResourceManager;
	
	import spark.components.supportClasses.ItemRenderer;

	
	public class CheckBoxItemRenderer extends ItemRenderer implements IListItemRenderer
	{
		private var currentData:Object ; //保存当前一行值的对象
		private var _data:Object;
		private var check:CenterCheckBox;
		public function CheckBoxItemRenderer()
		{
			super();
			check = new CenterCheckBox();
			addElement(check);
			check.addEventListener(Event.CHANGE,onClickCheckBox);
//			this.toolTip = "选择";
			this.toolTip = ResourceManager.getInstance().getString("ViewerStrings","T00313");
		}
		
		/*override public function get data():Object
		{
			return _data;
		}*/
		
		override public function set data(value:Object):void
		{
			super.data = value;
			if(value != null) {
				check.selected = value.dgSelected;
				this.currentData = value;
			}
		}
		//点击checkbox时，根据状况向selectedItems array中添加当前行的引用，或者从array中移除
		private function onClickCheckBox(e:Event):void{
			var dg:AdvancedDataGrid = AdvancedDataGrid(this.owner);
			var column:CheckBoxColumn = dg.groupedColumns[0];//获取整列的显示对象
			var selectItems:Array = column.selectItems;
			this.currentData.dgSelected = check.selected;
			if(check.selected){
				selectItems.push(this.currentData);
			}else{
				for(var i:int=0;i<selectItems.length;i++){
					if(selectItems[i] ==  this.currentData){
						selectItems.splice(i,1);
					}
				}
			}
		}
	}
}