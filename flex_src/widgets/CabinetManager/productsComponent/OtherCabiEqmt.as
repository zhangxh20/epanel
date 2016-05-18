package widgets.CabinetManager.productsComponent
{
	[Bindable]
	[RemoteClass(alias="com.gokei.baseinfo.entity.OtherCabiEqmt")]
	public class OtherCabiEqmt
	{
		public function OtherCabiEqmt()
		{
		}
		public var id:int;
		public var typeId:String;
		public var assetsId:int;
		public var cabinetId:int;
		public var uNo:int;
		public var uHoldCount:int;
		public var name:String;
		public var brand:String;
		public var model:String;
		public var remark:String;
	}
}