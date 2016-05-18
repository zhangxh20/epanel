package widgets.DocMng
{
	public class DocMngImageList
	{
		public function DocMngImageList()
		{
		}
		
		[Embed(source="assets/images/makeDir.png")] 
		[Bindable]
		public static var makeDirIcon:Class; //新建文件夹
		
		[Embed(source="assets/images/searchFile.png")] 
		[Bindable]
		public static var searchFileIcon:Class; //收索文件
		
		[Embed(source="assets/images/uploadFile.png")] 
		[Bindable]
		public static var uploadFilesIcon:Class; //上传文件
		
		[Embed(source="assets/images/downLoadFile.png")] 
		[Bindable]
		public static var downLoadFileIcon:Class; //下载
		
		[Embed(source="assets/images/delFile.png")] 
		[Bindable]
		public static var delFileIcon:Class; //删除
	}
}