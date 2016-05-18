 	package widgets.WiringSheet.advancedDataGrid
{
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.controls.advancedDataGridClasses.AdvancedDataGridColumnGroup;
	import mx.controls.listClasses.IListItemRenderer;
	import mx.resources.ResourceManager;

	
	public class CheckBoxHeaderRenderer extends CenterCheckBox implements IListItemRenderer
	{
		private var _data:CheckBoxColumn;
		public function CheckBoxHeaderRenderer()
		{
			super();
			this.addEventListener(Event.CHANGE,onChange);//checkbox状态变化时触发此事件
//			this.toolTip = "全选";
			this.toolTip = ResourceManager.getInstance().getString("ViewerStrings","T00313");
		}
		
		public function get data():Object
		{
			return _data;
		}
		
		public function set data(value:Object):void
		{
			_data = value as CheckBoxColumn;
			selected = _data.cloumsSelected;
		}
		private function onChange(event:Event):void{
			var dg:AdvancedDataGrid = AdvancedDataGrid(this.owner);
			var column:CheckBoxColumn = dg.groupedColumns[0];
			var dgDatarr:ArrayCollection = dg.dataProvider as ArrayCollection;
			column.cloumsSelected = this.selected;//更改列的全选状态
			column.selectItems = new Array();	//重新初始化用于保存选中列的对象
			if(this.selected){
				if(dgDatarr != null){
					//如果全部选中的话就像数据源赋值给column.selectItems，不是就不管它，上一步已经初始化为空
					column.selectItems = (dg.dataProvider as ArrayCollection).toArray();
				}
			}
			if(dgDatarr != null && dgDatarr.length>0){
				if(dgDatarr[0]!=""){
					for(var i:int=0;i<dgDatarr.length;i++){
						Object(dgDatarr[i]).dgSelected = this.selected;//更改每一行的选中状态
					}
				}
			}
			if(dgDatarr!=null){
				dgDatarr.refresh();
			}
		}
	}
}