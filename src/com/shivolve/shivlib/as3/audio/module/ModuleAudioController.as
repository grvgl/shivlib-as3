package com.shivolve.shivlib.as3.audio.module 
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.events.Event;
	import com.shivolve.shivlib.as3.audio.AudioController;

	public class ModuleAudioController extends AudioController
	{
		public var audioID:int;
		public var audioStr:String;
		private var audio:Sound;
		public var pausePosition:int;
		public static var POSITION_CHANGE:String = "positionChange";
		public function ModuleAudioController() 
		{

			//last call
			super();
		}
		override public function addLoadables():void
		{
			audioLoader.add('assets/audio/moduleName/moduleName1.mp3',{id:"1"});
			audioLoader.add('assets/audio/moduleName/moduleName2.mp3', { id:"2" } );
			super.addLoadables();
		}
		override public function playAudio(audioId:String = ''):void
		{
			if (this.soundChannel != null)
			{
				stopAudio();
			}
			audioID = int(audioId);
			audioStr = audioId;
			audio = this.audioLoader.getSound(audioId);
			this.soundChannel = audio.play();
			this.soundChannel.addEventListener(Event.SOUND_COMPLETE, onAudioComplete);
			
		}
		public function stopAudio():void
		{
			this.soundChannel.stop();
		}
		public function getpositionEvents():void
		{
			var timer:Timer = new Timer(100, 110);
		    timer.start();
			timer.addEventListener(TimerEvent.TIMER, getPosition);
		}
		public function getPosition(event:TimerEvent):void
		{
			pausePosition = this.soundChannel.position;
			dispatchEvent(new Event(POSITION_CHANGE));
		}
	}
	
}