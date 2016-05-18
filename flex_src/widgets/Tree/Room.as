package widgets.Tree
{
	[Bindable]
	[RemoteClass(alias="com.gokei.baseinfo.entity.Room")]
	public class Room
	{
		public function Room()
		{
		}
		//id
		public var id : int;
		
		//房间名称
		public var name : String ;
		
		//房间简称
		public var abbrName : String ;
		
		//楼层ID
		public var areaId : int ;
		
		//对象ID
		public var typeId : String ;
		
		//备注
		public var remark : String ;
	}
}