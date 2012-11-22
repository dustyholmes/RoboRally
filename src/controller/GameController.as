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

		//--------------------------------------------------------------------------
		//
		//  Public Methods
		//
		//--------------------------------------------------------------------------

		public function moveRobot(robot:IRobot, direction:String, currentLocation:IFloor = null):void
		{
			if (!DirectionUtil.isValid(direction))
				return;

			board.moveRobot(robot, direction, currentLocation);
		}

		public function rotateRobot(robot:IRobot, direction:String):void
		{
			if (!DirectionUtil.isValidRotation(direction))
				return;

			robot.rotate(direction);
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
