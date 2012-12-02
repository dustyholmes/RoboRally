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

	public class UpgradeFloorTest
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

		public function UpgradeFloorTest()
		{
		}

		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------
		private var boardElement:UpgradeFloor;
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
			Async.proceedOnEvent(UpgradeFloorTest,
					prepare(IGameController, IRobot),
					Event.COMPLETE);
		}

		[Before]
		public function setUp():void
		{
			gameController = nice(IGameController);

			mock(gameController).asEventDispatcher();

			boardElement = new UpgradeFloor(gameController);
		}

		[After]
		public function tearDown():void
		{
			gameController = null;
			boardElement = null;
		}

		[Test]
		public function testUpgradeOccupant():void
		{
			var robot:IRobot = nice(IRobot);

			//No occupant, no exceptions
			gameController.dispatchEvent(new ControllerEvent(ControllerEvent.REPAIR));

			assertThat(gameController, received().method("upgradeRobot").times(0));

			//upgrade is executed during the repair phase
			boardElement.occupant = robot;
			gameController.dispatchEvent(new ControllerEvent(ControllerEvent.REPAIR));

			assertThat(gameController, received().method("upgradeRobot").times(1));
			assertThat(gameController, received().method("upgradeRobot").args(robot));
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
