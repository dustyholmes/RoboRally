package models
{
	import constants.Direction;

	import controller.mocks.MockGameController;

	import events.ControllerEvent;

	import interfaces.IGameController;
	import interfaces.IRobot;

	import models.mocks.MockRobot;

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

		protected var gameController:IGameController;
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

			//assert that the occupant has not rotated

			//When rotation is set, occupant should rotate
			conveyor = new Conveyor(gameController, Direction.UP, Direction.RIGHT);
			conveyor.occupant = robot;

			//assert that the occupant has rotated

			//When the rotation was invalid, the occupant should not rotate
			conveyor = new Conveyor(gameController, Direction.UP, Direction.UP);
			conveyor.occupant = robot;

			//assert that the occupant has not rotated
		}

		[Test]
		public function testConvey():void
		{
			conveyor = new Conveyor(gameController, Direction.UP);
			var robot:IRobot = new MockRobot();
			conveyor.occupant = robot;

			gameController.dispatchEvent(new ControllerEvent(ControllerEvent.CONVEY));

			//assert that the robot has moved up

			gameController.dispatchEvent(new ControllerEvent(ControllerEvent.EXPRESS_CONVEY));

			//assert that the robot has not moved
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
