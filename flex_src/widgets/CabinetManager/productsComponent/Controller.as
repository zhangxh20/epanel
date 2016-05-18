package widgets.CabinetManager.productsComponent
{
	[Bindable]
	[RemoteClass(alias="com.gokei.baseinfo.entity.Controller")]
	public class Controller
	{
		public function Controller()
		{
		}
		
		public var id:int;
		public var cabinetId:int;
		public var code:String;
		public var equCode:String;
		public var typeId:String;
		public var name:String;
		public var eqmtId:String;
		public var uNo:int;
		public var uHoldCount:int;
		public var productNo:String;
		public var brand:String;
		public var assetsNo:String;
		public var ip:String;
		public var state:String;
		public var jmsId:int;
		public var assetsId:int;
		public var isActivated:String;
		public var collectorCode:String;
		public var unRealIp:String;
		public var isBound:String;
	}
}