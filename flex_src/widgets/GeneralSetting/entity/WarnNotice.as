package widgets.GeneralSetting.entity
{
	[Bindable]
	[RemoteClass(alias="com.gokei.warning.entity.WarnNotice")]
	public class WarnNotice
	{
		public function WarnNotice()
		{
		}
		//id
		public var id:int;
		
		//类型
		public var type:String;
		
		//开始时间
		public var beginDate:Date;
		
		//结束时间
		public var endDate:Date;
		
		//用户名
		public var userId:String;
	}
}