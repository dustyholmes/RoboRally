package models
{
	import constants.Direction;

	import controller.mocks.MockGameController;

	import events.ControllerEvent;

	import interfaces.IGameController;
	import interfaces.IRobot;

	import models.mocks.MockRobot;

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

		protected  var gameController:IGameController;
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
			pusher = new Pusher(gameController, Direction.UP);
			var robot:IRobot = new MockRobot();
			pusher.occupant = robot;
			gameController.dispatchEvent(new ControllerEvent(ControllerEvent.PUSH));

			//assert that the robot has moved

			//Test when the phase is wrong for the pusher
			pusher = new Pusher(gameController, Direction.UP);
			pusher.occupant = robot;
			gameController.dispatchEvent(new ControllerEvent(ControllerEvent.PUSH));

			//assert that the robot hasn't moved
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
