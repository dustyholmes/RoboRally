package models.floor
{
	import constants.Direction;

	import controller.mocks.MockGameController;

	import events.ControllerEvent;

	import interfaces.IRobot;

	import models.floor.ExpressConveyor;

	import models.mocks.MockRobot;

	import org.flexunit.asserts.assertEquals;

	public class ExpressConveyorTest
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

		public function ExpressConveyorTest()
		{
			super();
		}

		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------

		protected var gameController:MockGameController;
		protected var conveyor:ExpressConveyor;

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
		public function testExpressConvey():void
		{
			conveyor = new ExpressConveyor(gameController, Direction.UP);
			var robot:IRobot = new MockRobot();
			conveyor.occupant = robot;

			gameController.dispatchEvent(new ControllerEvent(ControllerEvent.EXPRESS_CONVEY));

			assertEquals(1, gameController.received("moveRobot").count);
			assertEquals(3, gameController.received("moveRobot").args.length);
			assertEquals(robot, gameController..received("moveRobot").args[0]);
			assertEquals(Direction.UP, gameController.received("moveRobot").args[1]);
			assertEquals(conveyor, gameController.received("moveRobot").args[2]);
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
