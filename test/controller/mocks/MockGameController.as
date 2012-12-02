package controller.mocks
{
	import interfaces.IFloor;
	import interfaces.IGameController;
	import interfaces.IRobot;

	import mocks.Mock;

	public class MockGameController extends Mock implements IGameController
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

		public function MockGameController()
		{
		}

		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------

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

		public function set register(value:int):void
		{
			_register = value;
		}

		//--------------------------------------------------------------------------
		//
		//  Public Methods
		//
		//--------------------------------------------------------------------------

		public function checkpointReached(robot:IRobot, requiredCheckpoint:IFloor, currentLocation:IFloor):void
		{
			appendSpyResult("checkpointReached", [robot, requiredCheckpoint, currentLocation]);
		}

		public function damageRobot(robot:IRobot, damage:uint):void
		{
			appendSpyResult("damageRobot", [robot, damage]);
		}

		public function moveRobot(robot:IRobot, direction:String, currentLocation:IFloor = null):void
		{
			appendSpyResult("moveRobot", [robot, direction, currentLocation]);
		}

		public function repairRobot(robot:IRobot):void
		{
			appendSpyResult("repairRobot", [robot]);
		}

		public function rotateRobot(robot:IRobot, direction:String):void
		{
			appendSpyResult("rotateRobot", [robot, direction]);
		}

		public function upgradeRobot(robot:IRobot):void
		{
			appendSpyResult("upgradeRobot", [robot]);
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
	}
}
