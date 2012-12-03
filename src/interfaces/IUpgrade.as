package interfaces
{
	public interface IUpgrade extends ICard
	{
		function get name():String;

		function get description():String;

		function get elective():Boolean;

		function get active():Boolean;

		function get uses():uint;

		function get useMaximum():uint;
	}
}
