package com.onlyplay.slotmatch3.services
{
	/**
	 * @author Design3d
	 */
	public interface ISlotService
	{
		function init() : void;

		function login( gameId:int ) : void;

		function makeHandShake() : void;

		//function enterLocation() : void;

		function spin(linesQuantity : int, betAmount : int) : void;

		function getUserData(gameId : int) : void;

		function enterRoom() : void;

		function dispatchLastProgressToAll(win : Number) : void;
	}
}
