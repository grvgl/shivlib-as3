package com.shivolve.shivlib.as3.xml
{
	
	import com.shivolve.shivlib.as3.events.SDataEvent;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import com.shivolve.shivlib.as3.loading.SLoader;
	
	
	/**
	 * It Loads the XML and send it to the SBaseParser
	 * @author Gaurav Goel
	 */	 
	 
	
	public class SXmlManager extends EventDispatcher
	{
		private var xmlPath:String = null;	// Store the XMLPath
		private var strErrorMessage:String = null;	// Store the Custom ErrorMessage
		
		private var sLoader:SLoader	= null;		
		private var xmlObj:XML = null;	// Store XML output
		private var _unparsedXML:XML = null;	// Store raw XML sent by SBaseParser
		
		private var objSBaseParser:SXmlParser = null;	// Declare SXmlParser variable
		
		private static var intXMLCounter:int = 0;
		
		public function SXmlManager() 
		{
			this.init();
		}
		
		/**
		 * This method generates unique instance of SLoader.
		 */
		
		private function init():void
		{
			SXmlManager.intXMLCounter++;
			this.sLoader = new SLoader();						
			//this.sLoader = new SLoader("XML_Loader_" + String(SXmlManager.intXMLCounter));						
		}
		
		/**
		 *  Remove object 
		 */ 
	
		public function dispose():void 
		{
			this.sLoader.destroy();
			this.xmlObj = null;
		}
		
		
		/**
		 * Accept the XML Path i.e XML file path
		 * @param	pathToFile
		 * 
		 */
		
		 public function load(pathToFile:String):void
		{
			
			this.xmlPath = pathToFile;
			this.loadXML();
		}
		
		/**
		 * Load and XML File
		 */
		
		private function loadXML():void
		{
			this.sLoader.add(this.xmlPath, "xml");
			this.sLoader.addEventListener(Event.COMPLETE, this.onXMLLoad);
			//this.sLoader.addEventListener(SLoader.SLOADER_COMPLETE, this.onXMLLoad);
			this.sLoader.load();
		}
		
		/**
		 * Parse the XML
		 * @param	e
		 */
		
		private function onXMLLoad(e:Event):void
		{
			trace("SXmlManager#onXMLLoad()"+e.target.getXML("xml"));
			// The below CustomEvent has to be changed once the SDataEvent package is ready.
			
			try
			{
				this.createSBaseParser(e.target.getXML("xml"));			
			}
			catch (e:Error)
			{
				this.strErrorMessage = "Had problem reading the XML File." + "\n" + e;
			}					
			
		}
		
		/**
		 *  Initialises base parser
		 * @param	xmlObj
		 */
		private function createSBaseParser(xmlObj:XML):void
		{
			this.objSBaseParser = new SXmlParser();
			//this.objSBaseParser = new SXmlParser(this,xmlObj);
		}
		
		/**
		 *  Dispatches sessionVO
		 * @param	sessionVO
		 */
		public function onSessionDataParse():void
		//public function onSessionDataParse(sessionVO:SessionVO):void
		{
			var dataEvent:SDataEvent = new SDataEvent(SDataEvent.DATA_READY_EVENT);
			//dataEvent.sessionVO = sessionVO;
			//this.dispatchEvent(dataEvent);
		}
		

		public function onAssetDataParse():void
		//public function onAssetDataParse(assetVO:ProductAssetVO):void
		{
			var dataEvent:SDataEvent = new SDataEvent(SDataEvent.DATA_READY_EVENT);
			//dataEvent.assetVO = assetVO;
			//this.dispatchEvent(dataEvent);
		}		
		
		/**
		 * Dispatches raw XML Object if the loaded XML is activity specific.
		 * @param	obj
		 */
		public function onRawXML(xml:XML):void
		{
			var dataEvent:SDataEvent = new SDataEvent(SDataEvent.DATA_READY_EVENT);
			this.unparsedXML = xml;
			this.dispatchEvent(dataEvent);
		}
		
		public function get unparsedXML():XML { return _unparsedXML; }
		
		public function set unparsedXML(value:XML):void 
		{
			_unparsedXML = value;
		}
	}
	
}