package interfaces
{
	import flash.events.IEventDispatcher;

	public interface IGameController extends IEventDispatcher
	{
		function moveRobot(robot:IRobot, direction:String, currentLocation:IFloor = null):void;
		function rotateRobot(robot:IRobot, direction:String):void;
	}
}
