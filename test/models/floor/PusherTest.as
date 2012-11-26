package models.floor
{
	import constants.Direction;

	import controller.mocks.MockGameController;

	import events.ControllerEvent;

	import interfaces.IRobot;

	import models.floor.Pusher;

	import models.mocks.MockRobot;

	import org.flexunit.asserts.assertEquals;

	public class PusherTest
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

		public function PusherTest()
		{
		}

		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------

		protected  var gameController:MockGameController;
		protected  var pusher:Pusher;

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
		public function testPushOccupant():void
		{
			//Test when the phase is right for the pusher
			var registers:Vector.<int> = new Vector.<int>();
			registers.push(1);
			pusher = new Pusher(gameController, Direction.UP, registers);
			var robot:IRobot = new MockRobot();
			pusher.occupant = robot;
			gameController.dispatchEvent(new ControllerEvent(ControllerEvent.PUSH));

			assertEquals(1, gameController.received("moveRobot").count);
			assertEquals(3, gameController.received("moveRobot").args.length);
			assertEquals(robot, gameController..received("moveRobot").args[0]);
			assertEquals(Direction.UP, gameController.received("moveRobot").args[1]);
			assertEquals(pusher, gameController.received("moveRobot").args[2]);

			pusher.occupant = null;

			//Test when the phase is wrong for the pusher
			gameController.register = 2;
			pusher = new Pusher(gameController, Direction.UP, registers);
			pusher.occupant = robot;
			gameController.dispatchEvent(new ControllerEvent(ControllerEvent.PUSH));

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
