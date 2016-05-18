package widgets.BasicData.entitys
{
	[Bindable]
	[RemoteClass(alias="com.gokei.baseinfo.entity.Company")]
	public class Company
	{
		public function Company()
		{
		}
		//id
		public var id:int;
		
		//单位名称
		public var name:String;
		
		//单位地址
		public var address:String;
		
		//单位联系人
		public var contact:String;
		
		//单位联系人电话
		public var tel:String;
		
		//地图GIS服务地址路劲
		public var mapUrl:String;
		
		//地图源文件路劲
		public var mapPath:String;
		
		//备注
		public var remark:String;
	}
}