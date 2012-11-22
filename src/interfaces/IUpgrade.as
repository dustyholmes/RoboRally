package interfaces
{
	public interface IUpgrade
	{
		function get name():String;

		function get description():String;

		function get isElective():Boolean;

		function get isActive():Boolean;

		function get useCount():Number;

		function get maxUseCount():Number;
	}
}
