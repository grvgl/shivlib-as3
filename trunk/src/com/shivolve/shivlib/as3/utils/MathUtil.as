package com.shivolve.shivlib.as3.utils
{
	/**
	 * @author Gaurav Goel
	 */
	public class MathUtil 
	{
		public function MathUtil() 
		{
		}
		
		/**
		* returns a random integer within a certain range.
		*
		* @param min Smallest integer.
		* @param max Biggest integer.
		* @return int Random Integer
		*/
		public static function randomRange(min:int, max:int):int 
		{
			return Math.floor(Math.random() * (max - min + 1)) + min;
		}

		public static function addLeadingZeros(num:Number, numZeros:Number = 1):String
		{
			var str:String = String(num);
			if (numZeros > 0)
			{
				for (var i:Number = 0; i < numZeros; i++)
				{
					str = "0" + str;
				}
			}
			return str;
		}
		
		/**
		 * Genrates random number in given range
		 * 
		 * @param	limit	A limit to genrate the random number
		 * @return  Number	Random number within the given limit
		 */
		public static function getRandonRange(limit:Number):Number
		{
			return Math.round(limit * Math.random()); 
		}
	}
}