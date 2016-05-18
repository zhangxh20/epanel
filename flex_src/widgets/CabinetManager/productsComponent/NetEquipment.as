package widgets.CabinetManager.productsComponent
{
	[Bindable]
	[RemoteClass(alias="com.gokei.baseinfo.entity.NetEquipment")]
	public class NetEquipment
	{
		public function NetEquipment()
		{
			
		}
		public var id:int;
		public var cabinetId:int;
		public var typeId:String;
		public var type:int;
		public var code:String;
		public var name:String;
		public var ip:String;
		public var mac:String;
		public var snmpId:String;
		public var password:String;
		public var portCount:int;
		public var cableType:String;
		public var cableNorm:String;
		public var uNo:int;
		public var uHoldCount:int;
		public var productCode:String;
		public var brand:String;
		public var assetsNo:String;
		public var state:String;
		public var remark:String;
		public var fportCount:int;
		public var assetsId:int;
	}
}