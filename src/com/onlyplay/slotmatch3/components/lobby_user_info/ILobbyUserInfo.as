package com.onlyplay.slotmatch3.components.lobby_user_info
{
	import flash.events.IEventDispatcher;
	import com.netease.protobuf.Message;
	import PlayerProtobuf
	

	/**
	 * @author Andrew
	 */
	public interface ILobbyUserInfo extends IEventDispatcher
	{
		function show(info:PlayerProtobuf) : void;
		//function hide(e:MouseEvent = null):void;
		//function saveParams(isl:int, loc:int):void;
	}
}
