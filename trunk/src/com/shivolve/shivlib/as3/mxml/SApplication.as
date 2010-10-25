package com.shivolve.shivlib.as3.mxml 
{
	import mx.core.Application;
	import mx.events.FlexEvent;
	import mx.styles.StyleManager;
	import mx.styles.CSSStyleDeclaration;
	import mx.controls.Button;
	import mx.skins.halo.HaloBorder;
	import flash.display.Bitmap;
	
	/**
	 * Use this class to use Flex components without writing MXML and reduce the file size.
	 * @author Gaurav Goel
	 */

	public class SApplication extends Application
	{
		[Embed(source="images/up.png")]
		public var UpState: Class;
		
		[Embed(source="images/over.png")]
		public var OverState: Class;
		
		[Embed(source="images/down.png")]
		public var DownState : Class;

		public function SApplication()
		{
			super();
			this.layout = "absolute";
			this.addEventListener(FlexEvent.CREATION_COMPLETE, handleComplete);
			setStyles();
		}

		private function setStyles():void
		{
			var style:CSSStyleDeclaration = new CSSStyleDeclaration();
			style.setStyle("borderSkin", mx.skins.halo.HaloBorder);
			StyleManager.setStyleDeclaration("Application", style, false);

			style = new CSSStyleDeclaration();
			style.setStyle("color", "blue");
			style.setStyle("textAlign", "left");
			style.setStyle("fontAntiAliasType", "advanced");
			style.setStyle("fontGridFitType", "pixel");
			style.setStyle("paddingLeft", 10);
			style.setStyle("paddingRight", 10);
			style.setStyle("paddingTop", 5);
			style.setStyle("paddingBottom", 5);
			style.setStyle("horizontalCenter", 0);
			style.setStyle("verticalCenter", 0);
			style.setStyle("upSkin", UpState);
			style.setStyle("overSkin", OverState);
			style.setStyle("downSkin", DownState);

			StyleManager.setStyleDeclaration("Button", style, false);
		}

		private function handleComplete(event:FlexEvent):void
		{
			var button:Button = new Button();
			button.label = "labelBtn";
			addChild(button);
		}
	}
}