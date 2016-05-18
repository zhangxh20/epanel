package widgets.CabinetManager.productsComponent
{
	[Bindable]
	[RemoteClass(alias="com.gokei.baseinfo.entity.Terminal")]
	
	public class Terminal
	{
		public var id:int;
		public var code:String;
		public var name:String;
		public var typeId:String;
		public var assetsId:int;
		public var state:String;
		public var ip:String;
		public var mac:String;
		public var userName:String;
		public var brand:String;
		public var assetsNo:String;
		public var remark:String;
		public var portId:int;
		public function Terminal()
		{
		}
	}
}