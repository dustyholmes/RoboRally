package models.mocks
{
	import interfaces.IBoard;
	import interfaces.IFloor;
	import interfaces.IRobot;

	import mocks.Mock;

	import models.MapEntry;

	public class MockBoard extends Mock implements IBoard
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

		public function MockBoard()
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
			this.appendSpyResult("moveRobot", [robot, direction, currentLocation]);
		}

		//--------------------------------------------------------------------------
		//
		//  Protected Methods
		//
		//--------------------------------------------------------------------------

		public function get topLeftFloor():IFloor
		{
			return null;
		}

		public function getMapEntry(floor:IFloor):MapEntry
		{
			return null;
		}

		//--------------------------------------------------------------------------
		//
		//  Private Methods
		//
		//--------------------------------------------------------------------------
	}
}
