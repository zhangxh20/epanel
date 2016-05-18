package com.gokei.components
{
	/**
	 * 所有Widget与底图之间通信的事件
	 * 
	 * @Author zhang
	 * @Version v1.0
	 * @Date 2012-9
	 */ 
	public class EventType
	{
		public static const USER_LOGIN:String = "userLogin";
		
		public static const USER_LOGOUT:String = "userLogout";
		/** 用户登录成功*/
		public static const USER_LOGIN_SUCCESS:String = "userLoginSuccess";
		/** 重新载入 */
		public static const RELOAD_LOGIN:String = "reloadLogin";
		// 配线工具切换
		public static const WIRING_OPT:String = "wiringOpt";
		// 显示机柜（展示图）
		public static const CABINET_SHOW:String = "cabinetShow";
		// 显示机柜（管理图）
		public static const CABINET_SHOW_MNG:String = "cabinetShowMng";
		// 显示机柜（管理图）的端口
		public static const EQMT_PORTLIST_MNG:String = "eqmtPortlistMng";
		// 停止loading
		public static const STOP_LOADING:String = "stopLoading";
		// 端口被选择
		public static const PORT_SELECT:String = "portSelect";
		// 添加的配线，取消
		public static const ADDCABLE_CANCEL:String = "addCableCancel";
		// 添加的配线，ok
		public static const ADDCABLE_OK:String = "addCableOK";
		// 选择跨机柜
		public static const DOUBLE_CABINET:String = "doubleCabinet";
		// 显示跨机柜的目标端口
		public static const DOUBLE_CABINET_SHOW:String = "doubleCabinetShow";
		// 关闭机柜
		public static const CABINET_CLOSE:String = "cabinetClose";
		// 告警机柜连动（展示图）
		public static const ALARM_CABINET:String = "alarmCabinet";
		// 显示机柜告警灯
		public static const CABINET_ALARM_LAMP:String = "cabinetAlarmLamp";
		// 告警机柜连动（管理图）
		public static const ALARM_CABINET_MNG:String = "alarmCabinetMng";
		// 链路显示
		public static const CHAIN_SHOW:String = "chainShow";
		// 底图选择切换
		public static const BASEMAP_CHANGE:String = "basemapChange";
		// 切换到工作单
		public static const WORKSHEET_SHOW:String = "workSheet_show";
		// 树形图选择
		public static const TREE_SELECT:String = "treeSelect";
		// 告警推送
		public static const ALARM_PUSH:String = "alarmPush";
		// 扫描推送
		public static const SCAN_PUSH:String = "scanPush";
		// 配线单到机柜联动
		public static const WIRING_SHEET_CABINET:String = "wiringSheetCabinet";
		// 记录轨迹
		public static const LOCUS_RECORD:String = "locusRecord";
		// 跨机柜清除
		public static const DOUBLE_CABINET_CLEAR:String = "doubleCabinetClear";
		// 跨机柜联动查询,展示图到管理图
		public static const DIA_MNG_FIND:String = "diaMngFind";
		// 跨机柜联动查询,管理图到展示图
		public static const MNG_DIA_FIND:String = "mngDiaFind";
		// 机柜管理图的机柜切换
		public static const CABINET_SWITCH:String = "cabinetSwitch";
		// 设备新建大分类切换
		public static const BIGTYPE_CHANGE_NEW:String = "bigtypeChangeNew";
		// 设备新建中分类切换
		public static const MIDTYPE_CHANGE_NEW:String = "midtypeChangeNew";
		// 设备新建中分类切换(设备安装界面)
		public static const MIDTYPE_CHANGE_BUILD:String = "midtypeChangeBuild";
		// 中分类变更（基础数据画面）
		public static const MID_CHANGE_CREATE:String = "midChangeCreate";
		//tree -- Link -- 设备管理
		public static const TREE_LINK_CABMNG:String = "treeLinkCabMng";
		//新建机柜成功之后显示
		public static const BUILD_SUCC_CABSHOW:String = "buildSuccCabShow";
		//绑定提示
		public static const BOUND_AFTER:String = "boundAfter";
		//维护树形图 关联 选择类型之后  
		public static const LINK_AFTERSELECTED:String = "linkAfterSelected";
		//添加配线架成功/失败
		public static const ADD_SHELF_SUCCORFAIL:String = "addShelfSuccOrFail";
		//绑定
		public static const BIND:String = "bind";
		//维护树形图--生成表 
		public static const MAIN_SELECTED_TYPE_TABLE:String = "mainSelectedTypeTable";
		// 设备配置发送
		public static const CONFIG_SEND:String = "configSend";
		// 解除绑定
		public static const CANCEL_BIND:String = "cancelBind";
		// 删除设备刷新
		public static const EQMT_DELETE_SUCC:String = "eqmtDeleteSucc";
		// 删除配线架成功/失败 推送
		public static const DELETE_SHELF_RESULT:String = "deleteShelfResult";
		// 扫描跳线推送
		public static const SCAN_CABLE_PUSH:String = "sacnCablePust";
		// 添加/修改房间之后 刷新空间树形图
		public static const ADD_ROOM_SUCC:String = "addRoomSucc";
		// 添加信息点成功
		public static const ADD_INFO_SUCC:String = "addInfoSucc";
		// 双击文件夹触发的事件
		public static const DOUBLE_CLICK:String = "doubleClick";
		//工作单推送
		public static const WORKSHEET_PUSH : String = "workSheetPush";
		//系统设备告警 -- 切换维护树形图 联动
		public static const EQMTALARM_MAINTREE : String = "eqmtAlarmMainTree";
		// 跳线属性扫描
		public static const JUMP_PROP_SCAN:String = "jumpPropScan";
		// 机柜管理图端口状态联动
		public static const PORT_STATUS_LINK:String = "portStatusLink";
		// 告警推送
		public static const ALARM_ANIMATE:String = "alarmAnimate";
		// 跳线扫描失败
		public static const SCAN_CABLE_FAULT:String = "scanCableFault";
		// 跳线扫描失败（多跟跳线中，至少有二个跳线的RFID相同）
		public static const JUMP_SCAN_RFID_FAULT:String = "jumpScanRFIDFault";
		// 机柜刷新
		public static const CABINET_REFRESH:String = "cabinetRefresh";
		// 写入RFID 成功
		public static const WRITE_RFID_SUCC:String = "writeRFIDSucc";
		// 写入RFID 失败
		public static const WRITE_RFID_FAIL:String = "writeRFIDfail";
		//处理关闭 打开 取消 初始化widgets信息(单位)
		public static const INIT_COMPANY_MESSAGE:String = "initCompanyMessage";
		//处理关闭 打开 取消 初始化widgets信息（常规设置）
		public static const INIT_GENSETTING_MESSAGE:String = "initGenSettingMessage";
		// 链路追踪
		public static const LINK_CHAIN:String = "linkChain";
		// 刷新（所有刷新页面都监听）
		public static const REFRESH:String = "refresh";
		
		public static const WIRING_NUM:String = "wringNum";
		
		public static const WORK_NUM:String = "workNUm";
		
		public static const WIRING_WORK_NUM:String = "wringWorkNum";
		
		public static const PRODUCT_REFRESH:String = "productRefresh";
		
		public static const CABINET_CONFIG_REFRESH:String = "cabinetConfigRefresh";
		//更换ARM推送
		public static const REPLACE_ARM_PUSH:String = "replaceARMPush";
		// 上联选择（安装）
		public static const UP_LINK_SELECT:String = "upLinkSelect";
		// 上联选择（编辑）
		public static const UP_LINK_EDIT:String = "upLinkEdit";
		// 点击关闭按钮 关闭机柜
		public static const MNG_DIA_CABINET_CLOSE:String = "mngDiaCabinetClose";
		// 刷新页面的ID
		public static const REFRESH_ID:Array = [
			"alarm1", // 0 告警(操作员)
			"alarm2", // 1 告警(表格)
			"wiringSheet1", // 2  配线单(系统人员,建筑,机柜)
			"wiringSheet2", // 3 配线单(表格)
			"workSheet1", // 4  工作单(系统人员,建筑,机柜)
			"workSheet2", // 5 工作单(表格)
			"tree1", // 6 网络树形图
			"tree2", // 7维护树形图
			"tree3", // 8安装树形图
			"tree4", // 9空间树形图
			"build1", // 10设备安装（网络树形图） 
			"build2", // 11设备安装（分类） 
			"config1",// 12设备配置（空间树形图）
			"query", // 13统计查询
			"tree4_1", // 14控件树形图（小对象类型）
			"user1", // 15添加用户（所在用户组）
			"addBuilding", // 16添加建筑（对象类别）
			"addArea", // 17添加楼层（对象类别）
			"allUserGroup", //18 所有用户组
			"allUser", // 19所有用户
			"allBuilding", // 20 所有建筑
			"allArea", // 21 所有楼层
			"allObjectType", // 22所有小对象
			"staticWiring", // 23静态配线
			"build3", // 24设备安装（楼层/区域刷新）
		];
		public function EventType()
		{
		}
	}
}