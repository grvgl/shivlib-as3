package com.shivolve.shivlib.as3.events
{
	import flash.events.Event;
	
	/**
	 * Event class for SLoader
	 * @author Gaurav Goel
	 */	
	public class SLoaderEvent extends Event
	{
		public static const LOAD_COMPLETE:String = "loadComplete";
		public static const LOAD_ERROR:String = "loadError";
		
		public function SLoaderEvent(type:String="", bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, true, cancelable);
		}
		
		public override function clone() : Event
		{
			var eventType:String = '';
			
			if (this.type==SLoaderEvent.LOAD_COMPLETE)
			{
				eventType = SLoaderEvent.LOAD_COMPLETE;
			}
			else if (this.type == SLoaderEvent.LOAD_ERROR)
			{
				eventType = SLoaderEvent.LOAD_ERROR;
			}
			return new SLoaderEvent(eventType);
		}
	}
}