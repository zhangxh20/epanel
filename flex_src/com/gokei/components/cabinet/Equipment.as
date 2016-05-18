package com.gokei.components.cabinet
{
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.collections.ArrayCollection;
	
	import spark.components.Group;
	import spark.components.Image;
	import spark.components.Label;
	
	/**
	 * 网络设备或配线架
	 * 
	 * @Author zhang
	 * @Version v1.0
	 * @Date 2012-9
	 */ 
	public class Equipment extends Group
	{
		private var _eqmtId:int;
		
		private var _type:int;
		
		private var _uNo:int;
		
		private var _portCount:int;
		
		private var _typeId:String;
		
		private var _portList:ArrayCollection;
		
		private var background:Image;
		
		private var arrow:Image;
		
		private var _portViewList:Object = new Object();
		
		private var _alarmLampList:Object = new Object();
		
		private var eqmtAlarmLamp:AlarmLamp;
		
		private var timer:Timer = new Timer(200,24);
		
		public var shelfType:int;
		
		public function Equipment(type:int,source:String) {
			super();
			_type = type;
			background = new Image();
			background.source = source;
			addElement(background);
			arrow = new Image();
			arrow.source = "assets/images/arrow.png";
			arrow.x = 768;
			addElement(arrow);
			arrow.smooth = true;
			arrow.visible = false;
			addEventListener(MouseEvent.CLICK,equipmentClick);
			timer.addEventListener(TimerEvent.TIMER,onTimer);
			timer.addEventListener(TimerEvent.TIMER_COMPLETE,function(event:TimerEvent):void {
				background.visible = true;
			});
		}
		
		public function get type():int {
			return _type;
		}
		
		public function set uNo(n:int):void {
			_uNo = n;
		}
		
		public function get uNo():int {
			return _uNo;
		}
		
		public function set eqmtId(ids:int):void {
			_eqmtId = ids;
		}
		
		public function get eqmtId():int {
			return _eqmtId;
		}
		
		public function set portCount(count:int):void {
			_portCount = count;
		}
		
		public function set image(source:String):void {
			background.source = source;
		}
		
		public function set portList(list:ArrayCollection):void {
			_portList = list;
			if (_portList == null || _portList.length ==0) {
				return;
			}
			// 配线架
			if (_type == 0) {
				if (_typeId == "GLZNJ" || _typeId == "TLZNJ") {
					portState();
				}
			}
			// 网络设备
			else if (_type == 1) {
				portStateX();
			}
		}
		
		public function set typeId(str:String):void {
			_typeId = str;
			if (_type == 0) {
				if (_typeId == "GLZNJ" || _typeId == "TLZNJ" ) {
					eqmtAlarmLamp = new AlarmLamp(4,10);
					addElement(eqmtAlarmLamp);
					eqmtAlarmLamp.x = 389;
					eqmtAlarmLamp.y = 10;
					eqmtAlarmLamp = new AlarmLamp(4,10);
					addElement(eqmtAlarmLamp);
					eqmtAlarmLamp.x = 382;
					eqmtAlarmLamp.y = 10;
					eqmtAlarmLamp = new AlarmLamp(4,10);
					addElement(eqmtAlarmLamp);
					eqmtAlarmLamp.x = 375;
					eqmtAlarmLamp.y = 10;	
				}
			}
		}
		
		public function set isBound(str:String):void {
			if (_type == 0 || _type == 2) {
				if (str != "1") {
					background.alpha = 0.5;
				}
			}
		}
		
		public function get portList():ArrayCollection {
			return _portList;
		}
		
		/**
		 * 初始化配线架端口
		 * */
		public function portState():void {
			var port:Object;
			var lamp:AlarmLamp;
			var img:PortView;
			var space:Number = 31;
			var labSpace:Number = 8;
			for (var i:int = 0; i < _portCount; i++) {
				img = new PortView();
				port = _portList.getItemAt(i);
				img.id = port.id;
				img.code = port.code;
				img.infoCode = port.showCode;
				img.linetype = port.lineType;
				img.parentType = port.parentType;
				if (port.available == 1) {
					addElement(img);
					if(port.wsState == 0){
						//配线单
						img.status = 3;
					}else if ( port.wsState > 0 && port.wsState < 5 ) {
						//工作单中
						img.status = 2;
					} else {
						if (port.inCable == 1) {
							//已完成工作单
							img.status = 1;
						} else {
							//端口处于空闲
							img.status = 0;
						}
					}
				}
				img.x = space + i*26.66;
				img.y = 39;
				img.addEventListener(CabinetEvent.PORT_CLICK,portClick);
				_portViewList[img.code] = img;
				lamp = new AlarmLamp();
				addElement(lamp);
				lamp.x = img.x + 5;
				lamp.y = 15;
				_alarmLampList[img.code] = lamp;
				var portNo:Label = new Label();
				portNo.text = (i + 1) + "";
				portNo.setStyle("color",0xffffff);
				portNo.setStyle("fontSize",13);
				addElement(portNo);
				portNo.y = 62;
				portNo.x = img.x + labSpace;
				if (i == 8) {
					labSpace = 6;
				}
				if ( i == 5) {
					space = 44;
				} else if (i == 11) {
					space = 83;
				} else if (i == 17) {
					space = 96;
				}
			}
		}
		
		/**
		 * 初始化交换机端口
		 * */
		private function portStateX():void{
			var port : Object;  //端口对象
			var img:PortView; //端口的状态
			var space:Number = 42;
			for (var i : int = 0 ; i < _portCount ; i++){
				port = _portList.getItemAt(i);
				img = new PortView();
				img.id = port.id;
				img.code = port.code;
				img.infoCode = port.showCode;
				img.linetype = port.lineType;
				img.parentType = port.parentType;
				_portViewList[img.code] = img;
				img.addEventListener(CabinetEvent.PORT_CLICK,portClick);
				//初始化端口状态
				addElement(img);
				if (port.wsState == 0 ){
					img.status = 3;
				}else if (port.wsState > 0 && port.wsState < 5 ) {
					img.status = 2;
				} else {
					if (port.inCable == 1) {
						img.status = 1;
					} else {
						img.status = 0 ;
						
					}
				}
				var portNo : Label = new Label();
				portNo.text = (i + 1) + "";
				portNo.setStyle("color",0xffffff);
				portNo.setStyle("fontSize",13);
				addElement(portNo);
				//端口位置
				//如果为24口 交换机  每8个端口为一组... 48口交换机 每行24口 8个为一组
				if( _portCount == 24 ){
					if( i % 8 == 0){
						space += 10 ;
					}
					img.x = space + i*26.66;
					img.y = 30 ;
					portNo.x = space + 9 + i*26.66;
					portNo.y = 58;
				}else{
					if(i < 24){
						if( i % 8 == 0){
							space += 10 ;
						}
						img.rotationX = 180 ;
						img.reverse = 1 ;
						img.x = space + i*26.66;
						img.y = 39 ;
						portNo.x = space + 9 + i*26.66;
						portNo.y = 3;
					}else{
						if(i == 24){
							space = 42;
						}
						if( i % 8 == 0){
							space += 10 ;
						}
						img.x = space + (i-24)*26.66;
						img.y = 42 ;
						portNo.x = space + 6 + (i-24)*26.66;
						portNo.y = 68;
					}
				}
			}
			
		}
		
		
		
		/**
		 * 端口点击，事件冒泡
		 */ 
		public function portClick(event:CabinetEvent):void {
			var evt:CabinetEvent = new CabinetEvent(CabinetEvent.PORT_CLICK_BUBBLE);
			evt.portView = event.portView;
			evt.equipment = this;
			dispatchEvent(evt);
		}
		
		/**
		 * 设备点击，事件冒泡
		 */ 
		public function equipmentClick(event:MouseEvent):void {
			if (event.target == background.skin) {
				var evt:CabinetEvent = new CabinetEvent(CabinetEvent.EQUIPMENT_CLICK);
				evt.equipment = this;
				dispatchEvent(evt);
			}
		}
		
		/**
		 * 通过端口序号，查找端口
		 */ 
		public function getPortViewByCode(code:String):PortView {
			return _portViewList[code];
		}
		
		public function getAlarmLampByCode(code:String):AlarmLamp {
			return _alarmLampList[code];
		}
		
		/**
		 * 显示箭头
		 */
		public function showArrow(type:int = 0):Image {
			if (type == 1) {
				arrow.source = "assets/images/arrow.png";
			} else {
				arrow.source = "assets/images/arrow2.png"
			}
			arrow.visible = true;
			return arrow;
		}
		
		/**
		 * 隐藏箭头
		 */
		public function hiddeArrow():void {
			arrow.visible = false;
		}
		
		public function startAlarm():void {
			eqmtAlarmLamp.startAlarm();
		}
		
		private function onTimer(event:TimerEvent):void {
			if (visible) {
				visible = false;
			} else {
				visible = true;
			}
		}
		
		public function startWave():void {
			timer.reset();
			timer.start();
		}
		
		public function stopWave():void {
			timer.stop();
			visible = true;
		}
	
	}
}