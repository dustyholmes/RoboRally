package models.floor
{
	import controller.mocks.MockGameController;

	import interfaces.IFloor;

	import models.*;
	import models.mocks.MockRobot;

	import org.flexunit.asserts.assertEquals;

	public class HoleTest
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

		public function HoleTest()
		{
		}

		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------

		protected var gameController:MockGameController;

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
		public function testOccupant():void
		{
			//When an occupant enters a hole, it should take a lethal amount of damage.
			var hole:IFloor = new Hole(gameController);
			var robot:MockRobot = new MockRobot();

			hole.occupant = robot;

			assertEquals(1, gameController.received("damageRobot").count);
			assertEquals(robot, gameController.received("damageRobot").args[0]);
			assertEquals(Robot.LETHAL_DAMAGE, gameController.received("damageRobot").args[1]);
		}
	}
}
