package com.shivolve.shivlib.as3.media 
{
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundMixer;
	
	/**
	 * Media Manager for navigationView
	 * @author Gaurav Goel
	 * @version 0.1
	 */
	public class SNavMediaManager extends SMediaManager
	{
		
		private var _audioID:String = '';
		
		public function SNavMediaManager(name:String) :void
		{
			super(name);
		}
		
		/**
		 * Loads the audio files & assigns unique id for it
		 */
		override public function addLoadables():void
		{
			//this.mediaLoader.add('repeat.mp3', { id:"repeat" } );
			//this.mediaLoader.add('print.mp3', { id:"print" } );
			//this.mediaLoader.add('next.mp3', { id:"next" } );
			//this.mediaLoader.add('back.mp3', { id:"back" } );
			//this.mediaLoader.add('play_again.mp3', { id:"playAgain" } );
			//last call
			super.addLoadables();
		}
		
		/**
		 * Plays the audio for provided ID
		 * @param	audioId: string, audio to be play
		 */
		override public function playAudio(audioId:String = ''):void
		{
			SoundMixer.stopAll();
			this.audioID = audioId;
			var audio:Sound = this.mediaLoader.getSound(audioId);
			this.soundChannel = audio.play();
			this.soundChannel.addEventListener(Event.SOUND_COMPLETE,onAudioComplete);
		}		
		
		public function get audioID():String { return _audioID; }
		
		public function set audioID(value:String):void 
		{
			_audioID = value;
		}
	}		
}