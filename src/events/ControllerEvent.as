package events
{
	import flash.events.Event;

	public class ControllerEvent extends Event
	{
		private static const PREFIX:String = "ControllerEvent::";

		public static const EXPRESS_CONVEY:String = PREFIX + "expressConvey";
		public static const CONVEY:String = PREFIX + "convey";
		public static const PUSH:String = PREFIX + "push";
		public static const ROTATE:String = PREFIX + "rotate";

		public function ControllerEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}

		override public function clone():Event
		{
			return new ControllerEvent(type, bubbles, cancelable);
		}
	}
}
