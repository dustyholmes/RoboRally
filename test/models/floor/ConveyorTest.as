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

		[BeforeClass(async, timeout=5000)]
		public static function prepareMockolates():void
		{
			Async.proceedOnEvent(ConveyorTest,
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
		public function testOccupant():void
		{
			var robot:IRobot = nice(IRobot);

			//When rotation is not set, occupants should not rotate
			conveyor = new Conveyor(gameController, Direction.UP);
			conveyor.occupant = robot;

			assertThat(gameController, received().method("rotateRobot").never());

			//When rotation is set, occupant should rotate
			conveyor = new Conveyor(gameController, Direction.UP, Direction.RIGHT);
			conveyor.occupant = robot;

			assertThat(gameController, received().method("rotateRobot").times(1));
			assertThat(gameController, received().method("rotateRobot").args(robot, Direction.RIGHT));

			//When the rotation was invalid, the occupant should not rotate
			conveyor = new Conveyor(gameController, Direction.UP, Direction.UP);
			conveyor.occupant = robot;

			assertThat(gameController, received().method("rotateRobot").times(1));
		}

		[Test]
		public function testConvey():void
		{
			var robot:IRobot = nice(IRobot);

			conveyor = new Conveyor(gameController, Direction.UP);
			conveyor.occupant = robot;

			gameController.dispatchEvent(new ControllerEvent(ControllerEvent.CONVEY));

			assertThat(gameController, received().method("moveRobot").times(1));
			assertThat(gameController, received().method("moveRobot").args(robot, Direction.UP, conveyor));

			//Regular conveyors should not convey on EXPRESS_CONVEY
			gameController.dispatchEvent(new ControllerEvent(ControllerEvent.EXPRESS_CONVEY));

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
