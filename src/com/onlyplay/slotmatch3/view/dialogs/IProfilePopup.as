package com.onlyplay.slotmatch3.view.dialogs
{
	import flash.events.IEventDispatcher;

	/**
	 * @author Andrew
	 */
	public interface IProfilePopup extends IEventDispatcher
	{
		function setName(name : String) : void;

		function setMoney(money : int) : void;

		function setLevel(level : int) : void;

		function setExperience(experience : int, experienceBound : int) : void;

		function setStatistics(maxWin : int, boostersUsed : int, friendsAmount : int, giftsReceived : int, giftsSended : int) : void;
		
		
		
	}
}
