package interfaces
{
	import models.MapEntry;

	public interface IBoard
	{
		function get topLeftFloor():IFloor;

		function moveRobot(robot:IRobot, direction:String, currentLocation:IFloor = null):void

		function getMapEntry(floor:IFloor):MapEntry;
	}
}
