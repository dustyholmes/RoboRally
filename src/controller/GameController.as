package controller
{
	import flash.events.EventDispatcher;

	import interfaces.IBoard;
	import interfaces.IFloor;
	import interfaces.IGameController;
	import interfaces.IRobot;

	import utils.DirectionUtil;

	public class GameController extends EventDispatcher implements IGameController
	{
		//--------------------------------------------------------------------------
		//
		//  Class Constants
		//
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------

		public function GameController(robots:Vector.<IRobot>, board:IBoard)
		{
			this.robots = robots;
			this.board = board;
		}

		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------

		protected var robots:Vector.<IRobot>;
		protected var board:IBoard;

		//--------------------------------------------------------------------------
		//
		//  Properties
		//
		//--------------------------------------------------------------------------

		//----------------------------------
		//  register
		//----------------------------------
		private var _register:int = 1;

		public function get register():int
		{
			return _register;
		}
		//--------------------------------------------------------------------------
		//
		//  Public Methods
		//
		//--------------------------------------------------------------------------

		public function checkpointReached(robot:IRobot, requiredCheckpoint:IFloor, currentLocation:IFloor):void
		{
			if (!robot || !currentLocation || robot.lastCheckpoint != requiredCheckpoint)
				return;

			robot.lastCheckpoint = currentLocation;
		}

		public function damageRobot(robot:IRobot, damage:uint):void
		{
			if (!robot)
				return;

			robot.takeDamage(damage);
		}

		public function moveRobot(robot:IRobot, direction:String, currentLocation:IFloor = null):void
		{
			if (!DirectionUtil.isValid(direction))
				return;

			board.moveRobot(robot, direction, currentLocation);
		}

		public function repairRobot(robot:IRobot):void
		{
			if (!robot)
				return;

			robot.takeDamage(-1);
		}

		public function rotateRobot(robot:IRobot, direction:String):void
		{
			if (!DirectionUtil.isValidRotation(direction))
				return;

			robot.rotate(direction);
		}

		public function upgradeRobot(robot:IRobot):void
		{
			//TODO: Upgrade the robot perhaps?
		}

		//--------------------------------------------------------------------------
		//
		//  Protected Methods
		//
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//
		//  Private Methods
		//
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//
		//  Overrides
		//
		//--------------------------------------------------------------------------
	}
}
