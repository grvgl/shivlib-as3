package com.shivolve.shivlib.as3.errors 
{
	/**
	 * Code Reference:
	 * To keep the script running it is required to catch the error in appropriate catch blocks. 
	 * If the error does not get caught the script does not proceed. 
	 * Modify and run below code and go through the tracees...
	 * <code>
	 * 		try 
	 * 		{
	 * 			var str:* = "This is a string";
	 *			trace(str.getChildAt(0));
	 * 		}
	 * 			catch(error:IOErrorEvent) 
	 * 		{
	 * 			trace("IOErrorEvent error: " + error);
	 * 		} 
	 * 		catch(error:TypeError) 
	 * 		{
	 * 			trace("TypeError error: " + error);
	 * 		} 
	 * 		catch(error:Error) 
	 * 		{
	 * 			trace("Error error: " + error);
	 * 		} 
	 * 		finally 
	 * 		{
	 * 			trace("Finally!");
	 * 		}
	 * 		trace("Continuing after try catch block...");
	 * </code>
	 * @author Gaurav Goel
	 * @version 0.1
	 */
	public class SError extends Error
	{
		
		public function SError(message:String) 
		{
			super(message);
		}
		
	}
	
}