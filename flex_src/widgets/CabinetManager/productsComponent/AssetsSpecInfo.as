package widgets.CabinetManager.productsComponent
{
	[Bindable]
	[RemoteClass(alias="com.gokei.assets.entity.AssetsSpecInfo")]
	public class AssetsSpecInfo
	{
		public function AssetsSpecInfo()
		{
			
		}
		public var assetsId:int;
		public var specId:int;
		public var specValue:String;
		public var name:String;
	}
}