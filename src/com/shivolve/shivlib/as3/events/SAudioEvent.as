package com.shivolve.shivlib.as3.events
{
	import flash.events.Event;
	
	/**
	 * @author Gaurav Goel
	 */
	public class SAudioEvent extends Event
	{
		public static const LOAD_AUDIO_EVENT:String = 'loadAudioEvent';
		public static const ALL_AUDIO_LOAD_EVENT:String = 'allAudioLoadEvent';
		public static const AUDIO_COMPLETE_EVENT:String = 'audioCompleteEvent';
		public function SAudioEvent(type:String='', bubbles:Boolean = false, cancelable:Boolean = false) 
		{
			super(type, true);
		}
		override public function clone():Event
		{
			var eventType:String = '';
			if (this.type == SAudioEvent.LOAD_AUDIO_EVENT) 
			{
				eventType = SAudioEvent.LOAD_AUDIO_EVENT;
			}
			else if (this.type == SAudioEvent.AUDIO_COMPLETE_EVENT) 
			{
				eventType = SAudioEvent.AUDIO_COMPLETE_EVENT;
			}
			else if (this.type == SAudioEvent.ALL_AUDIO_LOAD_EVENT) 
			{
				eventType = SAudioEvent.ALL_AUDIO_LOAD_EVENT;
			}
			return new SAudioEvent(eventType);
		}
	
	}
}