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
		
		//--------------------------------------------------------------------------
		//
		//  Public Methods
		//
		//--------------------------------------------------------------------------

		public function moveRobot(robot:IRobot, direction:String, currentLocation:IFloor = null):void
		{
			appendSpyResult("moveRobot", [robot, direction, currentLocation]);
		}

		public function rotateRobot(robot:IRobot, direction:String):void
		{
			appendSpyResult("rotateRobot", [robot, direction]);
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
