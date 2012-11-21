package interfaces
{
	public interface IPassage
	{
		function get from():IFloor;

		function get to():IFloor;

		function get hasWall():Boolean;

		function get laserDirection():String;
	}
}
