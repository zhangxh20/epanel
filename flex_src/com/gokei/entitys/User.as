package com.gokei.entitys
{
	[Bindable]
	[RemoteClass(alias="com.gokei.baseinfo.entity.User")]
	public class User
	{
		public var userId:String;
		
		public var password:String;
		
		public var rfid:String;
		
		public var roleId:int;
		
		public var name:String;
		
		public var tel:String;
		
		public var department:String;
		
		public var post:String;
		
		public var email:String;
		
		public var mobId:String;
		
		public var remark:String;
		
		public function User()
		{
		}
		
		
	}
}