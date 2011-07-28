package com.shivolve.shivlib.as3.loading
{
	import com.shivolve.shivlib.as3.events.SLoaderEvent;
	import flash.events.*;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author Gaurav Goel
	 */
	public class SLoader extends EventDispatcher
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
			this.loader.addEventListener(ProgressEvent.PROGRESS, this.onProgress);
			this.loader.addEventListener(IOErrorEvent.IO_ERROR, this.onError);
		}
		
		public function load():void
		{
			this.loader.load(this.request);
		}
		
		public function set loaderName(nameOfLoader:String):void 
		{
			this.loaderName = nameOfLoader;
		}
		
		public function getContent(contentID:String='nothing'):Object
		{
			return null;
			//return this.loader.getContent(contentID);
		}
		
		public function getXML(contentID:String='nothing'):XML
		{
			return new XML();
		}
		/*
		public function start():void 
		{
			this.loader.load();
			//this.loader.start();
		}
		*/
		public function add(pathToFile:String, assetID:String):void 
		{
			var configObj:Object = new Object();
			configObj.id = assetID;
			this.request.url = pathToFile;
			//this.sLoader.add(pathToFile, configObj);
		}
		
		public function remove(assetID:String):void
		{
			
		}
		private function onComplete(e:Event):void 
		{
			trace("SLoader#onComplete()");
			//this.lastLoadedItem = e.target.items[(e.itemsLoaded - 1)].id;
			//this.dispatchEvent(new SLoaderEvent(SLoaderEvent.LOAD_COMPLETE, true));
			this.dispatchEvent(new Event(Event.COMPLETE, true));
			
		}
		private function onProgress(e:Event):void 
		{
			trace("onProgress()");
		}
		
		/**
		 * listener function for loading errors
		 */
		private function onError(e:Event):void 
		{
			trace("SLoader#onError()");
			this.dispatchEvent(new SLoaderEvent(SLoaderEvent.LOAD_ERROR, true));
		}

		private function removeEventListeners():void
		{
			this.loader.removeEventListener(Event.COMPLETE, this.onComplete);
			this.loader.removeEventListener(ProgressEvent.PROGRESS, this.onProgress);
			this.loader.removeEventListener(IOErrorEvent.IO_ERROR, this.onError);
		}
	
		public function destroy():void 
		{
			this.removeEventListeners();
			//this.loader.destroy();
		}
	}
}