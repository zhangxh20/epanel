package widgets.BasicData.entitys
{
	[Bindable]
	[RemoteClass(alias="com.gokei.baseinfo.entity.Area")]
	public class Area
	{
		public function Area()
		{
		}
		//id
		public var id:int;
		
		//建筑id，外键，和建筑表ID关联
		public var buildingId:int;
		
		//楼层编号
		public var code:String;
		
		//楼层名称
		public var name:String;
		
		//楼层。区域
		public var type:String;
		
		//区域序号
		public var seqNo:int;
		
		//对象类别
		public var typeId:String;
		
		//点位图源文件地址路径
		public var cadPath:String;
		
		//点位图GIS服务地址
		public var cadUrl:String;
		
		//图层编号
		public var layerNo:int;
		
		//备注
		public var remark:String;
	}
}