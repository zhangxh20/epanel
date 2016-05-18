package widgets.WiringSheet.advancedDataGrid
{
	import mx.controls.advancedDataGridClasses.AdvancedDataGridColumn;

	public class CheckBoxColumn extends AdvancedDataGridColumn
	{
		public function CheckBoxColumn(columnsName:String=null)
		{
			super(columnsName);
		}
		//保存该列是否全选的属性（用户先点击全选后在手动的取消几行数据的选中状态时，这里的状态不会改变）
		public var cloumsSelected:Boolean = false;
		
		public var selectItems:Array = new Array();//用户保存用户选中的数据
		
		
	}
}