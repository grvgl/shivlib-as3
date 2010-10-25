package com.shivolve.shivlib.as3.events
{
	import flash.events.Event;
	
	/**
	 * This class is responsible for Applicatoion Events 
	 * 
	 * @author Gaurav Goel
	 * @version 1.0
	 */
	public class SApplicationEvent extends Event
	{
		
		public static const DEFAULT = "default";
		public static const REGISTER = "register";
		public static const LOAD_START = "loadStart";
		public static const LOAD_COMPLETE = "loadComplete";
		public static const INIT = "init";
		public static const NEXT = "next";
		public static const BACK = "back";
		public static const RENDER = "render";
		public static const ADDED = "added";
		public static const REMOVED = "removed";
		public static const INACTIVE_STAGE = "inactiveStage";
		
		
		public function SApplicationEvent(type:String='', bubbles:Boolean = false, cancelable:Boolean = false) 
		{
			super(type,true);
		}
		
		override public function clone():Event
		{
			var eventType:String = '';
			
			switch(this.type)
			{
				case SApplicationEvent.REGISTER : 
					eventType = SApplicationEvent.REGISTER; 
					break;
				case SApplicationEvent.LOAD_START : 
					eventType = SApplicationEvent.LOAD_START; 
					break;
				case SApplicationEvent.LOAD_COMPLETE : 
					eventType = SApplicationEvent.LOAD_COMPLETE; 
					break;
				case SApplicationEvent.INIT : 
					eventType = SApplicationEvent.INIT; 
					break;
				case SApplicationEvent.NEXT : 
					eventType = SApplicationEvent.NEXT; 
					break;
				case SApplicationEvent.BACK : 
					eventType = SApplicationEvent.BACK; 
					break;
				case SApplicationEvent.RENDER : 
					eventType = SApplicationEvent.RENDER; 
					break;
				case SApplicationEvent.ADDED : 
					eventType = SApplicationEvent.ADDED; 
					break;
				case SApplicationEvent.REMOVED : 
					eventType = SApplicationEvent.REMOVED; 
					break;
				case SApplicationEvent.INACTIVESTAGE : 
					eventType = SApplicationEvent.INACTIVESTAGE; 
				break;
				default : 
					eventType = SApplicationEvent.DEFAULT;
				break;
			}
			
			return new SApplicationEvent (eventType);
		}
		
	}
	
}