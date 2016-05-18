package widgets.CabinetManager.productsComponent
{
	import flashx.textLayout.formats.Float;
	
	[Bindable]
	[RemoteClass(alias="com.gokei.assets.Assets")]
	public class Assets
	{
		public function Assets()
		{
			
		}
		public var id:int;
		public var objectTypeId:String;
		public var name:String;
		public var model:String;
		public var brand:String;
		public var quantity:int;
		public var price:Float;
		public var image:String;
		public var remark:String;
		public var isSysAssets:int;
	}
}