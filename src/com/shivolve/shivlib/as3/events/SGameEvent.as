package com.shivolve.shivlib.as3.events
{
	import flash.events.Event;

	/**
	 * All the events for Game Activity are define in this class
	 * 
	 * @author Gaurav Goel
	 * @version 0.1
	 */
	public class SGameEvent extends Event 
	{
		// This Event will be dispatched when user start game.
		public static const START_GAME_EVENT:String = 'startEvent';
		// This Event will be dispatched when user stop game.
		public static const STOP_GAME_EVENT:String='stopGameEvent';
		// This Event will be dispatched when user take help.
		public static const HELP_EVENT:String = 'helpEvent';
		// This Event will be dispatched when user play game on easy_level.
		public static const EASY_LEVEL_EVENT:String = 'easyLevelEvent';
		// This Event will be dispatched when user play game on medium_level.
		public static const MEDIUM_LEVEL_EVENT:String = 'mediumLevelEvent';
		// This Event will be dispatched when user play game on hard_level.		
		public static const HARD_LEVEL_EVENT:String = 'hardLevelEvent';
		// This Event will be dispatched when game is ready to play.
		public static const GAME_READY_EVENT:String = 'gameReadyEvent';
		// This Event will be dispatched when score is update.
		public static const SCORE_UPDATE_EVENT:String = 'scoreUpdateEvent';
		// This Event will be dispatched when user replay game.
		public static const REPLAY_GAME_EVENT:String = 'replayGameEvent';
		// This Event will be dispatched when user input is correct.
		public static const CORRECT_INPUT_EVENT:String = 'correctInputEvent';
		// This Event will be dispatched when user input is wrong.
		public static const WRONG_INPUT_EVENT:String = 'wrongInputEvent';
		
		public function SGameEvent(type:String = '', bubbles:Boolean = false, cancelable:Boolean = false) 
		{
			super(type, true);
		}
		override public function clone():Event 
		{
			var eventType:String='';
			if (this.type == SGameEvent.START_GAME_EVENT) 
			{
				eventType=SGameEvent.START_GAME_EVENT;
			} 
			else if (this.type == SGameEvent.STOP_GAME_EVENT) 
			{
				eventType=SGameEvent.STOP_GAME_EVENT;
			} 
			else if (this.type == SGameEvent.HELP_EVENT) 
			{
				eventType=SGameEvent.HELP_EVENT;
			} 
			else if (this.type == SGameEvent.EASY_LEVEL_EVENT) 
			{
				eventType=SGameEvent.EASY_LEVEL_EVENT;
			}
			else if (this.type == SGameEvent.MEDIUM_LEVEL_EVENT) 
			{
				eventType=SGameEvent.MEDIUM_LEVEL_EVENT;
			} 
			else if (this.type == SGameEvent.HARD_LEVEL_EVENT) 
			{
				eventType=SGameEvent.HARD_LEVEL_EVENT;
			} 
			else if (this.type == SGameEvent.GAME_READY_EVENT) 
			{
				eventType=SGameEvent.GAME_READY_EVENT;
			}
			else if (this.type == SGameEvent.SCORE_UPDATE_EVENT) 
			{
				eventType=SGameEvent.SCORE_UPDATE_EVENT;
			}
			else if (this.type == SGameEvent.REPLAY_GAME_EVENT) 
			{
				eventType=SGameEvent.REPLAY_GAME_EVENT;
			}
			else if (this.type == SGameEvent.CORRECT_ANSWER_EVENT) 
			{
				eventType=SGameEvent.CORRECT_ANSWER_EVENT;
			}
			else if (this.type == SGameEvent.WRONG_ANSWER_EVENT) 
			{
				eventType=SGameEvent.WRONG_ANSWER_EVENT;
			}
			return new SGameEvent(eventType);
		}

	}
}