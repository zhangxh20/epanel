package widgets.CabinetManager.productsComponent
{
	import flash.events.Event; 
	
	public class ProductGridEvent extends Event 
	{ 
		public static const ITEM_DEL:String = "itemDel";
		
		public static const ITEM_EDIT:String = "itemEdit";
		
		public static const ITEM_BUILD:String = "itemBuild"
		
		public var data:Object; 
		
		public function ProductGridEvent(type:String,obj:Object) 
		{ 
			super(type, true, true); 
			this.data = obj; 
		} 
	} 
}