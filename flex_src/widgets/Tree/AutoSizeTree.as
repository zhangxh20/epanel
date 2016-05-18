package widgets.Tree
{
	
	import flash.events.Event;
	
	import mx.controls.Tree;
	import mx.core.ScrollPolicy;
	import mx.core.mx_internal;
	
	public class AutoSizeTree extends Tree {
		public function AutoSizeTree() {
			super();
			horizontalScrollPolicy = ScrollPolicy.AUTO;
		}
		
		override public function get maxHorizontalScrollPosition():Number {
			if (isNaN(mx_internal::_maxHorizontalScrollPosition))
				return 0;
			return mx_internal::_maxHorizontalScrollPosition;
		}
		
		override public function set maxHorizontalScrollPosition(value:Number):void {
			mx_internal::_maxHorizontalScrollPosition = value;
			dispatchEvent(new Event("maxHorizontalScrollPositionChanged"));
			scrollAreaChanged = true;          
			invalidateDisplayList();     
		}
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void {
			var diffWidth:Number = measureWidthOfItems(0,0) - (unscaledWidth - viewMetrics.left - viewMetrics.right);
			var indentation:Number = getStyle("indentation");
			if (diffWidth <= 0)
				maxHorizontalScrollPosition = NaN;
			else
				maxHorizontalScrollPosition = diffWidth + indentation;
			super.updateDisplayList(unscaledWidth, unscaledHeight);
		}
	}
}