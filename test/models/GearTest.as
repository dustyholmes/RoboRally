package models
{
	import constants.Direction;

	import controller.mocks.MockGameController;

	import events.ControllerEvent;

	import interfaces.IGameController;
	import interfaces.IRobot;

	import models.mocks.MockRobot;

	public class GearTest
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

		public function GearTest()
		{
		}

		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------

		protected var gameController:IGameController;
		protected var gear:Gear;

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

		[Before]
		public function setUp():void
		{
			gameController = new MockGameController();
		}

		[After]
		public function tearDown():void
		{
			gameController = null;
		}


		[Test]
		public function testRotateOccupant():void
		{
			gear = new Gear(gameController, Direction.LEFT);
			var robot:IRobot = new MockRobot();
			gear.occupant = robot;
			gameController.dispatchEvent(new ControllerEvent(ControllerEvent.ROTATE));

			//assert that the robot has rotated...
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
