package com.shivolve.application
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.utils.getDefinitionByName;
	
	import com.shivolve.application.Main;
	
	/**
	 * @file This should be the document class of the FLA.
	 * @author Gaurav Goel
	 */
	public class Preloader extends MovieClip 
	{
		/**
		 * Below line declares a variable of type Main because Main is not being compiled into the swf file. 
		 * Just because a class is imported does not mean it gets compiled. 
		 * Flash checks for any usage of the class and only compile it if it finds any. 
		 * It does this so that compiled file won't have extra compiled code that never gets used.
		 */
		private var mainClassReference:Main;
		
		private var mainClass:Class;
		
		public function Preloader() 
		{
			addEventListener(Event.ENTER_FRAME, checkFrame);
			loaderInfo.addEventListener(ProgressEvent.PROGRESS, progress);
			showLoader();
		}
		
		private function progress(e:ProgressEvent):void 
		{
			updateLoader();
		}
		
		private function checkFrame(e:Event):void 
		{
			if (currentFrame == totalFrames) 
			{
				removeEventListener(Event.ENTER_FRAME, checkFrame);
				startup();
			}
		}
		
		private function startup():void 
		{
			hideLoader();
			stop();
			loaderInfo.removeEventListener(ProgressEvent.PROGRESS, progress);
			mainClass = getDefinitionByName("com.shivolve.application.Main") as Class;
			addChild(new mainClass() as DisplayObject);
		}
		
		private function showLoader():void
		{
			trace("showing loader");
		}
		
		private function updateLoader():void
		{
			trace("updating loader");
		}
		
		private function hideLoader():void
		{
			trace("hiding loader");
		}
	}
	
}