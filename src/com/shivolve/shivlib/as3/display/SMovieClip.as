package com.shivolve.shivlib.as3.display
{
	import flash.display.MovieClip;

	public class SMovieClip extends MovieClip
	{
		public function SMovieClip()
		{
		}
		
		public function addClip(clip:SMovieClip, container:SMovieClip = this, xPos:int = 0, yPos:int = 0, index:int = (this.numChildren - 1)):void 
		{
			clip.x = xPos;
			clip.y = yPos;
			container.addChildAt(clip, index);
		}
	}
}