package models.floor
{
	import flash.events.Event;

	import interfaces.IGameController;
	import interfaces.IRobot;

	import mockolate.nice;
	import mockolate.prepare;
	import mockolate.received;

	import org.flexunit.assertThat;
	import org.flexunit.async.Async;

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
			Async.proceedOnEvent(CheckpointTest,
					prepare(IGameController, IRobot),
					Event.COMPLETE);
		}

		[Before]
		public function setUp():void
		{
			gameController = nice(IGameController);
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
			var robot:IRobot = nice(IRobot);
			
			//A robot entering a checkpoint
			boardElement.occupant = robot;

			assertThat(gameController, received().method('checkpointReached').times(1));
			assertThat(gameController, received().method('checkpointReached').args(robot, null, boardElement));

			//A robot leaving a checkpoint
			boardElement.occupant = null;

			assertThat(gameController, received().method('checkpointReached').times(1));

			//A robot entering a checkpoint with a requirement
			var checkpointWithRequirement:Checkpoint = new Checkpoint(gameController, boardElement);
			checkpointWithRequirement.occupant = robot;

			assertThat(gameController, received().method('checkpointReached').times(2));
			assertThat(gameController, received().method('checkpointReached').args(robot, boardElement, checkpointWithRequirement));
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
