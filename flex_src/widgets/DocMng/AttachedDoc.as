package widgets.DocMng
{
	[RemoteClass(alias="com.gokei.file.entity.AttachedDoc")]
	public class AttachedDoc
	{
		public function AttachedDoc()
		{
		}
		
		//ID
		public var id :int ;
		
		//路径
		public var path :String;
		
		//存放的路径+名字
		public var nameSave : String ;
		
		//存放的真实名字
		public var nameShow : String ;
		
		//文档描述
		public var keyWord : String ;
		
		//楼层/区域ID
		public var areaId :int ;
		
		//类型 0 图片 1 文档  2 文件夹
		public var type :int ;
		
		//父对象Id
		public var parentId :int ;
	}
}