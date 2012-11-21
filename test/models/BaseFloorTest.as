package models
{
	import controller.mocks.MockGameController;

	import interfaces.IGameController;
	import interfaces.IRobot;

	import models.mocks.MockRobot;

	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertNull;

	public class BaseFloorTest
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

		public function BaseFloorTest()
		{
		}

		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------

		private var boardElement:BaseFloor;
		private var controller:IGameController;

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
			boardElement = new BaseFloor(controller);
		}

		[After]
		public function tearDown():void
		{
			controller = null;
			boardElement = null;
		}

		[Test]
		public function testOccupant():void
		{
			var robot:IRobot = new MockRobot();

			assertNull(boardElement.occupant);

			boardElement.occupant = robot;

			assertEquals(robot, boardElement.occupant);
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
