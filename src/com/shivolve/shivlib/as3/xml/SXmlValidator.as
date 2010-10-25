package com.shivolve.shivlib.as3.xml 
{
	
	/**
	 * ...
	 * @author Gaurav Goel
	 */
	public class SXmlValidator 
	{
		
		public function SXmlValidator() 
		{
			
		}
	
		/**
		 * This method validates that the XML has only allowed attributes and tags as defined in the XML tag library.
		 * @param	obj <value> element inside the <text> element of the Asset XML.
		 */
		private function validateXml(obj:XML):Boolean
		{
			var xmlObj:XML = obj;
			var isValidated:Boolean = true;
			var tagName:String = obj.name();
			
			return isValidated;
		}
		
		/**
		 * Validates the text tag inside the reference tag.
		 * @param	textElement <text> tag inside the <reference> tag in the Asset XML.
		 * @return  Boolean value indicating whether the XML is as per the standard Tag and Attribute library.
		 */
		private function validateXmlContent(textElement:XML):Boolean
		{
			var isValidated:Boolean = true;
			return isValidated;
		}
		/**
		 * Validates the media tag inside the application and reference tags.
		 * @param	mediaElement <media> tag inside the <reference> and <application> tag in the Asset XML.
		 * @return  Boolean value indicating whether the XML is as per the standard Tag and Attribute library.
		 */
		private function validateMediaContent(mediaElement:XML):Boolean
		{
			var isValidated:Boolean = true;
			return isValidated;
		}
		/**
		 * Validates the cuePoints tag inside the reference tags.
		 * @param	cuePointElement <cuePoints> tag inside the <reference> tag in the Asset XML.
		 * @return  Boolean value indicating whether the XML is as per the standard Tag and Attribute library.
		 */
		private function validateCuePointContent(cuePointElement:XML):Boolean
		{
			var isValidated:Boolean = true;
			var validSentenceAttributes:Vector.<String> = Vector.<String>(["id","x","y","size","textColor","highlightColor","audioId"]);
			var validWordAttributes:Vector.<String> = Vector.<String>(["cuePointAt"]);
			return isValidated;
		}
	}
}