package com.gokei.managers
{
	import com.esri.viewer.AppEvent;
	import com.esri.viewer.ViewerContainer;
	import com.gokei.components.EventType;
	import com.gokei.components.Login;
	import com.gokei.entitys.UserInfo;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.external.ExternalInterface;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.managers.PopUpManager;
	import mx.messaging.ChannelSet;
	import mx.messaging.Consumer;
	import mx.messaging.channels.AMFChannel;
	import mx.messaging.events.MessageEvent;
	import mx.messaging.events.MessageFaultEvent;


	
	/**
	 * 画面切换管理器，接受推送的消息
	 * 用户登录框与主界面的切换，地图与系统图、点位图的切换
	 */ 
	public class SwitchManager extends EventDispatcher
	{
		
		public var login:Login = new Login();

		public var userInfo:UserInfo;
		
		private var consumer:Consumer;
		
		public function SwitchManager() {
			AppEvent.addListener(EventType.USER_LOGIN,userLogin);
			AppEvent.addListener(EventType.USER_LOGOUT,userLogout);
			AppEvent.addListener(EventType.RELOAD_LOGIN,reloadLogin);
			AppEvent.addListener(EventType.USER_LOGIN_SUCCESS,loginSuccess);
		}
		
		/**
		 * 用户注销
		 */
		private function userLogout(event:AppEvent):void {
			// 点击注销
			if(event.data == "logout") {
				// 防止页面重复刷新
				login.logout = true;
			// 页面刷新
			} else {
				var container:ViewerContainer = ViewerContainer.getInstance();
				login.x=(container.width - login.width) / 2;
				login.y=(container.height - login.height) / 2;
				PopUpManager.addPopUp(login, container);
				container.visible = false;
				(FlexGlobals.topLevelApplication as ePanel).background.visible = true;
				login.cancel();
				login.showCode();
				login.userName.setFocus();
			}
			login.remote.logoutx();
		}
		
		/**
		 * 用户登录
		 */ 
		private function userLogin(event:Event):void {
			PopUpManager.removePopUp(login);
			var container:ViewerContainer = ViewerContainer.getInstance();
			container.visible = true;
			(FlexGlobals.topLevelApplication as ePanel).background.visible = false;
		}
	
		/**
		 * 画面重新载入
		 */ 
		private function reloadLogin(event:Event):void {
			login.remote.reload();
		}
		
		private function loginSuccess(event:AppEvent):void {
			userInfo = event.data as UserInfo;
			// 添加推送通道
			var channelSet:ChannelSet = new ChannelSet();
			var url:String = FlexGlobals.topLevelApplication.url;
			var i1:int=url.indexOf("/") + 2;
			var i2:int=url.indexOf("/", i1);
			var i3:int=url.indexOf("/", i2 + 1);
			if (consumer)return;
			consumer = new Consumer();
			var address:String=url.substr(0, i3) + "/messagebroker/amfpolling";
			var channel:AMFChannel=new AMFChannel();
			channel.uri = address;
			channelSet.addChannel(channel);
			consumer.destination = "tick-data-feed";
			consumer.subtopic = "tick";
			consumer.channelSet = channelSet;
			// 监听推送
			consumer.addEventListener(MessageEvent.MESSAGE,onMsg);
			consumer.addEventListener(MessageFaultEvent.FAULT,fault);
			consumer.subscribe();
			ExternalInterface.addCallback("exit", exit);
		}
		
		private function exit():void {
			login.remote.logoutx();
		}
		
		/**
		 * 接收推送消息
		 */ 
		private function onMsg(event:MessageEvent):void {
			var obj:Object = event.message.body;
			switch(obj.type)
			{
				case 1: {
					// 告警推送
					AppEvent.dispatch(EventType.ALARM_PUSH,obj);
					// 告警模块上显示总告警条数
					AppEvent.dispatch(EventType.ALARM_ANIMATE,obj.warningCount as Number);
					// 机柜图：查询当前载入的机柜是否有告警信息
					AppEvent.dispatch(EventType.CABINET_ALARM_LAMP);
					// 删除工作单 
					AppEvent.dispatch(EventType.WORKSHEET_PUSH,obj);
					break;
				}
				case 2: {
					AppEvent.dispatch(EventType.WORKSHEET_PUSH,obj);
					break;
				}
				case 3: {
					AppEvent.dispatch(EventType.WORKSHEET_PUSH,obj);
					break;
				}
				case 4: {
					// 扫描推送
					AppEvent.dispatch(EventType.SCAN_PUSH,obj);
					break;
				}
				case 5: {
					//密钥写入成功推送
					AppEvent.dispatch(EventType.WRITE_RFID_SUCC);
					break;
				}
				case 6: {
					//密钥写入失败推送
					AppEvent.dispatch(EventType.WRITE_RFID_FAIL);
					break;
				}
				case 7: {
					//添加配线架成功
					AppEvent.dispatch(EventType.ADD_SHELF_SUCCORFAIL,obj);
					break;
				}
				case 8: {
					//添加配线架失败
					AppEvent.dispatch(EventType.ADD_SHELF_SUCCORFAIL,obj);
					break;
				}
				case 9: {
					AppEvent.dispatch(EventType.BIND,obj);
					break;
				}
				case 10: {
					AppEvent.dispatch(EventType.BIND,obj);
					break;
				}
				case 11: {
					AppEvent.dispatch(EventType.BIND,obj);
					break;
				}
				case 12: {
					AppEvent.dispatch(EventType.CANCEL_BIND,obj);
					break;
				}
				case 13: {
					AppEvent.dispatch(EventType.CANCEL_BIND,obj);
					break;
				}
				case 14: {
					AppEvent.dispatch(EventType.DELETE_SHELF_RESULT,obj);
					break;
				}
				case 15: {
					AppEvent.dispatch(EventType.DELETE_SHELF_RESULT,obj);
					break;
				}
				case 16: {
					//跳线扫描成功
					AppEvent.dispatch(EventType.SCAN_CABLE_PUSH,obj);
					break;
				}
				case 17: {
					// 跳线属性扫描
					AppEvent.dispatch(EventType.JUMP_PROP_SCAN,obj);
					break;
				}
				case 18: {
					//跳线扫描失败
					AppEvent.dispatch(EventType.SCAN_CABLE_FAULT,obj);
				}
				case 19: {
					//初装跳线扫描失败，原因：跳线rfid冲突
					AppEvent.dispatch(EventType.JUMP_SCAN_RFID_FAULT,obj);
				}
				case 20: {
					//更换ARM推送
					AppEvent.dispatch(EventType.REPLACE_ARM_PUSH,obj);
				}
				case 21: {
					//更新工作单标题数量 
					AppEvent.dispatch(EventType.WIRING_WORK_NUM);
					//刷新制单 未完成界面
					var data : Object = {arr : [EventType.REFRESH_ID[5]]};
					AppEvent.dispatch(EventType.REFRESH,data);
				}
				default:
				{
					break;
				}
			}
		}
		
		private function fault(event:MessageFaultEvent):void {
			Alert.show(event.message.body.toString());
		}
	}
}