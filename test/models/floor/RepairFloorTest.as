package models.floor
{
	import controller.mocks.MockGameController;

	import events.ControllerEvent;

	import interfaces.IRobot;

	import models.mocks.MockRobot;

	import org.flexunit.asserts.assertEquals;

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
			boardElement = new RepairFloor(controller);
		}

		[After]
		public function tearDown():void
		{
			controller = null;
			boardElement = null;
		}

		[Test]
		public function testRepairOccupant():void
		{
			var robot:IRobot = new MockRobot();

			//No occupant, no exceptions
			controller.dispatchEvent(new ControllerEvent(ControllerEvent.REPAIR));

			assertEquals(0, controller.received("repairRobot").count);

			//repair is executed on the occupant
			boardElement.occupant = robot;
			controller.dispatchEvent(new ControllerEvent(ControllerEvent.REPAIR));

			assertEquals(1, controller.received("repairRobot").count);
			assertEquals(robot, controller.received("repairRobot").args[0]);
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
