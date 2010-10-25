package com.shivolve.shivlib.as3.xml
{

	import flash.events.Event;
	import flash.events.EventDispatcher;

	
	/**
	 * This class loads the XML file and dispatches the AssetVO.
	 */
	public class SXmlLoader extends EventDispatcher
	{
		private static var loader:SLoader = null;
		private var errorMessage:String = null; 
		private var xmlFileName:String = null;
	
		public function SXmlLoader() 
		{
			this.init();
		}
		
		/**
		 * Creates a new instance of SLoader with unique Loader Name.
		 */
		private function init():void
		{
			this.loader = new SXmlLoader();
			this.loader.loaderName = "XML_Loader";
		}
		
		/**
		 * Child class overrides this method with actual implementation to parse the XML Object.
		 * @param	xmlObj XML Object to be parsed.
		 */
		protected function parseXML(xmlObj:XML):void { }
		
		public function load(pathToFile:String, referenceId:String=null):void 
		{
			this.xmlFileName = pathToFile.substr((pathToFile.lastIndexOf("/")+1), pathToFile.length);
			this.loader.addEventListener(BulkProgressEvent.PROGRESS,this.onProgress);
			this.loader.addEventListener(SLoaderEvent.LOAD_COMPLETE, onComplete);
			this.loader.add(pathToFile, "xml");
			this.loader.start();
		}

		private function onProgress(e:BulkProgressEvent):void 
		{ 
			this.errorMessage = "Had problem loading the XML File." + "\n" + e;
		}
		
		/**
		 * This method first calls the validateAssetXml() method to validate the XML. 
		 * If the XML has valid tags and attributes, it givess the XML Object to the parseXML() method.
		 * @param	e
		 */
		private function onComplete(e:Event):void 
		{
			SParser.loader.removeEventListener(SLoaderEvent.LOAD_COMPLETE, onComplete);
			try
			{
				var xmlObj:XML = SParser.loader.getXML("xml");
				this.loader.remove("xml");
				if (validateAssetXml(xmlObj))
				{
					parseXML(xmlObj);
				}
				else
				{
					throw new SError();
				}
			}
			catch(e:SError)
			{
				this.errorMessage = "Error reading " + this.xmlFileName + ". " + this.errorMessage;
				trace("Fatal " + this.errorMessage);
				SLog.log(5, this.errorMessage);
			}
		}
		


		/**
		 * Dispatches DATA_READY_EVENT with the Asset VO. This method is called by the child class that parses the XML.
		 * @param	vo Asset VO to be dispatched.
		 */
		public function dispatchDataReadyEvent(vo:AssetVO):void 
		{
			var dataEvent:SDataEvent = new SDataEvent(SDataEvent.DATA_READY_EVENT);
			dataEvent.assetVO = vo;
			this.dispatchEvent(dataEvent);
		}
				
		public function dispose():void 
		{
			SParser.loader.dispose();
		}	
	}
}