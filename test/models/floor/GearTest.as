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

		[BeforeClass(async, timeout=5000)]
		public static function prepareMockolates():void
		{
			Async.proceedOnEvent(GearTest,
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
		public function testRotateOccupant():void
		{
			var robot:IRobot = nice(IRobot);

			gear = new Gear(gameController, Direction.LEFT);
			gear.occupant = robot;
			gameController.dispatchEvent(new ControllerEvent(ControllerEvent.ROTATE));

			assertThat(gameController, received().method('rotateRobot').times(1));
			assertThat(gameController, received().method('rotateRobot').args(robot, Direction.LEFT));
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
