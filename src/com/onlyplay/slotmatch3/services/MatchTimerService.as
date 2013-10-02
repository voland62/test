package com.onlyplay.slotmatch3.services
{
	import mx.events.DynamicEvent;
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.utils.getTimer;
	import com.onlyplay.slotmatch3.model.MatchGameModel;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	/**
	 * @author Andrew
	 */
	public class MatchTimerService
	{
		private const _timer : Timer = new Timer(10);
		
		[Inject]
		public var eventDispatcher:IEventDispatcher;
		
		[Inject]
		public var model:MatchGameModel;
		private var _timeOffset : int;
		
		public function MatchTimerService()
		{
			//_timer.delay = 10;
			
			_timer.addEventListener(TimerEvent.TIMER, tick);
		}

		private function tick(e : TimerEvent) : void
		{
			var timeProceed:Number = getTimer() - _timeOffset;
			var newTime:Number =  model.startTime - timeProceed * 0.001;
			
			if (newTime <= 0)
			{
				newTime = 0;
				//model.currentTime = newTime;
				_timer.stop();
				var event:DynamicEvent = new DynamicEvent("timerFinish");
				eventDispatcher.dispatchEvent( event );
			}
			model.currentTime = newTime;
			eventDispatcher.dispatchEvent(new Event("matchTimerTick"));
		}

		
		public function start() : void
		{
			_timeOffset = getTimer();
			_timer.start();
		}

		public function pause() : void
		{
			_timeOffset = getTimer() - _timeOffset;
			_timer.stop();
		}
		
		public function resume():void
		{
			_timeOffset = getTimer() - _timeOffset;
			_timer.start();
		}
	}
}
