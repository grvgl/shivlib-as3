package com.shivolve.shivlib.as3.audio 
{
	import com.shivolve.utils.audio.SAudio;
	/**
	 * ...
	 * @author Gaurav Goel
	 */
	public class SAudioPlayer 
	{
		private var _delay:Number;
		private var _preDelay:Boolean;
		private var _postDelay:Boolean;
		private var _volume:Number
		private var currentAudio:SAudio; //currently playing or last played Audio object
		public function SAudioPlayer() 
		{
			
		}
		
		public function get delay():Number { return _delay; }
		
		public function set delay(value:Number):void 
		{
			_delay = value;
		}
		
		public function get volume():Number { return _volume; }
			
		public function set volume(value:Number):void 
		{
			if ( value != undefined && value >= 0 && value <= 100)
			{
				_volume = value;
				currentAudio._soundVolume = _volume;
			}
		}
		
		public function get preDelay():Boolean { return _preDelay; }
		
		public function set preDelay(value:Boolean):void 
		{
			_preDelay = value;
		}
		
		public function get postDelay():Boolean { return _postDelay; }
		
		public function set postDelay(value:Boolean):void 
		{
			_postDelay = value;
		}

		public function playAudio(audioArray:Array, caller:Object, preDelay:Boolean, postDelay:Boolean):void 
		{
			SLog.debug("caller: " + caller, "Voiceover", "playAudio()");
			SLog.debug("audioArray: " + audioArray.toString(), "Voiceover", "playAudio()");
			 
			//check to see if a Sound object already exists.  if so, stop and clear it.
			if (currentAudio != undefined)
			{
				if (currentAudio.isPlaying)
				{
					currentAudio.stopAudio();
				}
				currentAudio.clearVO();
			}
			
			//delete the previous Vo object
			delete currentAudio;
		
			// allocate new Audio
			currentAudio = new SAudio(this, caller, audioArray, soundPath, soundVolume, delay, postDelay, delayTime, postDelayTime);
		}		

		/**
		 * Replay the last auido that was played.
		 */
		public function replayAudio()
		{
			//Logger.debug("Call readVO with "+ replay_array, "Voiceover", "replayVO()");
			if (currentAudio != undefined && !currentAudio.isPlaying)
			{
				//set the reading flag to true, so the Vo object can run again
				currentAudio.setReading(true);
				//calling preload here if the loop did not finish, else call play
				if (currentAudio.isLoading())
				{
					currentAudio.preload();
				} else 
				{
					currentAudio.playAudio();
				}
			}
		}	
	}
}
