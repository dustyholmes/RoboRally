package interfaces
{
	public interface IBoard
	{
		function moveRobot(robot:IRobot, direction:String, currentLocation:IFloor = null):void
	}
}
