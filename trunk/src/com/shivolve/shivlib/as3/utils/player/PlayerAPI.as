package com.shivolve.shivlib.as3.utils.player
{
	import flash.display.MovieClip;
	
	public final class PlayerAPI 
	{
		private static var player:MovieClip;
		private static var instance:MovieClip;
		private static var hasInited:Boolean = false;

		public function PlayerAPI()
		{
			if (instance) throw new Error( "PlayerAPI and can only be accessed via PlayerAPI.getInstance()" );
		}
		
		public static function init(m:MovieClip):void
		{
			if (!hasInited)
			{
				player = m;
				hasInited = true;
			}	
		}
		
		public static function getInstance():MovieClip
		{
			return player;
		}
	}
}