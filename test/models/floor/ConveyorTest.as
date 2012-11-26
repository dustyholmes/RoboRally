package models.floor
{
	import constants.Direction;

	import controller.mocks.MockGameController;

	import events.ControllerEvent;

	import interfaces.IRobot;

	import models.floor.Conveyor;

	import models.mocks.MockRobot;

	import org.flexunit.asserts.assertEquals;

	public class ConveyorTest
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

		public function ConveyorTest()
		{
		}

		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------

		protected var gameController:MockGameController;
		protected var conveyor:Conveyor;

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
		public function testOccupant():void
		{
			//When rotation is not set, occupants should not rotate
			conveyor = new Conveyor(gameController, Direction.UP);
			var robot:IRobot = new MockRobot();
			conveyor.occupant = robot;

			assertEquals(0, gameController.received("rotateRobot").count);

			//When rotation is set, occupant should rotate
			conveyor = new Conveyor(gameController, Direction.UP, Direction.RIGHT);
			conveyor.occupant = robot;

			assertEquals(1, gameController.received("rotateRobot").count);
			assertEquals(2, gameController.received("rotateRobot").args.length);
			assertEquals(robot, gameController.received("rotateRobot").args[0]);
			assertEquals(Direction.RIGHT, gameController.received("rotateRobot").args[1]);

			//When the rotation was invalid, the occupant should not rotate
			conveyor = new Conveyor(gameController, Direction.UP, Direction.UP);
			conveyor.occupant = robot;

			assertEquals(1, gameController.received("rotateRobot").count);
		}

		[Test]
		public function testConvey():void
		{
			conveyor = new Conveyor(gameController, Direction.UP);
			var robot:IRobot = new MockRobot();
			conveyor.occupant = robot;

			gameController.dispatchEvent(new ControllerEvent(ControllerEvent.CONVEY));

			assertEquals(1, gameController.received("moveRobot").count);
			assertEquals(3, gameController.received("moveRobot").args.length);
			assertEquals(robot, gameController..received("moveRobot").args[0]);
			assertEquals(Direction.UP, gameController.received("moveRobot").args[1]);
			assertEquals(conveyor, gameController.received("moveRobot").args[2]);

			//Regular conveyors should not convey on EXPRESS_CONVEY
			gameController.dispatchEvent(new ControllerEvent(ControllerEvent.EXPRESS_CONVEY));

			assertEquals(1, gameController.received("moveRobot").count);
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
