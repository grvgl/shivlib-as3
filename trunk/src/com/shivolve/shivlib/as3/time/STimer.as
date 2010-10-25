package com.shivolve.shivlib.as3.time
{
	import flash.events.TimerEvent;
	
	/**
	 * This class creates Timer and perform all activities of Time like Pause, Resume, Reset, Dispose etc.
	 * @version 0.1
	 */
	public class STimer 
	{
		private var _interval:Interval;
		private var _waitInterval:Interval;
		public function STimer ()
		{
				super(1000, 1, null, null);
				destroy();
		}
		
		/**
		 * Creates timer  
		 * 
		 * @param 	delay       The number of milliseconds to wait before calling the callback function.
		 * @param 	callback    The function to call after delay time.
		 * @param 	count		Number of times the callback function call
		 * @param 	args        Optional.  An array of arguments to pass to the callback function.
		 */
		public function create(delay:Number, callback:Function, count:int, args:Array ):void
		{
			this._interval = Interval.setInterval(this._check, delay,callback);
			this._interval.repeatCount = count;
			this._interval.start();
			
			if (count > 0) 
			{
				this._interval.addEventListener(TimerEvent.TIMER_COMPLETE,function(e:TimerEvent):void
				{
					destroy();	
				});
			}
		}
		
		/**
		 * callback function  
		 * 
		 * @param 	callback    It calls back the callback function
		 * 
		 */
		public function _check(callback):void
		{
			callback.apply(null);
		}
		
		/**
		* Pauses all timers currently running that were created by this factory.
		*/
		public function pause():void 
		{
			this._interval.stop();
		}
		
		/**
		 * Waits for the specified delay time before calling a callback function.
		 * 
		 * @param 	delay       The number of milliseconds to wait before calling the callback function.
		 * @param 	callback    The function to call after delay time.
		 * @param 	args        Optional.  An array of arguments to pass to the callback function.
		 */
		public function wait(delay:Number,callback:Function,args:Array):void
		{
			this._waitInterval = Interval.setInterval(this._waitFunction, delay);
			this._waitInterval.repeatCount = 1;
			this._waitInterval.start();
			this._waitInterval.addEventListener(TimerEvent.TIMER_COMPLETE,
				function(e:TimerEvent):void
				{
					destroy();
					callback.apply(null, args);
				});
				
		}
		
		public function _waitFunction():void
		{
			//trace("In _waitFunction()");	
		}
		
		/**
        * Resumes all paused timers.
        */
		public function resume():void
		{
			this._interval.start();
		}
		
		/**
        * Resets timers and currentCount is set to 0.
        */
		public function resetTimer():void
		{
			this._interval.reset();
			this._interval.start();
		}
		
		/**
        *  @return int	Current count, the number of times the timer runs
		*/
		public function getCurrentCount():int
		{
			return this._interval.currentCount;
		}
		
		/**
		 * Disposes all active timers created.
		 */
		public function dispose():void
		{
			this._interval.destroy();
		}
	}	
}