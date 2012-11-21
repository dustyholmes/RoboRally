package controller
{
	import constants.Direction;

	import interfaces.IBoard;

	import interfaces.IGameController;
	import interfaces.IRobot;

	import models.mocks.MockBoard;

	import models.mocks.MockRobot;

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
		private var board:IBoard;

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

			gameController.moveRobot(robot, Direction.UP);
			//Assert that the robot has moved up.

			gameController.moveRobot(robot, Direction.DOWN);
			//assert that the robot has moved down

			gameController.moveRobot(robot, Direction.LEFT);
			//assert that the robot has moved left

			gameController.moveRobot(robot, Direction.RIGHT);
			//assert that the robot has moved right

			gameController.moveRobot(robot, "invalid");
			//assert that the robot has not moved
		}

		[Test]
		public function testRotateRobot():void
		{
			var robot:IRobot = new MockRobot();

			gameController.rotateRobot(robot, Direction.LEFT);
			//assert that the robot has rotated left

			gameController.rotateRobot(robot, Direction.RIGHT);
			//assert that the robot has rotated right

			gameController.rotateRobot(robot, Direction.UP);
			//assert that the robot has not rotated
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
