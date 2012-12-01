package controller
{
	import constants.Direction;

	import interfaces.IFloor;
	import interfaces.IGameController;
	import interfaces.IRobot;

	import models.floor.mocks.MockFloor;
	import models.mocks.MockBoard;
	import models.mocks.MockRobot;

	import org.flexunit.asserts.assertEquals;

	public class GameControllerTest
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

		public function GameControllerTest()
		{
		}

		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------

		private var gameController:IGameController;
		private var board:MockBoard;

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
			board = new MockBoard();
			gameController = new GameController(null, board);
		}

		[After]
		public function tearDown():void
		{
			board = null;
			gameController = null;
		}

		[Test]
		public function testMoveRobot():void
		{
			var robot:IRobot = new MockRobot();
			var floor:IFloor = new MockFloor();

			gameController.moveRobot(robot, Direction.UP);
			assertEquals(1, board.received("moveRobot").count);
			assertEquals(robot, board.received("moveRobot").args[0]);
			assertEquals(Direction.UP, board.received("moveRobot").args[1]);
			assertEquals(null, board.received("moveRobot").args[2]);

			gameController.moveRobot(robot, Direction.DOWN, floor);
			assertEquals(2, board.received("moveRobot").count);
			assertEquals(robot, board.received("moveRobot").args[0]);
			assertEquals(Direction.DOWN, board.received("moveRobot").args[1]);
			assertEquals(floor, board.received("moveRobot").args[2]);

			gameController.moveRobot(robot, "invalid");
			assertEquals(2, board.received("moveRobot").count);
		}

		[Test]
		public function testRotateRobot():void
		{
			var robot:MockRobot = new MockRobot();

			gameController.rotateRobot(robot, Direction.LEFT);
			assertEquals(1, robot.received("rotate").count);
			assertEquals(Direction.LEFT, robot.received("rotate").args[0]);

			gameController.rotateRobot(robot, Direction.RIGHT);
			assertEquals(2, robot.received("rotate").count);
			assertEquals(Direction.RIGHT, robot.received("rotate").args[0]);

			gameController.rotateRobot(robot, Direction.UP);
			assertEquals(2, robot.received("rotate").count);
		}

		[Test]
		public function testCheckpointReached():void
		{
			var robot:MockRobot = new MockRobot();
			var floor:IFloor = new MockFloor();

			//No robot operation should be aborted
			gameController.checkpointReached(null, null, floor);
			assertEquals(0, robot.received("set lastCheckpoint").count);

			//No currentLocation operation should be aborted
			gameController.checkpointReached(robot, null, null);
			assertEquals(0, robot.received("set lastCheckpoint").count);

			//preconditions not met operation should be aborted
			gameController.checkpointReached(robot, floor, floor);
			assertEquals(0, robot.received("set lastCheckpoint").count);

			//preconditions met, assert robot updates.
			gameController.checkpointReached(robot, null, floor);
			assertEquals(1, robot.received("set lastCheckpoint").count);
			assertEquals(floor, robot.received("set lastCheckpoint").args[0]);
		}

		[Test]
		public function testRepairRobot():void
		{
			var robot:MockRobot = new MockRobot();

			//No robot: Operation is aborted
			gameController.repairRobot(null);

			//Robot is repaired.
			gameController.repairRobot(robot);
			assertEquals(1, robot.received("takeDamage").count);
			assertEquals(-1, robot.received("takeDamage").args[0]);
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
