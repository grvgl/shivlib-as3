package com.shivolve.shivlib.as3.audio
{
	import flash.events.EventDispatcher;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	import flash.errors.IOError;
	import com.shivolve.shivlib.as3.loading.SLoader;
	
	public class AudioController extends EventDispatcher
	{
		private var _soundChannel:SoundChannel = null;
		private var sound:Sound = null;
		private var _sLoader:SLoader = null;
		public static const ALL_AUDIO_LOAD_EVENT:String = "allAudioLoadSuccessEvent";
		public static const AUDIO_COMPLETE_EVENT:String = "audioCompleteEvent";
		
		public function AudioController() 
		{
			initialize();
		}
		public function initialize():void
		{
			audioLoader = new SLoader('main-module');
		}
		
		/**
		 * Individual modules override this method to add and then load their audio.
		 * This checks for all the audios in this module to be loaded and once compelted fire up the complete event
		 */
		public function addLoadables():void {
			audioLoader.addEventListener(SLoader.COMPLETE, onAllAudioLoad);
			audioLoader.start();
		}
		
		private function onAllAudioLoad(e:Event):void 
		{
			var audioLoadEvent:Event = new Event(AudioController.ALL_AUDIO_LOAD_EVENT, true, false);
			dispatchEvent(audioLoadEvent);
		}
		
		/**
		 * Individual Audio Controllers override this method.
		 * @param	audioId
		 */
		public function playAudio(audioId:String = ""):void
		{
			/*
			var audio:Sound = this.audioLoader.getSound(audioId);
			this.soundChannel = audio.play();
			this.soundChannel.addEventListener(Event.SOUND_COMPLETE,onAudioComplete);
			*/
		}
		
		private function playSound(soundURI:String):void {
			//Debug.log(' : playSound : '+soundURI);
			var req:URLRequest = new URLRequest(soundURI);
			sound = new Sound();
			sound.addEventListener(Event.COMPLETE, completeHandler);
            sound.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
            sound.load(req);
		}
		
		public function onAudioComplete(e:Event):void 
		{
			//Debug.log(' onAudioComplete : ' + 'TODO: Play the synch audio if any');
			var eAudio:Event = new Event(AudioController.AUDIO_COMPLETE_EVENT, true);
			dispatchEvent(eAudio);
		}
		
		private function ioErrorHandler(e:IOErrorEvent):void 
		{
			//SLogger.info(String(this)+e.toString());
		}
		
		private function completeHandler(e:Event):void 
		{
			//trace(this, "completeHandler: ", e);
			this.soundChannel = this.sound.play();
			this.soundChannel.addEventListener(Event.SOUND_COMPLETE, onAudioComplete);
		}
		
		/**
		 * TODO : comment
		 */
		public function get audioLoader():SLoader { return _sLoader; }
		
		public function set audioLoader(value:SLoader):void 
		{
			_sLoader = value;
		}
		
		
		/**
		 * TODO : comment
		 */
		public function get soundChannel():SoundChannel { return _soundChannel; }
		
		public function set soundChannel(value:SoundChannel):void 
		{
			_soundChannel = value;
		}	
	}
}