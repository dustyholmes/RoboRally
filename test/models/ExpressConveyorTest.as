package models
{
	import constants.Direction;

	import events.ControllerEvent;

	import interfaces.IRobot;

	import models.mocks.MockRobot;

	public class ExpressConveyorTest extends ConveyorTest
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
		public override function setUp():void
		{
			super.setUp();
		}

		[After]
		public override function tearDown():void
		{
			super.tearDown();
		}

		[Test]
		public function testExpressConvey():void
		{
			conveyor = new Conveyor(gameController, Direction.UP);
			var robot:IRobot = new MockRobot();
			conveyor.occupant = robot;

			gameController.dispatchEvent(new ControllerEvent(ControllerEvent.EXPRESS_CONVEY));

			//assert that the robot has moved up
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
