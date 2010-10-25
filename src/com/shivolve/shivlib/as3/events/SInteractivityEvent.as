package com.shivolve.shivlib.as3.events
{
	import flash.events.Event;
	
	/**
	 * All the events for Activity in General
	 * 
	 * @author Gaurav Goel
	 * @version 0.2
	 */
	public class SInteractivityEvent extends Event
	{
		public var userChoice:Object = null;
		
		public var boolDropStatus:Boolean;
		public var objDrop:Object = null;
		
		public static const SELECT_CHOICE_EVENT:String = "onSelectChoice";				// For Multiple Choice		
		public static const CLICK_INACTIVE_EVENT:String = "onInactiveObjectClick";		// For ClicknDrop Acivity;		
		public static const DROP_OBJECT_EVENT:String = "onObjectDrop";					// For ClickDrop Acivity;
		public static const DROP_OBJECT_STATUS:String = "onDropObjectStatus"			// For ClickDrop Acivity;
		
		public static const ACTIVITY_START:String = 'onActivityStart';
		public static const ACTIVITY_END:String = 'onActivityEnd';
		
		public function WInteractivityEvent(type:String='', bubbles:Boolean = false, cancelable:Boolean = false) 
		{
			super(type, true);
		}
		override public function clone():Event
		{
			var eventType:String = '';
			if (this.type==WInteractivityEvent.ACTIVITY_START)
			{
				eventType = WInteractivityEvent.ACTIVITY_START;
			}else if (this.type == WInteractivityEvent.ACTIVITY_END)
			{
				eventType = WInteractivityEvent.ACTIVITY_END;
			}
			return new WInteractivityEvent (eventType);
		}
		
	}
	
}