package com.shivolve.shivlib.as3.events 
{
	import flash.events.Event;
	/**
	 * ...
	 * @author Gaurav Goel
	 */
	public class SIdleEvent extends Event
	{
		public static const IDLE:String  = 'idle';
		public static const ACTIVE:String = 'active';
		protected var _milliseconds:uint;		
		public function SIdleEvent(type:String='', bubbles:Boolean = false, cancelable:Boolean = false) 
		{
			super(type, bubbles, cancelable);
		}
		/**
		 * 
		 * @return Create a clone of the Flash Event.
		 */
		override public function clone():Event
		{
			var eventType:String = '';
			if (this.type == SIdleEvent.IDLE) 
			{
				eventType = SIdleEvent.IDLE;
			}
			else if (this.type == SIdleEvent.ACTIVE) 
			{
				eventType = SIdleEvent.ACTIVE;
			}
			return new SIdleEvent(eventType);
		}
		/**
		 * Duration an user has been idle.
		 */
		public function get milliseconds():uint { return _milliseconds; }
		
		public function set milliseconds(value:uint):void 
		{
			_milliseconds = value;
		}
		
		/**
		 * 
		 * @return Returns a string containing all the properties of the InactiveEvent object.
		 */
		override public function toString():String 
		{
			return formatToString('SIdleEvent', 'type', 'bubbles', 'cancelable', 'milliseconds');
		}		
		
	}
	
}