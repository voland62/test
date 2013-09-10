package com.onlyplay.slotmatch3.services
{
	import com.onlyplay.slotmatch3.model.BoosterVO;
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.utils.getTimer;
	import com.onlyplay.slotmatch3.model.MatchGameModel;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	/**
	 * @author Andrew
	 */
	public class BoosterTimerService
	{
		private const _timer : Timer = new Timer(10);
		
		[Inject]
		public var eventDispatcher:IEventDispatcher;
		
		[Inject]
		public var model:MatchGameModel;
		private var _timeOffset : int;
		
		public function BoosterTimerService ()
		{
			//_timer.delay = 10;
			
			_timer.addEventListener(TimerEvent.TIMER, tick);
		}

		private function tick(e : TimerEvent) : void
		{
			
			
			var timeProceedInSeconds:Number = (getTimer() - _timeOffset) * 0.001;
			var newEnergy:Number = timeProceedInSeconds * model.matchModelProto.boosterEnergyGrowthPerSecond;
			//trace('newEnergy: ' + (newEnergy));
			
			
			//trace('model.matchModelProto.boosterEnergy: ' + (model.matchModelProto.boosterEnergy));
			if (newEnergy >= model.matchModelProto.boosterEnergy)
			{
				newEnergy = model.matchModelProto.boosterEnergy;
				//model.currentTime = newTime;
				_timer.stop();
				eventDispatcher.dispatchEvent(new Event("boosterTimerFinish"));
			}
			
			checkBoosterAva();
			
			model.currentBoostersCharge = newEnergy;
			eventDispatcher.dispatchEvent(new Event("boosterTimerTick"));
		}

		private function checkBoosterAva() : void
		{
			for each (var booster: BoosterVO in model.boosters) 
			{
				booster.availible =  model.currentBoostersCharge >= booster.maxEnergy;				
			}
		}

		
		public function start() : void
		{
			_timeOffset = getTimer();
			_timer.start();
		}
	}
}
