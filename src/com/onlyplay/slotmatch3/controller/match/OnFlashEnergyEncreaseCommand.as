package com.onlyplay.slotmatch3.controller.match
{
	import flash.events.Event;

	import com.greensock.TweenLite;

	import robotlegs.bender.bundles.mvcs.Command;

	import com.onlyplay.slotmatch3.model.GameModel;
	import com.onlyplay.slotmatch3.model.MatchGameModel;
	import com.onlyplay.slotmatch3.services.MatchEnergyFallingService;

	import mx.events.DynamicEvent;

	import flash.events.IEventDispatcher;

	/**
	 * @author Andrew
	 */
	public class OnFlashEnergyEncreaseCommand extends Command
	{
		[Inject]
		public var model : MatchGameModel;
		[Inject]
		public var gameModel : GameModel;
		[Inject]
		public var eventDispatcher : IEventDispatcher;
		[Inject]
		public var e : DynamicEvent;
		[Inject]
		public var matchFlashEnergyService : MatchEnergyFallingService;

		override public function execute() : void
		{
			/**
			 * 
			 * 
			 * TODO: рассмотреть реализацию по паттерту StateMashine
			 * 
			 * тут просто сама модель матч прогресса имеет состояния - так вот вычленить её отдельно и реализовать 
			 * по паттерну StateMashine - вообще её максимально изолировать от всего остального
			 * 
			 * 
			 * 
			 * TODO: добавить влияние амулета
			 * 
			 */

			// log("OnFlashEnergyEncreaseCommand.execute()");

			switch( model.flashEnergyState )
			{
				case MatchGameModel.FLASH_ENERGY_NORM:
					processEnergyAdding();
					break;
				case MatchGameModel.FLASH_ENERGY_FREEZE:
					processEnergyAdding();
					break;
				case MatchGameModel.FLASH_ENERGY_FULL:
					// Подумать что здесь происходит
					break;
				default:
			}

			startTimer();
		}

		private function startTimer() : void
		{
			/*
			 * TODO: этот свитч - убрать - это только для демонстрации того как здесь напрашивается стейт машина
			 */
			switch( model.flashEnergyState )
			{
				case MatchGameModel.FLASH_ENERGY_NORM:
					// log("-----OnFlashEnergyEncreaseCommand.startTimer()");
					eventDispatcher.dispatchEvent(new Event("currentFlashEnergyChanged"));
					matchFlashEnergyService.start();
					break;
				case MatchGameModel.FLASH_ENERGY_FREEZE:
					eventDispatcher.dispatchEvent(new Event("currentFlashEnergyChanged"));
					break;
				case MatchGameModel.FLASH_ENERGY_FULL:
					break;
				default:
			}
		}

		private function processEnergyAdding() : void
		{
			// никогда не будет выполнено
			// if ( model.flashEnergyState == MatchGameModel.FLASH_ENERGY_FULL )
			// {
			// return;
			// }

			var value : Number = e.val;

			// log('value: ' + (value));
			var newEnergyValue : Number = model.currentFlashEnergy + value;
			trace('newEnergyValue: ' + (newEnergyValue));
			if ( newEnergyValue > model.currentLevel.energy )
			{
				var index : int = model.matchModelProto.levels.indexOf(model.currentLevel);
				if ( index >= model.matchModelProto.levels.length )
				{
					// остаёмся на максимальном уровне
					model.flashEnergyState = MatchGameModel.FLASH_ENERGY_FULL;
					// пока не знаю как реагировать на это событие
					eventDispatcher.dispatchEvent(new Event("flashEnergyStateChanged"));
				}
				else
				{
					// переходим на следующий уровень
					var reminder : Number = newEnergyValue - model.currentLevel.energy ;
					model.currentLevel = model.matchModelProto.levels[ index + 1];
					model.currentFlashEnergy = reminder;
				}
			}
			else
			{
				// нормальная ситуация - мы на прежнем уровне и не делается перехода на следующий уровень
				model.currentFlashEnergy = newEnergyValue;
			}

			// переводим во фриз если на тек.уровне скорость падения ноль
			if (model.flashEnergyState != MatchGameModel.FLASH_ENERGY_FULL)
			{
				//log ('model.currentLevel.energyFallPerSecond: ' + (model.currentLevel.energyFallPerSecond));
				if (  model.currentLevel.energyFallPerSecond == 0 )
				{
					model.flashEnergyState = MatchGameModel.FLASH_ENERGY_FREEZE;
				}
				else
				{
					model.flashEnergyState = MatchGameModel.FLASH_ENERGY_NORM;
				}
			}
		}
	}
}
