package com.gokei.entitys
{
	[Bindable]
	[RemoteClass(alias="com.gokei.baseinfo.entity.Auth")]
	public class Auth
	{
		public var id:int;
		
		public var name:String;
		
		public var type:String;
		
		public var funAbbrName:String;
		
		public var funFullName:String;
		
		public function Auth()
		{
		}
	}
}