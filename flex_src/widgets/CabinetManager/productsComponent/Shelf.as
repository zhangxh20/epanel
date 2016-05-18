package widgets.CabinetManager.productsComponent
{
	[Bindable]
	[RemoteClass(alias="com.gokei.baseinfo.entity.Shelf")]
	public class Shelf
	{
		public function Shelf()
		{
		}
		public var id:int;
		public var cabinetId:int;
		public var code:String;
		public var collectorId:int;
		public var typeId:String;
		public var type:int;
		public var name:String;
		public var productNo:String;
		public var brand:String;
		public var assetsNo:String;
		public var uNo:int;
		public var uHoldCount:int;
		public var portCount:int;
		public var mainFlag:String;
		public var antennaCode:int;
		public var state:String;
		public var material:String;
		public var remark:String;
		public var assetsId:int;
		public var isBound:String;
		public var mngPort:String;

	}
}