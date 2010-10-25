package com.shivolve.shivlib.as3.utils
{	
	import flash.display.Stage;
	import flash.display.DisplayObject;
	
	/**
	* This class performs all the common allignment operations for display object. 
	* Objects can align to the other DisplayObject(bounding) or to the stage(if the bounding object is null).
	* 
	* @author Gaurav Goel
	* @version 0.1
	*/	

	public class AlignUtil
	{
		public function AlignUtil() 
		{
		}
		
		/**
		 *Aligns a DisplayObject to the left side of the bounding DisplayObject.
		 *	
		 *@param	displayObj	The DisplayObject to align.
		 *@param 	bounds 	The area in which to align the DisplayObject, its an optional parameter if this is null it will consider stage as a bounds.
		**/
		public function alignLeft(displayObj:DisplayObject, bounds:DisplayObject = null):void
		{
			if (bounds == null)
			{
				displayObj.x = 0;
			}
			else
			{
				displayObj.x = bounds.x;
			}
		}
		
		/**
		 *Aligns a DisplayObject to the right side of the bounding DisplayObject.
		 *	
		 *@param	displayObject	The DisplayObject to align.
		 *@param	bounds	The area in which to align the DisplayObject, its an optional parameter if this is null it will consider stage as a bounds.
		*/
		public function alignRight(displayObj:DisplayObject, bounds:DisplayObject = null):void
		{
			if (bounds == null)
			{
				displayObj.x = displayObj.stage.stageWidth - displayObj.width;
			}
			else
			{
				displayObj.x = bounds.x + bounds.width - displayObj.width;
			}
		}
		
		/**
		 *Aligns a DisplayObject to the top left side of the bounding DisplayObject.
		 *	
		 *@param	displayObject	The DisplayObject to align.
		 *@param	bounds	The area in which to align the DisplayObject, its an optional parameter if this is null it will consider stage as a bounds.
		 */
		public function alignTopLeft(displayObj:DisplayObject, bounds:DisplayObject = null):void
		{
			if (bounds == null)
			{
				displayObj.x = displayObj.stage.x;
				displayObj.y = displayObj.stage.y;
			}
			else
			{
				displayObj.x = bounds.x;
				displayObj.y = bounds.y;
			}
		}
		
		/**
		 *Aligns a DisplayObject to the bottom of the bounding DisplayObject.
		 *	
		 *@param	displayObject	The DisplayObject to align.
		 *@param	bounds	The area in which to align the DisplayObject, its an optional parameter if this is null it will consider stage as a bounds.
		 */
		public function alignBottom(displayObj:DisplayObject, bounds:DisplayObject = null):void
		{
			if (bounds == null)
			{
				displayObj.y = displayObj.stage.stageHeight - displayObj.height;
			}
			else
			{
				displayObj.y = bounds.y + bounds.height - displayObj.height;
			}
		}
			
		/**
		 *Aligns a DisplayObject to the center of the bounding DisplayObject.
		 *	
		 *@param	displayObject	The DisplayObject to align.
		 *@param	bounds	The area in which to align the DisplayObject, its an optional parameter if this is null it will consider stage as a bounds.
		 */
		public function alignCenter(displayObj:DisplayObject, bounds:DisplayObject = null):void
		{
			if (bounds == null)
			{
				displayObj.x = (displayObj.stage.stageWidth / 2) - (displayObj.width / 2);
			}
			else
			{
				displayObj.x = bounds.x + (bounds.width / 2) - (displayObj.width / 2);
			}
		}
		
		/**
		 *Aligns a DisplayObject to the middle of the bounding DisplayObject.
		 *	
		 *@param	displayObject	The DisplayObject to align.
	 	 *@param	bounds	The area in which to align the DisplayObject, its an optional parameter if this is null it will consider stage as a bounds.
		 */
		public function alignMiddle(displayObj:DisplayObject, bounds:DisplayObject = null):void
		{
			if (bounds == null)
			{
				displayObj.y = (displayObj.stage.stageHeight / 2) - (displayObj.height / 2);
			}
			else
			{
				displayObj.y = bounds.y + (bounds.height / 2) - (displayObj.height / 2);
			}
		}	
	}
}