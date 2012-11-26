package models.floor
{
	import constants.Direction;

	import controller.mocks.MockGameController;

	import events.ControllerEvent;

	import interfaces.IRobot;

	import models.floor.Gear;

	import models.mocks.MockRobot;

	import org.flexunit.asserts.assertEquals;

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

		protected var gameController:MockGameController;
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

			assertEquals(1, gameController.received("rotateRobot").count);
			assertEquals(2, gameController.received("rotateRobot").args.length);
			assertEquals(robot, gameController.received("rotateRobot").args[0]);
			assertEquals(Direction.LEFT, gameController.received("rotateRobot").args[1]);
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
