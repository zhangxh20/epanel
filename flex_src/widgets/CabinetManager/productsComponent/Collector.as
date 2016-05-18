package widgets.CabinetManager.productsComponent
{
	[Bindable]
	[RemoteClass(alias="com.gokei.baseinfo.entity.Collector")]
	public class Collector
	{
		public function Collector()
		{
		}
		public var id:int;
		public var cabinetId:int;
		public var code:String;
		public var equCode:String;
		public var typeId:String;
		public var name:String;
		public var controllerId:int;
		public var productNo:String;
		public var brand:String;
		public var assetsNo:String;
		public var uNo:int;
		public var state:String;
		public var remark:String;
		public var assetsId:int;
		public var isBound:String;
		public var uHoldCount:int;
		public var eqmtId:String;
		public var scannerSeqNo:String;
	}
}