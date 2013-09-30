package com.onlyplay.slotmatch3.components.lobby_smith
{
	import flash.events.IEventDispatcher;
	import com.netease.protobuf.Message;
	import flash.events.MouseEvent;

	/**
	 * @author Andrew
	 */
	public interface IInterLevelDlg extends IEventDispatcher
	{
		function show(data:Message) : void;
		function hide(e:MouseEvent = null):void;
		function saveParams(isl:int, loc:int):void;
	}
}
