package com.shivolve.shivlib.as3.utils
{
	import flash.display.DisplayObject;
	import flash.system.Capabilities;
	/**
	* 
	* @author Gaurav Goel
	*/	
	public class EnvironmentUtil 
	{
		
		/**
			Detects launching domain name for the SWF.
			@param obj: MovieClip to get location of.
			@return Returns  domain name with TLD of SWF's location.
			@usage Pass <code>root</code> as parameter to this method.
		*/
			
		public static function get domain(obj:DisplayObject):String 
		{
			var _domain:String = obj.loaderInfo.url.split('://')[1].split('/')[0];
			_domain = _domain.split('?')[0];
			return (_domain.substr(0, 4) == 'www.') ? _domain.substr(4) : _domain;
		}
	
		/**
			Determines if the runtime environment is an Air application.
			@return Returns 'StandAlone' if the runtime environment is StandAlone Flash Player.
			@return Returns 'Desktop' if the runtime environment is an Air application.
			@return Returns 'External' if the runtime environment is Flash Player version used by external player or test movie mode.
			@return Returns 'PlugIn' or 'ActiveX' if the runtime environment is browser plug-in Flash Player.
		*/
		
		public static function get environment():String
		{
			return Capabilities.playerType;
		}
	}
}