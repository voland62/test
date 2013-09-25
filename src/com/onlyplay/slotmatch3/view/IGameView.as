package com.onlyplay.slotmatch3.view
{
	import flash.events.IEventDispatcher;
	/**
	 * @author Design3d
	 */
	public interface IGameView extends IEventDispatcher
	{	
		function get w():Number;
		function set w(val:Number):void;
		
		function get h():Number;

		function set h(val : Number) : void;

		function showSping(newState : Array) : void;

		//function drawLines(winLines : Array) : void;

		function setReady() : void;

		function setName(name : String) : void;

		function setExperinece(experience : int, level:int, leftVal:int, rightVal:int) : void;

		function setMoney(money : int) : void;

		//function updateConfig(serverConfig : ServerLocationConfigProtobuf) : void;
		
		function setMaxBet(maxBet:Number):void;

		function setUpperBet(getWholeBet : Number) : void;

		function setBetPerLine(betPerLine : Number) : void;

		function setLines(lines : Array, showLines:Boolean) : void;

		function setWin(win : Number) : void;

		function setCurrenMoney(currentMoney : int) : void;
		
		
		// it will be removed to list/chat view
		function setPlayers(players : Array) : void;

		function updatePlayerFromList(index : int, newPlayerState : Object) : void;

		function setProgress(lastProgress : int, targetProgress : int) : void;
		
		function setSlotState():void
		
		function setMatchState() : void
		
		function matchReinit( iconEnergy:Number ):void

		function setMatchCurrentTime(matchCurrentTime : Number) : void;

		function setMatchMaxTime(maxTime : Number) : void

		function playWinAnimation(win : Number, winLines:Array, onWinAnimComeplete : Function) : void;

		function setStarsProgress(commonPercentage : Number) : void;

		function initSlot(islandId : int, locationId : int) : void;

		function hideLines() : void;

		function playBooster(boosterType : int) : void;

		function setMatchCurrentFlashEnergy(currentFlashEnergy : Number, maxFlashEnergy : Number, multiplier:Number, state:int) : void;

		function initFlashEnergy(multiplier : Number) : void;
		
		
		
	}
}
