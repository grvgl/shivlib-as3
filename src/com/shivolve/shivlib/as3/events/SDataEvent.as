package com.shivolve.shivlib.as3.events
{
	import flash.events.Event;
	
	/**
	 * All the Data events for Activity are defined in this class
	 * 
	 * @author Gaurav Goel
	 * @version 0.1
	 */
	
	public class SDataEvent extends Event 
	{
		//private var _sessionVO:SessionVO=null;
		// This Event will be dispatched when data is ready.
		public static const DATA_READY_EVENT:String='dataReadyEvent';
		// This Event will be dispatched when use starts input data.
		public static const USER_INPUT_EVENT:String = 'userInputEvent';
		// This Event will be dispatched when  print data is ready.
		public static const PRINT_DATA_EVENT:String = 'printDataEvent';
		// This Event will be dispatched when  data is saved in memory.
		public static const SAVE_DATA_EVENT:String = 'saveDataEvent';
		// This Event will be dispatched data is dispaly on screen.
		public static const DISPLAY_DATA_EVENT:String = 'displayDataEvent';
		// This Event will be dispatched when user clear data from memory.
		public static const CLEAR_DATA_EVENT:String = 'clearEataEvent';
		
		public function SDataEvent(type:String = '', bubbles:Boolean = false, cancelable:Boolean = false) 
		{
			super(type, true);
		}
		override public function clone():Event 
		{
			var eventType:String='';
			if (this.type == SDataEvent.DATA_READY_EVENT) 
			{
				eventType=SDataEvent.DATA_READY_EVENT;
			} 
			else if (this.type == SDataEvent.PRINT_DATA_EVENT) 
			{
				eventType=SDataEvent.PRINT_DATA_EVENT;
			} 
			else if (this.type == SDataEvent.SAVE_DATA_EVENT) 
			{
				eventType=SDataEvent.SAVE_DATA_EVENT;
			} 
			else if (this.type == SDataEvent.DISPLAY_DATA_EVENT) 
			{
				eventType=SDataEvent.DISPLAY_DATA_EVENT;
			} 
			else if (this.type == SDataEvent.CLEAR_DATA_EVENT) 
			{
				eventType=SDataEvent.CLEAR_DATA_EVENT;
			}
			return new SDataEvent (eventType);
		}
/*
		public function get sessionVO():SessionVO
		{
			return _sessionVO;
		}

		public function set sessionVO(v:SessionVO):void
		{
			_sessionVO = v;
		}
*/
	}
}