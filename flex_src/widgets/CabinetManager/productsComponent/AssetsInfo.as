package widgets.CabinetManager.productsComponent
{
	import mx.collections.ArrayCollection;

	[Bindable]
	[RemoteClass(alias="com.gokei.assets.entity.AssetsInfo")]
	

	public class AssetsInfo extends Assets
	{
		public function AssetsInfo()
		{
		}
		public var assetsSpecInfoList:ArrayCollection;
	}
}