package widgets.BasicData.entitys
{
	[Bindable]
	[RemoteClass(alias="com.gokei.baseinfo.entity.ObjectType")]
	public class ObjectType
	{
		public function ObjectType()
		{
		}
		//ID
		public var id:String;
		
		//简称
		public var abbrName:String;
		
		//全称
		public var name:String;
		
		//所属大类
		public var parentTypeId:String;
		
		//对应表
		public var tableName:String;
		
		//备注
		public var remark:String;
		// 是否为系统设定的小对象类别
		public var isSysOT:int;
	}
}