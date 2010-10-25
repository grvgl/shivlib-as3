package com.shivolve.shivlib.as3.loading
{
	import com.shivolve.shivlib.events.SEventDispatcher;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author Gaurav Goel
	 */
	public class SLoader extends SEventDispatcher
	{
		private var request:URLRequest = null;
		private var loader:URLLoader = null;
		public function SLoader() 
		{
			this.init();
		}

		private function init():void
		{
			this.request = new URLRequest();
			this.loader = new URLLoader();
			addEventListeners();
		}
		
		private function addEventListeners():void
		{
			this.loader.addEventListener(Event.COMPLETE, this.onComplete);
			this.loader.addEventListener(Event.PROGRESS, this.onProgress);
			this.loader.addEventListener(Event.ERROR, this.onError);
		}
		
		public function load(pathToFile:String, id:String):void
		{
			this.loader.load(pathToFile);
		}
		
		public function set loaderName(nameOfLoader:String):void 
		{
			this.loaderName = nameOfLoader;
		}
		
		public function getContent(contentID:String='nothing'):Object
		{
			return this.loader.getContent(contentID);
		}
		
		public function start():void 
		{
			this.loader.start();
		}
		
		public function add(filePath:String, assetID:String):void 
		{
			var configObj:Object = new Object();
			configObj.id = assetID;
			this.wLoader.add(filePath, configObj);
		}
		
		private functin onComplete(e:Event):void 
		{
			this.lastLoadedItem = e.target.items[(e.itemsLoaded - 1)].id;
			this.dispatchEvent(new SLoaderEvent(SLoaderEvent.LOAD_COMPLETE, true));
			
		}
		private functin onProgress(e:Event):void 
		{
			trace("onProgress()");
		}
		
		/**
		 * listener function for loading errors
		 */
		private functin onError(e:Event):void 
		{
			this.dispatchEvent(new SLoaderEvent(SLoaderEvent.LOAD_ERROR, true));
		}

		private function removeEventListeners():void
		{
			this.loader.removeEventListener(Event.COMPLETE, this.onComplete);
			this.loader.removeEventListener(Event.PROGRESS, this.onProgress);
			this.loader.removeEventListener(Event.ERROR, this.onError);
		}
	
		public function destroy():void 
		{
			this.removeEventListeners();
			//this.loader.destroy();
		}
	}
}