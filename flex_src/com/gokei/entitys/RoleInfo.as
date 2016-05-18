package com.gokei.entitys
{
	import mx.collections.ArrayCollection;
	[Bindable]
	[RemoteClass(alias="com.gokei.auth.entity.RoleInfo")]
	public class RoleInfo
	{
		public var id:int;
		
		public var name:String;
		
		public var remark:String;
		
		public var authList:ArrayCollection;
		
		public function RoleInfo()
		{
		}
	}
}