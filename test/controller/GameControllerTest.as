package controller
{
	import constants.Direction;

	import flash.events.Event;

	import interfaces.IBoard;
	import interfaces.IFloor;
	import interfaces.IGameController;
	import interfaces.IRobot;

	import mockolate.nice;
	import mockolate.prepare;
	import mockolate.received;

	import org.flexunit.assertThat;
	import org.flexunit.async.Async;

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

		[BeforeClass(async, timeout=5000)]
		public static function prepareMockolates():void
		{
			Async.proceedOnEvent(GameControllerTest,
					prepare(IFloor, IRobot, IBoard),
					Event.COMPLETE);
		}

		[Before]
		public function setUp():void
		{
			board = nice(IBoard);
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
			var robot:IRobot = nice(IRobot);
			var floor:IFloor = nice(IFloor);

			//move with no floor
			gameController.moveRobot(robot, Direction.UP);

			assertThat(board, received().method("moveRobot").times(1));
			assertThat(board, received().method("moveRobot").args(robot, Direction.UP, null));

			//Move with a floor
			gameController.moveRobot(robot, Direction.DOWN, floor);

			assertThat(board, received().method("moveRobot").times(2));
			assertThat(board, received().method("moveRobot").args(robot, Direction.DOWN, floor));

			//Bad direction
			gameController.moveRobot(robot, "invalid");

			assertThat(board, received().method("moveRobot").times(2));
		}

		[Test]
		public function testRotateRobot():void
		{
			var robot:IRobot = nice(IRobot);

			//Rotate with a valid direction
			gameController.rotateRobot(robot, Direction.LEFT);

			assertThat(robot, received().method("rotate").times(1));
			assertThat(robot, received().method("rotate").args(Direction.LEFT));

			//Rotate with an invalid direction
			gameController.rotateRobot(robot, Direction.UP);

			assertThat(robot, received().method("rotate").times(1));
		}

		[Test]
		public function testCheckpointReached():void
		{
			var robot:IRobot = nice(IRobot);
			var floor:IFloor = nice(IFloor);

			//No robot operation should be aborted
			gameController.checkpointReached(null, null, floor);

			assertThat(robot, received().setter("lastCheckpoint").times(0));

			//No currentLocation operation should be aborted
			gameController.checkpointReached(robot, null, null);

			assertThat(robot, received().setter("lastCheckpoint").times(0));

			//preconditions not met operation should be aborted
			gameController.checkpointReached(robot, floor, floor);

			assertThat(robot, received().setter("lastCheckpoint").times(0));

			//preconditions met, assert robot updates.
			gameController.checkpointReached(robot, null, floor);

			assertThat(robot, received().setter("lastCheckpoint").times(1));
			assertThat(robot, received().setter("lastCheckpoint").args(floor));
		}

		[Test]
		public function testRepairRobot():void
		{
			var robot:IRobot = nice(IRobot);

			//No robot: Operation is aborted
			gameController.repairRobot(null);

			assertThat(robot, received().method("takeDamage").times(0));

			//Robot is repaired.
			gameController.repairRobot(robot);

			assertThat(robot, received().method("takeDamage").times(1));
			assertThat(robot, received().method("takeDamage").args(-1));
		}

		[Test]
		public function testUpgradeRobot():void
		{
			//TODO: Test that the robot gets upgraded.
		}

		[Test]
		public function testDamageRobot():void
		{
			var robot:IRobot = nice(IRobot);

			//No robot, no exceptions
			gameController.damageRobot(null, 0);
			assertThat(robot, received().method("takeDamage").times(0));

			//Robot takes damage
			gameController.damageRobot(robot, 1);

			assertThat(robot, received().method("takeDamage").times(1));
			assertThat(robot, received().method("takeDamage").args(1));
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
