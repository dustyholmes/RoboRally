package models.floor
{
	import controller.mocks.MockGameController;

	import models.mocks.MockRobot;

	import org.flexunit.asserts.assertEquals;

	public class CheckpointTest
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

		public function CheckpointTest()
		{
		}

		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------
		private var boardElement:Checkpoint;
		private var gameController:MockGameController;

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
			boardElement = new Checkpoint(gameController);
		}

		[After]
		public function tearDown():void
		{
			gameController = null;
			boardElement = null;
		}

		[Test]
		public function testOccupant():void
		{
			var robot:MockRobot = new MockRobot();
			
			//A robot entering a checkpoint
			boardElement.occupant = robot;

			assertEquals(1, gameController.received("checkpointReached").count);
			assertEquals(robot, gameController.received("checkpointReached").args[0]);
			assertEquals(null, gameController.received("checkpointReached").args[1]);
			assertEquals(boardElement, gameController.received("checkpointReached").args[2]);

			//A robot leaving a checkpoint
			boardElement.occupant = null;

			assertEquals(1, gameController.received("checkpointReached").count);

			//A robot entering a checkpoint with a requirement
			var checkpointWithRequirement:Checkpoint = new Checkpoint(gameController, boardElement);
			checkpointWithRequirement.occupant = robot;

			assertEquals(2, gameController.received("checkpointReached").count);
			assertEquals(robot, gameController.received("checkpointReached").args[0]);
			assertEquals(boardElement, gameController.received("checkpointReached").args[1]);
			assertEquals(checkpointWithRequirement, gameController.received("checkpointReached").args[2]);
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
