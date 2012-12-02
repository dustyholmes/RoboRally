package interfaces
{
	import flash.events.IEventDispatcher;

	public interface IGameController extends IEventDispatcher
	{
		function get register():int;

		function checkpointReached(robot:IRobot, requiredCheckpoint:IFloor, currentLocation:IFloor):void;
		function damageRobot(robot:IRobot, damage:uint):void;
		function moveRobot(robot:IRobot, direction:String, currentLocation:IFloor = null):void;
		function repairRobot(robot:IRobot):void;
		function rotateRobot(robot:IRobot, direction:String):void;
		function upgradeRobot(robot:IRobot):void;
	}
}
