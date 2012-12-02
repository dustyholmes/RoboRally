package models.floor
{
	import controller.mocks.MockGameController;

	import events.ControllerEvent;

	import interfaces.IRobot;

	import models.mocks.MockRobot;

	import org.flexunit.asserts.assertEquals;

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
		private var controller:MockGameController;

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
			controller = new MockGameController();
			boardElement = new UpgradeFloor(controller);
		}

		[After]
		public function tearDown():void
		{
			controller = null;
			boardElement = null;
		}

		[Test]
		public function testUpgradeOccupant():void
		{
			var robot:IRobot = new MockRobot();

			//No occupant, no exceptions
			controller.dispatchEvent(new ControllerEvent(ControllerEvent.REPAIR));

			assertEquals(0, controller.received("upgradeRobot").count);

			//upgrade is executed during the repair phase
			boardElement.occupant = robot;
			controller.dispatchEvent(new ControllerEvent(ControllerEvent.REPAIR));

			assertEquals(1, controller.received("upgradeRobot").count);
			assertEquals(robot, controller.received("upgradeRobot").args[0]);
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
