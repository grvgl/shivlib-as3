package com.shivolve.shivlib.as3.media 
{

	import com.shivolve.shivlib.as3.loading.SLoader;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.media.SoundChannel;
	import flash.media.SoundMixer;
	import flash.media.Video;

	public class SMediaManager extends EventDispatcher {

		private var _loaderIdName:String = "";
		private var _sLoader:SLoader = null;
		private var _soundChannel:SoundChannel = null;
		private var _video:Video = null;
		
		public function SMediaManager(loaderId:String = "main-module")
		{
			this.loaderIdName = loaderId;
			this.init();
		}
		
		/**
		 * Makes a new instance of the SLoader with the id string passed in to constructor
		 */
		public function init():void
		{
			this.mediaLoader = new SLoader(this.loaderIdName);
		}
		/**
		 * This should be overridden by individual modules to add their specific audios
		 * This checks for all the audios in this module to be loaded and once compelted fire up the complete event
		 */
		public function addLoadables():void 
		{
			this.mediaLoader.addEventListener(SLoader.COMPLETE, onAllMediaLoad);
			// Start loading
			this.mediaLoader.start();
		}
		/**
		 * Dispatches an "SAudioEvent.ALL_AUDIO_LOAD_EVENT" onces all the audios are loaded.
		 * @param	e : gets a generic event
		 */
		private function onAllMediaLoad(e:Event):void 
		{
			this.video = new Video();
			var audioLoadEvent:Event = new SAudioEvent(SAudioEvent.ALL_AUDIO_LOAD_EVENT, true, false);
			this.dispatchEvent(audioLoadEvent);
		}
		/**
		 * This has to be overridden by the individual mediaManager
		 * @param	audioId
		 */
		public function playAudio(audioId:String = ''):void
		{
		}
		/**
		 * This has to be overridden by the individual mediaManager
		 * @param	videoID
		 */
		public function playVideo(videoID:String = ''):void 
		{
		
		}
		/**
		 * Dispatches an audio compelte event
		 * @param	e : gets a generic event
		 */
		public function onAudioComplete(e:Event):void 
		{
			var eAudio:Event = new Event(SAudioEvent.AUDIO_COMPLETE_EVENT, true);
			this.dispatchEvent(eAudio);
		}
		/**
		 * Stops all the sounds
		 */
		public function stopSounds():void
		{
			SoundMixer.stopAll();
		}
		/**
		 * Stops the sound playing in the general audio channel
		 */
		public function stopSounds():void
		{
			this.soundChannel.stop();
		}
		/**
		 * Getter for audio loader
		 * @return SLoader
		 */
		public function get mediaLoader():SLoader { return _sLoader; }
		/**
		 * Setter for audio loader
		 * @param value is a SLoader instance
		 */
		public function set mediaLoader(value:SLoader):void 
		{
			_sLoader = value;
		}		
		public function get loaderIdName():String { return _loaderIdName; }
		
		public function set loaderIdName(value:String):void 
		{
			_loaderIdName = value;
		}
		
		public function get soundChannel():SoundChannel { return _soundChannel; }
		
		public function set soundChannel(value:SoundChannel):void 
		{
			_soundChannel = value;
		}
		
		public function get video():Video { return _video; }
		
		public function set video(value:Video):void 
		{
			_video = value;
		}
	}
}