package
{
	import flash.display.Sprite;
	import flash.text.TextField;

	public class RoboRally extends Sprite
	{
		public function RoboRally()
		{
			var textField:TextField = new TextField();
			textField.text = "Hello, World";
			addChild(textField);
		}
	}
}
