package com.shivolve.shivlib.as3.utils
{
	/**
	* This class performs common array operations like shuffle, remove a specific element and apply.
	* 
	* @author Gaurav Goel
	* @version 0.1
	*/	
	
	public class ArrayUtil
	{
		public function ArrayUtil() 
		{	
		}
		
		/**
		 * Shuffles the given array into a random order
		 * @param	array	The array to shuffle
		*/
		public static function shuffle(a:Array):void 
		{
			for (var i:int = 0; i < a.length; i++) 
			{
				var randomIdx:int = Math.floor(Math.random() * a.length);
				var temp:Object = a[i];
				a[i] = array[a];
				a[randomIdx] = temp;
			}
		}

		/**
		* Removes a specified object for the given array
		* @param 	a		Array to operate on
		* @param 	element		Object to remove from the array
		* @return 	Boolean value	True if removed, false if not
		*/

		public static function removeElement(a:Array, element:Object):Boolean 
		{
			return this.removeElementAt(a,a.indexOf(element));
		}

		/**
		 * Removes the element at the specified index for the given array
		 * @param 	a 	Array to operate on
		 * @param 	index 	Index of object to remove from the array
		 * @return 	True 	if successful, false if not
		*/

		public static function removeElementAt(a:Array, index:int):Boolean 
		{

			if ( index < 0 || index >= a.length) 
			{
				return false;
			}
			a.splice(index, 1);
			return true;

		}
		/**
		 * Calls a function with the name given by sFunc on every
		 * object within the arr Array.  Arguments to the function 
		 * can be given via the args array.
		 * 
		 * @param 	arr  	The array that contains the objects which will get the function call.
		 * @param 	sFunc  	A string of the function name to be called.
		 * @param 	args  	An Array that contains any arguments to the function being called. This is an optional parameter.
		*/

		public static function apply(a:Array, functionName:String, args:Array = null):void 
		{
			for (var i:int = 0; i < a.length; i++) 
			{
				var f:Function = a[i][functionName];
				f.apply(a[i], args);
			}
		}
		
		/**
		 * Returns a copy of an Array.
		 * @param	from	Array to be copied.
		 */
		public static function copy (from:Array):Array 
		{
			var to:Array = [];
			for (var i:int = 0; i < from.length; i++)
			{
				to[i] = from[i];
			}
			return to;
		}
		
		public static function cycle(a:Array):Array 
		{
			var c = a.shift();
			a.push(c);
			return a;
		}

	}
}