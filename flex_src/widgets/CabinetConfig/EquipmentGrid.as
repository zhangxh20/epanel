package widgets.CabinetConfig
{	
	import flash.events.MouseEvent;
	
	import mx.collections.ArrayCollection;
	import mx.graphics.SolidColorStroke;
	import mx.resources.ResourceManager;
	
	import spark.components.Group;
	import spark.components.TextInput;
	import spark.primitives.Rect;

	/**
	 * 设备配置表格
	 * 
	 * @Author zhang
	 * @Version v1.0
	 * @Date 2012-12
	 */ 
	[Event(name="inputClick", type="widgets.CabinetConfig.ConfigEvent")]
	public class EquipmentGrid extends Group
	{
		private var _editObj:Object;
		// 标题属性的输入框数组
		public var titleArr:Array;
		// 标题属性的格式数组
		private var propArr:Array;
		// 详细数组
		public var itemList:ArrayCollection;
		// 存放每一列的Map
		private var _columnMap:Array;
		
		private var rect:Rect;
		
		private var propRow : Array;
		
		public function EquipmentGrid()
		{

		}
		
		public function get editObj():Object {
			for each(var item:Object in propArr) {
				_editObj[item.key] = (titleArr[item.key] as TextInput).text;
			}
			return _editObj;
		}
		
		public function get columnMap():Array {
			var arr:Array = new Array();
			for each(var item:Object in _columnMap) {
				var obj:Object = new Object();
				obj["portId"] = item.portId;
				obj["mainCode"] = (item.columns as ArrayCollection).getItemAt(1).text;
				if (item.available == "1") {
					obj["available"] = "1";
				} else {
					obj["available"] = "0";
				}
				obj["serial"] = (item.columns as ArrayCollection).getItemAt(2).text;//控制器的目标设备序号
				obj["propRow"] = propRow;
				obj["columns"] = item.columns;
				arr.push(obj);
			}
			return arr;
		}
		
		public function get columnMapEdit():Array {
			var arr:Array = new Array();
			for each(var item:Object in _columnMap) {
				var obj:Object = new Object();
				obj["portId"] = item.portId;
				obj["mainCode"] = (item.columns as ArrayCollection).getItemAt(1).text;
				arr.push(obj);
			}
			return arr;
		}
		
		public function set editObj(obj:Object):void {
			_editObj = obj;
		}
		
		/**
		 * 显示设备的表格信息
		 * @param obj 格式对象
		 * @param editObj 数据库查询对象
		 */ 
		public function equipmentShow(obj:Object):void {
			clear();
			titleArr = new Array();
			
			_columnMap = new Array();
			propArr = obj.props;
			createTitle(obj.props,_editObj);
			if (obj.propRow) {
				createUcount(_editObj.uHoldCount,itemList.length,obj.propRow.length);
				createRow(obj.propRow,itemList.length);
				if (itemList.length % 24 != 0) {
					createSpace(obj.propRow.length,itemList.length);
				}
			}
		}
		
		public function clear():void {
			removeAllElements();
		}
		
		/**
		 * 创建U数
		 * @param uCount 总U数 
		 * @param portCount 端口总数
		 * @param rowCount 表格详细的行数
		 */ 
		private function createUcount(uCount:int,portCount:int,rowCount:int):void {
			var column:TextInput = new TextInput();
//			column.text = "U数";
			column.text = ResourceManager.getInstance().getString("ViewerStrings","T00126");
			column.width = 30;
			column.height = 20;
			column.setStyle("textAlign","center");
			column.setStyle("fontWeight","bold");
			column.setStyle('contentBackgroundColor', 0xa2d2ff);
			column.setStyle('borderColor','green');
			column.editable = false;
			column.enabled = false;
			addElement(column);
			for(var i:int = 0; i < uCount; i++) {
				column = new TextInput();
				column.text = (i+1) +"\nU";
				column.width = 30;
				column.height = rowCount * (int((portCount-1)/24)+1) * 21/uCount -1;
				column.setStyle("textAlign","center");
				column.setStyle("fontWeight","bold");
				column.setStyle('contentBackgroundColor', 0xa2d2ff);
				column.setStyle('borderColor','green');
				column.editable = false;
				column.enabled = false;
				addElement(column);
				column.y = rowCount * i*21 + 21
			}
		}
		
		/**
		 * 创建属性标题
		 * @param props 标题属性数组
		 * @param obj 编辑对象
		 */ 
		private function createTitle(props:Array,obj:Object):void {
			var column:TextInput = new TextInput();
//			column.text = "设备属性";
			column.text = ResourceManager.getInstance().getString("ViewerStrings","T00127");
			column.width = 70;
			column.height = 20;
			column.setStyle("textAlign","center");
			column.setStyle("fontWeight","bold");
			column.setStyle('contentBackgroundColor', 0xa2d2ff);
			column.setStyle('borderColor','green');
			column.editable = false;
			column.enabled = false;
			addElement(column);
			column.x = 31;
			var xNum:int = 102;
			for each(var item:Object in props) {
				// ---------------- label field --------------
				column = new TextInput();
				column.text = item.name;
				column.width = 70;
				column.height = 20;
				column.setStyle("textAlign","center");
				column.setStyle("fontWeight","bold");
				column.setStyle('contentBackgroundColor', 0xa2d2ff);
				column.setStyle('borderColor','green');
				column.editable = false;
				column.enabled = false;
				addElement(column);
				column.x = xNum;
				// ---------------- value field -------------
				column = new TextInput();
				column.width = 141;
				column.height = 20;
				column.setStyle("textAlign","center");
				column.setStyle('contentBackgroundColor', 0x0eaeb0);
				column.setStyle('borderColor','green');
				this.addElement(column);
				column.x = xNum + 71;
				column.text = obj[item.key];
				if (item.key == "uNo") {
					column.text += "U";
				}
				if (item.key == "remark") {
					column.maxChars = 200;
				}
				if (item.type == "label") {
					column.editable = false;
					column.enabled = false;
					column.setStyle('contentBackgroundColor', 0xa2d2ff);
				}
				titleArr[item.key] = column;
				xNum += 213;
			}
			// -------------------- 补空白 -------------------
			column = new TextInput();
			column.width = 71 * 25 + 30 - xNum;
			column.height = 20;
			column.setStyle('contentBackgroundColor', 0xa2d2ff);
			column.setStyle('borderColor','green');
			column.editable = false;
			column.enabled = false;
			this.addElement(column);
			column.x = xNum;
		}
		
		/**
		 * 创建行
		 * @param propRow
		 * @param portCount 端口数
		 */ 
		private function createRow(propRow:Array,portCount:int):void {
			var portIndex:int = 0;
			for (var i:int = 0; i < portCount; i++) {
				// ---------------- 每隔24个端口，换行 -------------------
				if (i % 24 == 0) {
					createRowTitle(propRow, propRow.length * 21 * (int(i/24))+ 21);
					portIndex = 0;
				} 
				this.propRow = propRow;
				createColmun(propRow, int(i/24) + 1,portIndex,i + 1);
				portIndex ++;
			}
		}
		
		/**
		 * 创建标题
		 * @param titles 标题数组
		 * @param yNum 起始y坐标
		 */ 
		private function createRowTitle(titles:Array,yNum:int):void {
			var column:TextInput;
			for each (var item:Object in titles) {
				column = new TextInput();
				column.text = item.name;
				column.width = 70;
				column.height = 20;
				column.setStyle("textAlign","center");
				column.setStyle("fontWeight","bold");
				column.setStyle('contentBackgroundColor', 0xa2d2ff);
				column.setStyle('borderColor','green');
				column.editable = false;
				column.enabled = false;
				addElement(column);
				column.x = 31;
				column.y = yNum;
				yNum += 21;
			}
		}
		
		/**
		 * 创建每一列(item)
		 * @param propArray 属性数组
		 * @param uNo U数（用于换行）
		 * @param portIndex 每一行的端口序号
		 * @param portNo 端口序号
		 */ 
		private function createColmun(propArray:Array,uNo:int,portIndex:int,portNo:int):void {
			var column:TextInput;
			var items:ArrayCollection = itemList.getItemAt(portNo - 1) as ArrayCollection;
			var obj:Object = new Object();
			obj.portId = items.getItemAt(0);
			obj.x = portIndex * 71 + 102;
			obj.y = (uNo-1) * propArray.length * 21 + 21;
			obj.height = propArray.length * 21 - 2;
			var columnGroup:ArrayCollection = new ArrayCollection([]);
			for (var i:int = 0; i < propArray.length; i++) {
				column = new TextInput();
				column.width = 70;
				column.height = 20;
				column.setStyle("textAlign","left");
				column.setStyle("fontWeight","bold");
				column.setStyle('contentBackgroundColor', 0xa2d2ff);
				column.setStyle('borderColor','green');
				if (i == 0) {
					column.setStyle("textAlign","center");
					column.text = portNo + "";
					column.editable = false;
					column.enabled = false;
				} else {
					if (propArray[i].type == "edit") {
						column.editable = true;
						column.maxChars = 50;
						column.setStyle('contentBackgroundColor', 0x0eaeb0);
					} else {
						column.editable = false;
					}
					// ------------ 属性值，第一行是ID -------------------
					column.text = items.getItemAt(i) as String;
					if (i == 1) {
						// -------- 主干配线架共有5行属性 ------
//						if (_editObj.type == "主干配线架") {
						if (_editObj.type == ResourceManager.getInstance().getString("ViewerStrings","T00075")) {
							if (items.getItemAt(4) == "1") {
								obj.available = "1";
								column.editable = false;
								column.setStyle('contentBackgroundColor', 0x0c6aa5);
							}
						}
					}
				}
				// 水平配线架和网络设备
//				if (_editObj.type == "水平配线架" ||_editObj.type == "netEquipment") {
				if (_editObj.type == ResourceManager.getInstance().getString("ViewerStrings","T00076") ||_editObj.type == "netEquipment") {
					column.addEventListener(MouseEvent.CLICK,function (event:MouseEvent):void {
						dispatchEvent(new ConfigEvent(ConfigEvent.INPUT_CLICK,obj));
					});
				} 
				columnGroup.addItem(column);
				addElement(column);
				column.x = portIndex * 71 + 102;
				column.y = (uNo-1) * propArray.length * 21 + i * 21 + 21;
			}
			obj.columns = columnGroup;
			_columnMap[portNo -1] = obj;
		}
		
		/**
		 * 补空白
		 * @param rowNum 行数
		 * @param colNum 总的端口数
		 */ 
		private function createSpace(rowNum:int,colNum:int):void {
			var column:TextInput = new TextInput();
			column.width =  (24 - colNum % 24) * 71;
			column.height = rowNum * 21;
			column.setStyle("textAlign","left");
			column.setStyle("fontWeight","bold");
			column.setStyle('contentBackgroundColor', 0xa2d2ff);
			column.setStyle('borderColor','green');
			column.enabled = false;
			addElement(column);
			column.x = colNum % 24 * 71 + 101;
			column.y = int(colNum/24) * rowNum * 21 + 21;
		}
		
		/**
		 * 选中端口显示边框
		 * param obj 
		 */ 
		public function showRect(obj:Object):void {
			if (!rect) {
				rect = new Rect();
				var stroke:SolidColorStroke = new SolidColorStroke();
				stroke.color = 0xffff70;
				stroke.weight = 3;
				rect.stroke = stroke;
				addElement(rect);
			}
			try {
				getElementIndex(rect);
			} catch (error:Error) {
				addElement(rect);
			}
			rect.x = obj.x;
			rect.y = obj.y;
			rect.width = 69;
			rect.height = obj.height;
			rect.visible = true;
		}
	}
}