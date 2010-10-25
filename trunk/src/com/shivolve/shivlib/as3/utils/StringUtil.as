package com.shivolve.shivlib.as3.utils
{
	/**
	* This class contains methods that perform commonly used string manipulations.
	* This class performs the common string operations, like replace, multiply remove or trim a string.
	* 
	* @author Gaurav Goel
	* @version 0.1
	*/	
	
	public class StringUtil
	{

		public function StringUtil()
		{
		}

		/**
		 * Replaces a character at a specific index with new characters.
		 * @param 	str 		Original string to replace characters from.
		 * @param 	oldValue 	String to be replaced
		 * @param 	newValue	String to replace oldValue
		 * @return 	String 		String with string replaced.
		*/
		public static function replace(str:String, oldValue:String, newValue:String):String 
		{
			return str.split(oldValue).join(newValue);
		}

		
		/**
		 * The method takes a string to duplicate and append the same string n number of times.
		 * @param	str		String to duplicate.
		 * @param	n		Number of times the string to be duplicated
		 * @return	String	String duplicated n number of times	
		 */
		public static function multiply(str:String, n:Number):String 
		{
			if (n < 1) 
			{
				return "";
			}
			var tempString:String = "";
			for (var i = 1; i <= n; i++) 
			{
				tempString += str;
			}
			return tempString;
		}
		/**
		 * Replaces target characters with new characters.
		 *
		 * @param 	str 	String to replace characters from.
		 * @param 	val 	String describing characters to remove.
		 * @return 	String 	with characters replaced.
		 */
		public function remove(str:String, val:String):String 
		{
			return StringUtil.remove(str, val);
		}
		
		/**
		* Removes whitespace (or other characters) from the beginning and end of a String.
		* Default implementation removes the leading space from the beginning of the string, 
		* and removes a space from the end of a string (if either is present).
		* @param str String to trim
		* @param trimStr String to be removed
		*/
		public static function trim(str:String, trimStr:String = " "):String 
		{
			var i:uint = 0;
			var strlen:uint = str.length;
			
			// left side
			while (str.charAt(i) == trimStr) 
			{
				i++;
			}
			if (i > 0) 
			{
				str = str.substring(i, strlen);
			}
			
			// right side
			var j:uint = str.length - 1;
			while (str.charAt(j) == trimStr) 
			{
				j--;
			}
			str = str.substring(0, j + 1);
			return str;
		}
		
		/**
		* Checks whether two strings are equal.
		* @param str1 First string to compare
		* @param str2 Second string to compare
		* @param isCaseSensitive Whether the comparision has to be case sensitive
		* @return Boolean True if equal else False
		*/
		public static function isEqual(str1:String, str2:String, isCaseSensitive:Boolean):Boolean
		{
			if(isCaseSensitive)
			{
				return (str1 == str2);
			}
			else
			{
				return (str1.toLowerCase() == str2.toLowerCase());
			}
		}
	}
}