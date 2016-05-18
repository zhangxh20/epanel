package widgets.GeneralSetting.entity
{
	[Bindable]
	[RemoteClass(alias="com.gokei.setting.entity.SystemSetting")]
	public class SystemSetting
	{
		public function SystemSetting()
		{
		}
		
		//ID
		public var id:int;
		
		//系统延时
		public var delayTime:int;
		
		//语言版本
		public var languageVersions:String;
		
		//工作单默认时间
		public var worksheetTime:int;
		
		//COM口名称
		public var commPortIdentifier:String
		
		//系统邮箱地址
		public var emailAddress:String;
		
		//系统邮箱用户名
		public var emailUserName:String;
		
		//系统邮箱密码
		public var emailPassword:String;
		
		//smtp服务器地址
		public var smtpAddress:String;
		
		//系统邮箱名称
		public var emailSender:String;
		
		//发送e-Mail 
		public var sendWsEmail:String;
		
		//发送工作单
		public var sendWsMessage:String;
		
		//生成工作单非法告警
		public var wsOperatorWarning:String;
		
	}
}