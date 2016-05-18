package widgets.BasicData.entitys
{
	[Bindable]
	[RemoteClass(alias="com.gokei.baseinfo.entity.Building")]
	public class Building
	{
		public function Building()
		{
		}
		//ID
		public var id:int;
		
		//所属单位ID
		public var companyId:int;
		
		//建筑编号
		public var code:String;
		
		//建筑名称
		public var name:String;
		
		//对象类别
		public var typeId:String;
		
		//地址
		public var address:String;
		
		//建筑序号
		public var seqNo:int;
		
		//建筑年代
		public var year:Date;
		
		//承建单位
		public var buildCompany:String;
		
		//系统图源文件路劲
		public var cadPath:String;
		
		//图层编号
		public var layerNo:int;
		
		//建筑CAD服务地址路径
		public var cadUrl:String;
		
		//备注
		public var remark:String;
	}
}