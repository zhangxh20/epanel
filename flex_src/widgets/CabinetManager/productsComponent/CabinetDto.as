package widgets.CabinetManager.productsComponent
{
	[Bindable]
	[RemoteClass(alias="com.gokei.baseinfo.entity.Cabinet")]
	public class CabinetDto
	{
		public function CabinetDto()
		{
			
		}
		public var id:int;
		public var name:String;
		public var areaId:int;
		public var typeId:String;
		public var code:String;
		public var isMain:String;
		public var assetsNo:String;
		public var material:String;
		public var norm:String;
		public var brand:String;
		public var uCount:int;
		public var size:String;
		public var location:String;
		public var state:String;
		public var warnCollectorId:int;
		public var remark:String;
		public var assetsId:int;
		public var parentCabinetId:int;
	}
}