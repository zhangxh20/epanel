package widgets.WiringSheet.advancedDataGrid
{
	import mx.controls.AdvancedDataGrid;
	
	public class AdvancedDataGrid extends mx.controls.AdvancedDataGrid
	{
		public function AdvancedDataGrid()
		{
			super();
		}
		/**
		 * 设置grid是否有check框
		 * */
		private var _hasCheck:Boolean;
		
		public function get hasCheck():Boolean{
			return _hasCheck;
		}
		public function set hasCheck(value:Boolean):void{
			this._hasCheck = value;
		}
		
		/**
		 * 取得选中的值
		 * */
		public function getSelectedItem():Array{
			if(this.hasCheck){
				return (this.columns[0] as CheckBoxColumn).selectItems;
			}
			return null;
		}

	}
}