package com.shivolve.shivlib.as3.events
{
	import flash.events.Event;
	
	/**
	 * This class is responsible for Navigation Events 
	 * 
	 * @author Gaurav Goel
	 * @version 0.1
	 */	
	public class SNavigationEvent extends Event
	{
		public static const PRINT_CLICK:String = 'printClick';
		public static const REPEAT_CLICK:String = 'repeatClick';
		public static const NEXT_CLICK:String = 'nextClick';
		public static const BACK_CLICK:String = 'backClick';
		public static const READ_CLICK:String = 'readClick';
		
		public function SNavigationEvent(type:String='', bubbles:Boolean = false, cancelable:Boolean = false) 
		{
			super(type, true);
		}
		
		override public function clone():Event
		{
			var eventType:String = '';
			if (this.type==WNavigationEvent.PRINT_CLICK)
			{
				eventType = WNavigationEvent.PRINT_CLICK;
			}
			else if (this.type == WNavigationEvent.BACK_CLICK)
			{
				eventType = WNavigationEvent.BACK_CLICK;
			}
			else if (this.type == WNavigationEvent.NEXT_CLICK)
			{
				eventType = WNavigationEvent.NEXT_CLICK;
			}
			else if (this.type == WNavigationEvent.REPEAT_CLICK)
			{
				eventType = WNavigationEvent.REPEAT_CLICK;
			}
			else if (this.type == WNavigationEvent.READ_CLICK)
			{
				eventType = WNavigationEvent.READ_CLICK;
			}
			return new WNavigationEvent (eventType);
		}
		
	}
	
}