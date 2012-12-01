package interfaces
{
	import flash.events.IEventDispatcher;

	public interface IGameController extends IEventDispatcher
	{
		function get register():int;

		function moveRobot(robot:IRobot, direction:String, currentLocation:IFloor = null):void;
		function rotateRobot(robot:IRobot, direction:String):void;
		function checkpointReached(robot:IRobot, requiredCheckpoint:IFloor, currentLocation:IFloor):void;
	}
}
