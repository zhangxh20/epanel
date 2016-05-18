package com.gokei.util
{
	import com.gokei.components.Loading;
	
	import flash.display.DisplayObject;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.managers.PopUpManager;
	import mx.resources.ResourceBundle;
	import mx.resources.ResourceManager;
	
	import spark.components.Application;
	
	import widgets.Tree.AutoSizeTree;
	import widgets.Tree.TreeImageList;
	

	public class CommonUtil
	{
		public function CommonUtil()
		{
		}
		
		private static const VIEWER_STRINGS:String = "ViewerStrings";
		private static var loading:Loading = new Loading();
		
		private static function subCode(code : String):String{
			var newCode : String = '';
			for ( var i : int = 0 ; i < code.length ; i ++){
				if( code.substring(i , i + 1) == '0' ){
					continue ;
				}else{
					newCode = code.substring(i,code.length);
					break ;
				}
			}
			return newCode;
		}	
		
		public static function getNewCode(code : String , type : String):String{
			var str1 : String = ""; //ip
			var str2 : String = ""; //collectorCode
			var str3 : String = "";//shelfCode
			if (type == 'collector') {
				str1 = code.substring(0,code.indexOf("-")); //ip
				str2 = code.substring(code.indexOf("-") + 1,code.length );
				return str1 + "-" + subCode(str2);;
			} else if (type == "shelf"){
				str1 = code.substring(0,code.indexOf("-"));
				str2 = code.substring(code.indexOf("-") +1 ,code.lastIndexOf("-"));
				str3 = code.substring(code.lastIndexOf("-")+1,code.length);
				return str1 + "-" + subCode(str2) + "-" + subCode(str3);
			}
			return "";
		}
		
		/**
		 * Tree 
		 * 获取树形图上面的label 
		 * @param item ： 树的xml
		 * @param type ：  net 网络图   main 维护图  init 安装图
		 * */
		public static function labelfunc(item : Object,type : String):String {
			var xml:XML = item as XML;
			var str : String = '';
			//如果是单位
			if(xml.@type == 'company'){
//				str = '单位名称：' + xml.@name;
				str = ResourceManager.getInstance().getString(VIEWER_STRINGS,"C00004") + xml.@name;
			}
			//如果是建筑
			if(xml.@type == 'building'){
//				str = '建筑名称：' + xml.@name;
				str = ResourceManager.getInstance().getString(VIEWER_STRINGS,"C00005") + xml.@name;
			}
			//如果是网关
			if(xml.@type == 'gateway'){
//				str = '网关：' + xml.@ip;
				str = ResourceManager.getInstance().getString(VIEWER_STRINGS,"C00006") + xml.@ip;
			}
			//-------------------网络树形图-------------------//
			if(xml.@type == 'otherCabiEqmt'){
//				str = xml.@name+ '：' +' 品牌：' + xml.@brand+ '  所在U层：' + xml.@uNo + "U";
				str = xml.@name+ '：' +ResourceManager.getInstance().getString(VIEWER_STRINGS,"C00007") + xml.@brand+ ResourceManager.getInstance().getString(VIEWER_STRINGS,"C00007") + xml.@uNo + "U";
			}
			if(xml.@type == 'netEquipment'){
//				str = xml.@name+ '：' +'型号：' +xml.@model +'  所在U层：' + xml.@uNo + "U";
				str = xml.@name+ '：' +ResourceManager.getInstance().getString(VIEWER_STRINGS,"C00009") +xml.@model +ResourceManager.getInstance().getString(VIEWER_STRINGS,"C00010") + xml.@uNo + "U";
			}
			
			if(xml.@type == 'controller'){
				if(xml.@assetsName == ""){
//					str = '智能管理主机 ：' ;
					str = ResourceManager.getInstance().getString(VIEWER_STRINGS,"C00011") ;
				}else{
					str = xml.@assetsName + '：'  ;
				}
				str += 'IP：' + xml.@ip ;
				if(type == 'net' || type == 'init'){
					//不用显示 机柜ID 
				}else{
//					str += " 机柜ID：" + xml.@cabinetCode;
					str += ResourceManager.getInstance().getString(VIEWER_STRINGS,"C00012") + xml.@cabinetCode;
				}
//				str += ' 所在U层： ' ;
				str += ResourceManager.getInstance().getString(VIEWER_STRINGS,"C00013") ;
				if (xml.@uNo == "0") {
					str += " ";
				} else {
					str += xml.@uNo + "U";
				}
			}
		//	antennaCode equCode
			if(xml.@type == 'collector'){
				if(xml.@assetsName == ""){
//					str = '扫描仪 ：' ;
					str = ResourceManager.getInstance().getString(VIEWER_STRINGS,"C00014") ;
				}else{
					str = xml.@assetsName + "："  
				}
//				str += " 扫描仪序号：" ;
				str += ResourceManager.getInstance().getString(VIEWER_STRINGS,"C00015") ;
				if(type == 'net'){
					if (xml.@scannerSeqNo != ""){
						str += getNewCode(xml.@scannerSeqNo,"collector");
					}
				}else if(type == 'main'){
					if(xml.@isBound == 0){
						str += subCode(xml.@equCode);
					}else{
						if (xml.@scannerSeqNo != ""){
							str += getNewCode(xml.@scannerSeqNo,"collector");
						} else {
							str += "";
						}
					}
//					 str += " 机柜ID：" + xml.@cabinetCode;
					 str += ResourceManager.getInstance().getString(VIEWER_STRINGS,"C00016") + xml.@cabinetCode;
				}else{
					if (xml.@scannerSeqNo != "") {
						str += getNewCode(xml.@scannerSeqNo,"collector");
					} else {
						str += " ";
					}
				}
//				str += "  所在U层：" ;
				str += ResourceManager.getInstance().getString(VIEWER_STRINGS,"C00017") ;
				if (xml.@uNo == "0" ){
					str += " ";
				} else {
					str += xml.@uNo + "U";
				}
			}
			
			if(xml.@type == 'shelf'){
				if(xml.@assetsName == ""){
//					str = '电子配线架 ：';
					str = ResourceManager.getInstance().getString(VIEWER_STRINGS,"C00018");
				}else{
					str = xml.@assetsName + "：" ;
				}
				if(xml.@isEShelf =='1'){
//					str += "  配线架序号：" ;
					str += ResourceManager.getInstance().getString(VIEWER_STRINGS,"C00019") ;
					if(type == 'net'){
						if (xml.@mngPort != "") {
							str += getNewCode(xml.@mngPort,"shelf") ;
						} else {
							str += " ";
						}
					}else if(type == 'main'){
						if(xml.@isBound == 0){
							str += subCode(xml.@antennaCode);
						}else{
							if (xml.@mngPort != "") {
								str += getNewCode(xml.@mngPort,"shelf");
							} else {
								str += " ";
							}
						}
//						str += "  机柜ID：" +xml.@cabinetCode;
						str += ResourceManager.getInstance().getString(VIEWER_STRINGS,"C00020") +xml.@cabinetCode;
					}else{
						if (xml.@mngPort != "") {
							str += getNewCode(xml.@mngPort,"shelf");
						} else {
							str += " ";
						}
					}
				}
//				str += "  所在U层：" ;
				str += ResourceManager.getInstance().getString(VIEWER_STRINGS,"C00021") ;
				if (xml.@isBound == 0){
					if (xml.@uNo == "0"){
						str += " ";
					} else {
						str += xml.@uNo + "U ";
					}
				} else {
					str += xml.@uNo + "U " ;
				}
//				str +=  " 类型：" ;
				str +=  ResourceManager.getInstance().getString(VIEWER_STRINGS,"C00022") ;
				if(xml.@typeX == 0){
//					str += "主干";
					str += ResourceManager.getInstance().getString(VIEWER_STRINGS,"C00023");
				}else if(xml.@typeX == 1){
//					str += "水平";
					str += ResourceManager.getInstance().getString(VIEWER_STRINGS,"C00024");
				}else if(xml.@typeX == 2){
//					str += "交换机";
					str += ResourceManager.getInstance().getString(VIEWER_STRINGS,"C00025");
				}
			}
			
			if(xml.@type == 'cabinet'){
//				str = xml.@name + "： " + xml.@areaName + "  机柜ID：" + xml.@code + "  总U数：" + xml.@uCount + "U  " ;
				str = xml.@name + "： " + xml.@areaName + ResourceManager.getInstance().getString(VIEWER_STRINGS,"C00026") + xml.@code + ResourceManager.getInstance().getString(VIEWER_STRINGS,"C00027") + xml.@uCount + "U  " ;
				//	"(语音信息点：" + xml.@P + "  数据信息点：" + xml.@D + "  光数据信息点：" + xml.@G + ")";
			}
			
			var flag : Boolean = false;
			//如果有语音信息点 数据信息点 光数据信息点  显示设备ID
			if(xml.@type == 'area' || xml.@type == 'room'){
				str = xml.@name ;
				if(xml.@P != 0){
//					str += "  [ 语音信息点：" + xml.@P + " ] " ;
					str += ResourceManager.getInstance().getString(VIEWER_STRINGS,"C00028") + xml.@P + " ] " ;
					flag = true;
				}
				if(xml.@D != 0){
//					str += "  [ 数据信息点：" + xml.@D + " ] ";
					str += ResourceManager.getInstance().getString(VIEWER_STRINGS,"C00029") + xml.@D + " ] ";
					flag = true;
				}
				if(xml.@G != 0){
//					str += "  [ 光数据信息点：" + xml.@G + " ] ";
					str += ResourceManager.getInstance().getString(VIEWER_STRINGS,"C00030") + xml.@G + " ] ";
					flag = true;
				}
			}
			if(flag && xml.@type == 'room'){
//				str += " 设备ID： " + xml.@shelfCodes;
				str += ResourceManager.getInstance().getString(VIEWER_STRINGS,"C00031") + xml.@shelfCodes;
			}
			return str;
		}
		
		
		public static function iconfunc(item:Object):Class {
			var xml:XML = item as XML;
			var cls:Class;
			var type:String = xml.@type;
			var isBind:int = xml.@isBound;
			switch (type) {
				case 'controller' :
					if(isBind == 0) {
						cls = TreeImageList.controllerIconX;
					}else{
						cls = TreeImageList.controllerIcon;
					}
					break;
				case 'collector' :
					if(isBind == 0) {
						cls = TreeImageList.collectorIconX;
					}else if(isBind == 1){
						cls = TreeImageList.collectorIcon;
					}else{
						cls = TreeImageList.collectorIconY;
					}
					break;
				case 'shelf' :
					if(isBind == 0) {
						cls = TreeImageList.shelfIconX;
					}else if(isBind == 1){
						cls = TreeImageList.shelfIcon;
					}else{
						cls = TreeImageList.shelfIconY;
					}
					break;
				case 'company' :
					cls = TreeImageList.companyIcon;
					break;
				case 'gateway' :
					cls = TreeImageList.gatewayIcon;
					break;
				case 'cabinet' :
					if(xml.@isMain == 0){
						cls = TreeImageList.branchCabinetIcon;
					}else{
						cls = TreeImageList.mainCabinetIcon;
					}
					break ;
				case 'building' :
					cls = TreeImageList.buildingIcon;
					break;
				case 'netEquipment' :
					cls = TreeImageList.netEquIcon;
					break;
				case 'otherCabiEqmt' :
					cls = TreeImageList.otherEquipmentIcon;
					break;
				case 'area' :
					cls = TreeImageList.areaIcon;
					break ;
				case 'room' :
					cls = TreeImageList.roomIcon;
					break ;
					
			}
			return cls;
		}
		
		public static function startLoading(type:int,seconds:int):void {
			loading.x = (FlexGlobals.topLevelApplication.width-loading.width)/2;
			loading.y = (FlexGlobals.topLevelApplication.height-loading.height)/2;
			loading.startLoading(type,seconds);
			PopUpManager.addPopUp(loading,FlexGlobals.topLevelApplication as DisplayObject,type == 0 ? true : false);
		}
		
		public static function stopLoading():void {
			PopUpManager.removePopUp(loading);
		}
		
		public static function reset():void {
			loading.reset();
		}
		
		/**
		 * 获取系统根目录
		 * */
		public static function getRootPath():String{
			var url:String = FlexGlobals.topLevelApplication.url;
			var i1:int=url.indexOf("/") + 2;
			var i2:int=url.indexOf("/", i1);
			var i3:int=url.indexOf("/", i2 + 1);
			return url.substr(0, i3);
		}
		
		/**
		 * 信息点输入验证
		 * @param str 信息点编号
		 * @return boolean 验证通过：true,验证失败:false
		 */ 
		public static function checkInfoCode(str:String):Boolean {
			var reg:RegExp = /[^A-Za-z0-9\-]+/;
			if (reg.test(str)) {
				return false;
			} else {
				reg = /[A-Za-z0-9\-]+[gdpGDP]{1}$/;
				if (reg.test(str)) {
					return true;
				} else {
					return false;
				}
			}
			return true;
		}
		
		public static function checkMaincode(arr:Array):Boolean {
			var bool:Boolean = true;
			var reg:RegExp = /[^A-Za-z0-9\-]+/;
			for (var i:int = 0; i < arr.length; i++) {
				if (reg.test(arr[i].mainCode as String)) {
//					Alert.show("端口编号[" + (i + 1) + "]输入格式错误");
					Alert.show(ResourceManager.getInstance().getString(VIEWER_STRINGS,"C00032") + (i + 1) + ResourceManager.getInstance().getString(VIEWER_STRINGS,"C00033"));
					bool = false;
					break;
				}
			}
			return bool;
		}
		
		public static function checkUserName(str:String):Boolean{
			var reg : RegExp = /[A-Za-z0-9]/;
			if (reg.test(str)){
				return true;
			}
			return false;
		}
		
		public static function checkShelfCode(str:String):Boolean {
			if (str == "")return true;
			var reg : RegExp = /^(2[5][0-5]|2[0-4]\d|1\d{2}|\d{1,2})\.(25[0-5]|2[0-4]\d|1\d{2}|\d{1,2})\.(25[0-5]|2[0-4]\d|1\d{2}|\d{1,2})\.(25[0-5]|2[0-4]\d|1\d{2}|\d{1,2})\-([1-9]{1}|1\d|20)\-[1-3]{1}$/;
			if (reg.test(str)){
				return true;
			}
//			Alert.show("配线架序号输入格式错误");
			Alert.show(ResourceManager.getInstance().getString(VIEWER_STRINGS,"E00006"));
			return false;
		}
		
		public static function checkCollectorCode(str:String):Boolean {
			if (str == "")return true;
			var reg : RegExp = /^(2[5][0-5]|2[0-4]\d|1\d{2}|\d{1,2})\.(25[0-5]|2[0-4]\d|1\d{2}|\d{1,2})\.(25[0-5]|2[0-4]\d|1\d{2}|\d{1,2})\.(25[0-5]|2[0-4]\d|1\d{2}|\d{1,2})\-[1-9]{1}$/;
			if (reg.test(str)){
				return true;
			}
			return false;
		}
		
		public static function checkIp(str:String):Boolean {
			if (str == "")return true;
			var reg : RegExp = /^(2[5][0-5]|2[0-4]\d|1\d{2}|\d{1,2})\.(25[0-5]|2[0-4]\d|1\d{2}|\d{1,2})\.(25[0-5]|2[0-4]\d|1\d{2}|\d{1,2})\.(25[0-5]|2[0-4]\d|1\d{2}|\d{1,2})$/;
			if (reg.test(str)){
				return true;
			}
//			Alert.show("IP输入格式错误");
			Alert.show(ResourceManager.getInstance().getString(VIEWER_STRINGS,"E00007"));
			return false;
		}
		
		public static function checkEqmtId(str:String):Boolean {
			if (str == "")return true;
			var reg : RegExp = /^[A-Za-z0-9]{4}-([1-9]|[1-9]\d)$/;
			if (reg.test(str)){
				return true;
			}
//			Alert.show("目标设备ID输入格式错误");
			Alert.show(ResourceManager.getInstance().getString(VIEWER_STRINGS,"E00008"));
			return false;
		}
		
		/**
		 * 
		 * */
		public static function getFirstTime(day:Number,hour:Number):Number{
			var date:Date = new Date();
			if (day == date.day){
				if (hour >= date.hours){
					return (hour - date.hours) * 3600000;
				} else {
					return  (7 * 24 -  date.hours + hour) * 3600000;
				}
			} else if (day > date.day) {
				if (hour >= date.hours) {
					return ((day - date.day) * 24 + (hour - date.hours)) * 3600000;
				} else{
					return ((day - 1 - date.day) * 24 + (24 + hour - date.hours)) * 3600000;
				}
			} else {
				// 昨天
				if (hour >= date.hours) {
					return ((7 + day - date.day) * 24 + (hour - date.hours)) * 3600000;
				} else {
					return ((6 + day - date.day) * 24 + (24 + hour - date.hours)) * 3600000;
				}
			}
		}
		
		/**
		 * 比较二个数的大小
		 * */
		public static function sortNumber(num1 : int , num2 : int):int{
			if (num1 == num2){
				return 0;
			} else if (num1 > num2){
				return -1 ;	
			} else {
				return 1;
			}
		}
		
		/**
		 * 校验邮箱地址
		 * */
		public static function checkEmailAddress(str : String):Boolean{
			if (str == "")return true;
			var reg : RegExp = /([0-9a-zA-Z]+[-._+&])*[0-9a-zA-Z]+@([-0-9a-zA-Z]+[.])+[a-zA-Z]{2,6}/;
			if (reg.test(str)){
				return true;
			}
//			Alert.show("系统邮箱地址格式错误!","提示");
			Alert.show(ResourceManager.getInstance().getString(VIEWER_STRINGS,"E00009"),ResourceManager.getInstance().getString(VIEWER_STRINGS,"T00001"));
			return false;
		}
		/**
		 * 校验简称只能输入英文字母
		 * */
		public static function checkAttrName(str : String):Boolean{
			if(str == '')return true;
			var reg : RegExp = /^[A-Za-z]+$/;
			if (reg.test(str)){
				return true;
			}
			return false;
		}
	}
}