package com.shivolve.shivlib.as3.audio
{
	import com.shivolve.utils.audio.SAudioPlayer;
	/**
	 * ...
	 * @author Gaurav Goel
	 */
	public class SAudio 
	{
		private var _id:String;
		private var _isPlaying:Boolean = false;
		private var _soundVolume:Number = null;
		private var _soundArray:Array = null; // Flash Sound object array
		private var soundPosition:Number;
		private var _caller:Object;
		private var _audioPlayer:SAudioPlayer;
		private var playindex:Number; // index of sounds to play
	
		public function SAudio(audioPlayer:SAudioPlayer, caller:Object, soundArray:Array, id:String, vol:Number, preDelay:Boolean, postDelay:Boolean, preDelayTime:Number, postDelayTime:Number) 
		{
			this._audioPlayer = audioPlayer;
			this._caller = caller;
			this._soundArray = soundArray;
			this.soundVolume = vol;
			this._id = id;
		}
		
		public function playAudio()
		{
			var thisVo:Vo = this;
			clearInterval(this.delayAudio);
			//Logger.debug("at index: "+ this + " and " + playindex, "Vo", "playAudio()");
			if(playindex < loadedFileIndex && reading)
			{
				//play the next file
				//Logger.debug("play file", "Vo", "playAudio()");
				//Logger.debug(_global.soundHolder[playindex].myName, "Vo", "playAudio()");
				var _sound = this.soundArray[playindex];
				_sound.onSoundComplete = onSoundCompleteX;
				// if delay in read
				_sound.start();
				playindex++;
			}
			else
			{
				//done playing the sound objects
				//Logger.debug("Finished VO", "Vo", "playAudio()");
				playindex = 0;
				if( !reading || !postDelay)
				{
					finishAudio();
				}
				else
				{
					this.delayAudio = setInterval(this, "finishAudio", postDelayTime);
				}			
			}	
		}

		
		// notify the AudioPlayer that we are done reading the vo
		private function finishAudio()
		{
			reading = false;
			clearInterval(this.delayAudio);
			voT.finishAudio(caller);
		}		
		
		public function clearAudio():void
		{
			for(var x in this._soundArray)
			{
				this._soundArray[x].stop();
				delete this._soundArray[x];
			}
			//the soundArray is left as a valid reference here in case this Vo is replayed
		}
			
		/**
		 * set reading to false.. and the vo will no longer play sound
		 */
		public function stopAudio(dontFinish:Boolean):void
		{
			clearInterval(this.delayAudio);
			if(reading)
			{
				this.reading = false;
				for(var x in this.soundArray)
				{
					this.soundArray[x].stop();
				}
			
				if(!dontFinish)
				{
					finishAudio();
				}
			}
		}

		public function get isPlaying():Boolean { return _isPlaying; }
		
		public function set isPlaying(value:Boolean):void 
		{
			_isPlaying = value;
		}

		/**
		 * Volume setting
		 */
		public function get soundVolume():Number { return _soundVolume; }
		
		public function set soundVolume(value:Number):void 
		{
			_soundVolume = value;
			for( var i in _soundArray )
			{
				_soundArray[i]._volume = soundVolume;
			}
		}
		
		public function get soundArray():Array { return _soundArray; }
		
		public function set soundArray(value:Array):void 
		{
			_soundArray = value;
		}
		
		public function get id():String { return _id; }
		
		public function set id(value:String):void 
		{
			_id = value;
		}
		
		public function get caller():Object { return _caller; }
		
		public function set caller(value:Object):void 
		{
			_caller = value;
		}
		
		public function get audioPlayer():SAudioPlayer { return _audioPlayer; }
		
		public function set audioPlayer(value:SAudioPlayer):void 
		{
			_audioPlayer = value;
		}
		
		public function getSoundPosition():Number 
		{ 
			
			var soundPosition:Number = 0;
			if(isPlaying && soundArray[playindex - 1] != undefined)
			{
				soundPosition = soundArray[playindex - 1].position;
			}
			return soundPosition; 
		}
		
	}
	
}