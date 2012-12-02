package models.floor
{
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

	public class RepairFloorTest
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

		public function RepairFloorTest()
		{
		}

		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------
		private var boardElement:RepairFloor;
		private var gameController:IGameController;

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
			Async.proceedOnEvent(RepairFloorTest,
					prepare(IGameController, IRobot),
					Event.COMPLETE);
		}

		[Before]
		public function setUp():void
		{
			gameController = nice(IGameController);

			mock(gameController).asEventDispatcher();

			boardElement = new RepairFloor(gameController);
		}

		[After]
		public function tearDown():void
		{
			gameController = null;
			boardElement = null;
		}

		[Test]
		public function testRepairOccupant():void
		{
			var robot:IRobot = nice(IRobot);

			//No occupant, no exceptions
			gameController.dispatchEvent(new ControllerEvent(ControllerEvent.REPAIR));

			assertThat(gameController, received().method("repairRobot").times(0));

			//repair is executed on the occupant
			boardElement.occupant = robot;
			gameController.dispatchEvent(new ControllerEvent(ControllerEvent.REPAIR));

			assertThat(gameController, received().method("repairRobot").times(1));
			assertThat(gameController, received().method("repairRobot").args(robot));
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
