package com.onlyplay.slotmatch3.services
{
	import com.greensock.TweenLite;

	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.utils.getTimer;

	import com.onlyplay.slotmatch3.model.MatchGameModel;

	import flash.events.TimerEvent;
	import flash.utils.Timer;

	/**
	 * @author Andrew
	 */
	public class MatchEnergyFallingService
	{
		private const _timer : Timer = new Timer(10);
		[Inject]
		public var eventDispatcher : IEventDispatcher;
		[Inject]
		public var model : MatchGameModel;
		private var _timeOffset : int;
		private var _startEnergy : Number = 0;

		public function MatchEnergyFallingService()
		{
			// _timer.delay = 10;

			_timer.addEventListener(TimerEvent.TIMER, tick);
		}

		private function tick(e : TimerEvent) : void
		{
			var timeProceedInSeconds : Number = ( getTimer() - _timeOffset ) * 0.001;
			// trace('timeProceedInSeconds: ' + (timeProceedInSeconds));
			// var newTime:Number =  model.startTime - timeProceed * 0.001;
			var newEnergy : Number = _startEnergy - timeProceedInSeconds * model.currentLevel.energyFallPerSecond;
			// trace('newEnergy: ' + (newEnergy));

			if (newEnergy <= 0)
			{
				newEnergy = 0;
				// model.currentTime = newTime;
				_timer.stop();
				eventDispatcher.dispatchEvent(new Event("flashTimerFinish"));
			}
			model.currentFlashEnergy = newEnergy;
			eventDispatcher.dispatchEvent(new Event("currentFlashEnergyChanged"));
		}

		public function start() : void
		{
			_timer.reset();
			TweenLite.killDelayedCallsTo(realStart);
			TweenLite.delayedCall(1, realStart);
		}

		private function realStart() : void
		{
			_startEnergy = model.currentFlashEnergy;
			// trace('model.currentFlashEnergy: ' + (model.currentFlashEnergy));
			_timeOffset = getTimer();
			_timer.start();
		}

		public function pause() : void
		{
			_timeOffset = getTimer() - _timeOffset;
			_timer.stop();
		}

		public function resume() : void
		{
			_timeOffset = getTimer() - _timeOffset;
			_timer.start();
		}
	}
}
