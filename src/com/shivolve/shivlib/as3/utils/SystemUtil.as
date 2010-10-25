package com.shivolve.shivlib.as3.utils
{
	import flash.system.System;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.text.TextField;
	import flash.media.Camera;
	import flash.media.Microphone;
	import flash.events.ActivityEvent;
	import flash.events.StatusEvent;
	import flash.system.Security;
	import flash.system.SecurityPanel;
	import flash.system.Capabilities;
	import flash.external.ExternalInterface;
	
	
	/**
	 * @author Gaurav Goel
	 */
	public class  SystemUtil extends EventDispatcher
	{
		public static const NO_CAMERA_FOUND:String							=	"noCameraFound";
		public static const NO_MICROPHONE_FOUND:String						=	"noMicrophoneFound";
		public static const CAMERA_ACTIVITY:String							=	"cameraActivity";
		public static const MICROPHONE_ACTIVITY:String						=	"microphoneActivity";
		public static const CAMERA_STATUS:String							=	"cameraStatus";
		public static const MICROPHONE_STATUS:String						=	"microphoneStatus";		
		public static const EXTERNAL_INTERFACE_NOT_AVAILABLE_ERROR:String	=	"externalInterfaceNotAvailableError";
		private static const VERSION_NUMBER:String							=	"Application x.x";
		
		private var _camera:Camera;
		private var _mic:Microphone;
		private static var _osName:String = Capabilities.os;
		private static var _osVersion:String = Capabilities.version;
		
		
		public function SystemUtil()
		{
			super();
		}
		
		/**
		 * @return Camera	Get the default camera
		 */
		public function getCamera():Camera
		{
			this._camera = Camera.getCamera();
			
			if (_camera != null)
			{
				Security.showSettings(SecurityPanel.CAMERA);
				this._camera.addEventListener(ActivityEvent.ACTIVITY, onCameraActivity);
				this._camera.addEventListener(StatusEvent.STATUS, onCameraStatus);					
				return this._camera;
			}
			else
			{
				dispatchEvent(new Event(SystemUtil.NO_CAMERA_FOUND, true));
				return null;
			}
		}
		private function onCameraActivity(e:ActivityEvent):void
		{
			dispatchEvent(new Event(SystemUtil.CAMERA_ACTIVITY, true));
		}		
		private function onCameraStatus(e:StatusEvent):void
		{
			dispatchEvent(new Event(SystemUtil.CAMERA_STATUS, true));
		}
		
		/**
		 * @return Microphone returns Microphone
		 */
		public function getMicrophone():Microphone
		{
			Security.showSettings(SecurityPanel.MICROPHONE);
			this._mic = Microphone.getMicrophone();
			Security.showSettings(SecurityPanel.PRIVACY);
            this._mic.setLoopBack(true);
			
			if (this._mic != null)
			{
				this._mic.addEventListener(ActivityEvent.ACTIVITY, onMicActivity);
				this._mic.addEventListener(StatusEvent.STATUS, onMicStatus);				
				return this._mic;
				
			}
			else
			{
				dispatchEvent(new Event(SystemUtil.NO_MICROPHONE_FOUND, true));
				return null;
			}
		}

		private function onMicActivity(e:ActivityEvent):void 
		{
			dispatchEvent(new Event(SystemUtil.MICROPHONE_ACTIVITY, true));
		}
		
		private function onMicStatus(e:StatusEvent):void 
		{
			dispatchEvent(new Event(SystemUtil.MICROPHONE_STATUS, true));
		}
		
		
		/**
		 * gets the client browser name through JavaScript
		 * @return browsername
		 */
		public function getBrowserName():String
		{
			if (ExternalInterface.available)
			{
				var _browser:String = ExternalInterface.call('getBrowser');		
				if (_browser != null)
				{ 
					return _browser;
				} 
			}
			else
			{
				dispatchEvent(new Event(SystemUtil.EXTERNAL_INTERFACE_NOT_AVAILABLE_ERROR, true));
			}
			return "";	
		}
		
		/**
		 * @return	String Name of Operating System
		 */
		public function getOSName():String
		{
			return _osName;			
		}

		/**
		 * @return	String	Version of Operating System
		 */
		public function getOSVersion():String
		{
			return _osVersion;
		}
		
		/**
		 * @return String Version of Application
		 */
		public function getApplicationVersionName(): String
		{
			return VERSION_NUMBER;
		}
		
		public function dispose():void
		{
			if (this._camera.hasEventListener(ActivityEvent.ACTIVITY))
			{
				this._camera.removeEventListener(ActivityEvent.ACTIVITY, onCameraActivity);			
			}
			if (this._camera.hasEventListener(StatusEvent.STATUS))
			{
				this._camera.removeEventListener(StatusEvent.STATUS, onCameraStatus);						
			}		
			if (this._mic.hasEventListener(ActivityEvent.ACTIVITY))
			{
				this._mic.removeEventListener(ActivityEvent.ACTIVITY, onMicActivity);
			}
			if (this._mic.hasEventListener(StatusEvent.STATUS))
			{
				this._mic.removeEventListener(StatusEvent.STATUS, onMicStatus);	
			}		
			if (this._camera != undefined)
			{
				this._camera 	= null;
			}
			if (this._mic != undefined)
			{
				this._mic 	= null;
			}
		}
	}
}