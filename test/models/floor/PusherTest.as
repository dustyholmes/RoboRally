package models.floor
{
	import constants.Direction;

	import events.ControllerEvent;

	import flash.events.Event;

	import interfaces.IGameController;
	import interfaces.IRobot;

	import mockolate.mock;
	import mockolate.nice;
	import mockolate.prepare;
	import mockolate.received;

	import org.flexunit.assertThat;
	import org.flexunit.async.Async;

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

		[BeforeClass(async, timeout=5000)]
		public static function prepareMockolates():void
		{
			Async.proceedOnEvent(PusherTest,
					prepare(IGameController, IRobot),
					Event.COMPLETE);
		}

		[Before]
		public function setUp():void
		{
			gameController = nice(IGameController);

			mock(gameController).asEventDispatcher();
		}

		[After]
		public function tearDown():void
		{
			gameController = null;
		}

		[Test]
		public function testPushOccupant():void
		{
			var robot:IRobot = nice(IRobot);
			var registers:Vector.<int>

			//Test when the phase is right for the pusher
			registers = new Vector.<int>();
			registers.push(0);
			pusher = new Pusher(gameController, Direction.UP, registers);
			pusher.occupant = robot;

			gameController.dispatchEvent(new ControllerEvent(ControllerEvent.PUSH));

			assertThat(gameController, received().method("moveRobot").times(1));
			assertThat(gameController, received().method("moveRobot").args(robot, Direction.UP, pusher));

			//Make sure this version of the pusher is invalidated
			pusher.occupant = null;

			//Test when the phase is wrong for the pusher
			registers = new Vector.<int>();
			registers.push(1);
			pusher = new Pusher(gameController, Direction.UP, registers);
			pusher.occupant = robot;

			gameController.dispatchEvent(new ControllerEvent(ControllerEvent.PUSH));

			assertThat(gameController, received().method("moveRobot").times(1));
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
