package com.shivolve.shivlib.as3.utils 
{
	import flash.utils.describeType;
	/**
	 * Creates instance of the class
	 * @param cls Class to create
	 * @param args parameters to be passed to the Constructor of the class
	 * @author Gaurav Goel
	 */
	public class ClassUtil 
	{
		
		public static create(cls:Class, ...args):*
		{
			switch (args.length)
			{
				case 0:
					return new cls();
				break;
				case 1:
					return new cls(args[0]);
				break;
				case 2:
					return new cls(args[0], args[1]);
				break;
				case 3:
					return new cls(args[0], args[1], args[2]);
				break;
				case 4:
					return new cls(args[0], args[1], args[2], args[3]);
				break;
				case 5:
					return new cls(args[0], args[1], args[2], args[3], args[4]);
				break;
				default:
					throw new Error("Arguments more than 5 are not allowed.");
				break;

			}
			return new cls(args[0]);
		}
		
		/**
		 * Returns name of the class without the package.
		 * @param clazz Class
		 */		
		public static function getClassName(clazz:Class):String 
		{ 
			return describeType(clazz).@name.split("::")[1];
		}
		
		/**
		 * Returns name of the class along with the package in string format.
		 * @param clazz Class
		 */
		public static function getQualifiedClassName(clazz:Class):String 
		{
			return describeType(clazz).@name;
		}

		/**
		 * Returns package in string format without the class name.
		 * @param clazz Class
		 */			
		public static function getPackageName(clazz:Class):String 
		{ 
			return describeType(clazz).@name.split("::")[0];
		}

	}
	
}