package com.shivolve.shivlib.as3.events
{
	import flash.events.Event;
	/**
	 * ...
	 * @author Gaurav Goel
	 */
	public class SVideoEvent extends Event
	{
		
		public static const VIDEO_COMPLETE_EVENT:String = 'videoCompleteEvent';
		public function SVideoEvent(type:String='', bubbles:Boolean = false, cancelable:Boolean = false) 
		{
			super(type, true);
		}
		override public function clone():Event
		{
			var eventType:String = '';
			if (this.type == WVideoEvent.VIDEO_COMPLETE_EVENT) 
			{
				eventType = WVideoEvent.VIDEO_COMPLETE_EVENT;
			}
			return new WVideoEvent (eventType);
		}
	}
}