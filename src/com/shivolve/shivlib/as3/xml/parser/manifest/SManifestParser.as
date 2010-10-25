package com.shivolve.shivlib.as3.xml.parser.manifest
{
	
	/**
	 * Parses the activity/referece and application XMLs for the assets.
	 */
	public class SManifestParser extends SParser
	{
		private var xmlObj:XML = null;
		
		public function SManifestParser() 
		{
		}

		/**
		 * This function parses the XML and creates the value objects for text and media elements.
		 * @param	xmlObj XML Object to be parsed.
		 */
		override protected function parseXML(xmlObj:XML):void
        {
			this.xmlObj = xmlObj;

		}

		/**
		 * 
		 * @param	obj XML Media Element, contains value elements.
		 * @return  Returns Vector containing MediaVO.
		 */
		private function getMediaVector(obj:XML):Vector.<MediaVO>
		{
			var mediaItems:Vector.<MediaVO> = new Vector.<MediaVO>();
			for (var i:int = 0; i < obj.children().length(); i++)
			{
				// Write code here
			}
			return mediaItems;
		}
		
		/**
		 * 
		 * @param	obj XML CuePoints Element, contains value elements.
		 * @return  Returns CuepointVO.
		 */
		private function getCuePoints(obj:XML):CuepointVO
		{
			var xmlCuepoints:XMLList =obj.children();
			
			var cuepointVO:CuepointVO = new CuepointVO();
			var vSentenceVO:Vector.<SentenceVO> =  new Vector.<SentenceVO>();
			
			for (var i:int = 0 ; i < xmlCuepoints.length(); i++)
			{
				// Write code here
			}			
			cuepointVO.vSentenceVO = vSentenceVO;			
			
			return cuepointVO;
		}
	}
}