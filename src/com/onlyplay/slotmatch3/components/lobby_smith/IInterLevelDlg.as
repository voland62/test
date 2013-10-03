package com.onlyplay.slotmatch3.components.lobby_smith
{
	import flash.events.IEventDispatcher;
	import com.netease.protobuf.Message;
	import flash.events.MouseEvent;
	import mx.events.DynamicEvent;

	/**
	 * @author Andrew
	 */
	public interface IInterLevelDlg extends IEventDispatcher
	{
		function show(data:DynamicEvent, islands:Array) : void;
		//function hide(e:MouseEvent = null):void;
		//function saveParams(isl:int, loc:int):void;
	}
}
