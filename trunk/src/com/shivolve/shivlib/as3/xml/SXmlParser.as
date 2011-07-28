package com.shivolve.shivlib.as3.xml
{

	import com.shivolve.shivlib.as3.loading.SLoader;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.ProgressEvent;
	
	import com.shivolve.shivlib.as3.events.SDataEvent;
	import com.shivolve.shivlib.as3.xml.SXmlParser;
	import com.shivolve.shivlib.as3.errors.SError;

	/**
	 * This class loads the XML file and dispatches the AssetVO.
	 */
	public class SXmlParser extends EventDispatcher
	{
		private static var loader:SLoader = null;
		private var errorMessage:String = null; 
		protected var referenceId:String = null;
		private var xmlFileName:String = null;
	
		public function SXmlParser() 
		{
			this.init();
		}
		
		/**
		 * Creates a new instance of SLoader with unique Loader Name.
		 */
		private function init():void
		{
			if (!SXmlParser.loader)
			{
				SXmlParser.loader = new SLoader();
				SXmlParser.loader.loaderName = "XML_Loader";
			}
		}
		
		/**
		 * Child class overrides this method with actual implementation to parse the XML Object.
		 * @param	xmlObj XML Object to be parsed.
		 */
		protected function parseXML(xmlObj:XML):void { }
		
		public function load(pathToFile:String, referenceId:String=null):void 
		{
			this.xmlFileName = pathToFile.substr((pathToFile.lastIndexOf("/")+1), pathToFile.length);
			this.referenceId = referenceId;
			SXmlParser.loader.addEventListener(ProgressEvent.PROGRESS,this.onProgress);
			SXmlParser.loader.addEventListener(Event.COMPLETE, onComplete);
			SXmlParser.loader.add(pathToFile, "xml");
			SXmlParser.loader.load();
		}

		private function onProgress(e:Event):void 
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
			SXmlParser.loader.removeEventListener(Event.COMPLETE, onComplete);
			//SXmlParser.loader.removeEventListener(SLoaderEvent.LOAD_COMPLETE, onComplete);
			try
			{
				var xmlObj:XML = SXmlParser.loader.getXML("xml");
				SXmlParser.loader.remove("xml");
				if (validateXml(xmlObj))
				{
					parseXML(xmlObj);
				}
				else
				{
					throw new SError("S Error Message");
				}
			}
			catch(e:SError)
			{
				this.errorMessage = "Error reading " + this.xmlFileName + ". " + this.errorMessage;
				trace("Fatal " + this.errorMessage);
				//SLog.log(5, this.errorMessage);
			}
		}
		
		/**
		 * This method validates that the XML has only allowed attributes and tags as defined in the XML tag library.
		 */
		private function validateXml(obj:XML):Boolean
		{
			var xmlObj:XML = obj;
			var isValidated:Boolean = true;
			var tagName:String = obj.name();
			if (tagName == "root_tag")
			{
				for (var i:uint = 0;  i < xmlObj.children().length(); i++)
				{
					tagName = xmlObj.children()[i].name();
					// tagName = "tagName_1"
					switch (tagName)
					{
						case "tagName_1":
						if (this.referenceId == xmlObj.children()[i].@id || xmlObj.children()[i].@id == "" || this.referenceId == null)
						{
							for (var k:uint = 0; k < xmlObj.children()[i].children().length(); k++)
							{
								tagName = xmlObj.children()[i].children()[k].name();
								// tagName = "tagName_1_1", "tagName_1_2", "tagName_1_3" 
								switch (tagName)
								{
									case "tagName_1_1":
										isValidated = validate_TagName_1_1_Content(xmlObj.children()[i].children()[k]);
									break;
									case "tagName_1_2":
										isValidated = validate_TagName_1_2_Content(xmlObj.children()[i].children()[k]);
									break;
									case "tagName_1_3":
										isValidated = validate_TagName_1_3_Content(xmlObj.children()[i].children()[k]);
									break;
									default:
										this.errorMessage =  tagName + " is not a valid tag name inside the tagName_1 tag.";
										isValidated = false;
									break;
								}
								if (!isValidated)
								{
									break;
								}
							}
						}
						break;
						case "tagName_2":
							isValidated = validate_tagName_2_Content(xmlObj.children()[i]);				
						break;
						default:
							this.errorMessage =  tagName + " is not a valid tag name inside the root_tag tag.";
							isValidated = false;
						break;
					}
					if (!isValidated)
					{
						break;
					}
				}	
			}
            else
			{
				if (tagName == null)
				{
					this.errorMessage =  "The file has syntax error.";
				}
				else
				{
					this.errorMessage =  tagName + " is not a valid root tag.";
				}
				isValidated = false;
			}
			return isValidated;
		}
		
	
		/**
		 * Validates the text tag inside the reference tag.
		 * @param	tagName_1_1_Element <tagName_1_1> tag inside the <application> tag in the XML.
		 * @return  Boolean value indicating whether the XML is as per the standard Tag and Attribute library.
		 */
		private function validate_TagName_1_1_Content(tagName_1_1_Element:XML):Boolean
		{
			var isValidated:Boolean = true;
			// Validation code here
			return isValidated;
		}
		/**
		 * Validates the tagName_2 tag inside the application and reference tags.
		 * @param	tagName_2_Element <tagName_2> tag inside the <application> tag in the XML.
		 * @return  Boolean value indicating whether the XML is as per the standard Tag and Attribute library.
		 */
		private function validate_TagName_1_2_Content(tagName_1_2_Element:XML):Boolean
		{
			var isValidated:Boolean = true;
			// Validation code here
			return isValidated;
		}
		/**
		 * Validates the cuePoints tag inside the reference tags.
		 * @param	tagName_1_3_Element <tagName_1_3> tag inside the <application> tag in the XML.
		 * @return  Boolean value indicating whether the XML is as per the standard Tag and Attribute library.
		 */
		private function validate_TagName_1_3_Content(tagName_1_3_Element:XML):Boolean
		{
			var isValidated:Boolean = true;
			// Validation code here
			return isValidated;
		}
		
		private function validate_tagName_2_Content(tagName_2_Element:XML):Boolean
		{
			var isValidated:Boolean = true;
			// Validation code here
			return isValidated;
		}
		
		
		/**
		 * Dispatches DATA_READY_EVENT with the Asset VO. This method is called by the child class that parses the XML.
		 * @param	vo Asset VO to be dispatched.
		 */
		public function dispatchDataReadyEvent():void 
		//public function dispatchDataReadyEvent(vo:AssetVO):void 
		{
			var dataEvent:SDataEvent = new SDataEvent(SDataEvent.DATA_READY_EVENT);
			//dataEvent.assetVO = vo;
			this.dispatchEvent(dataEvent);
		}
				
		public function dispose():void 
		{
			SXmlParser.loader.destroy();
		}	
	}
}