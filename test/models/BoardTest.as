package models
{
	import constants.Direction;

	import flash.events.Event;

	import interfaces.IFloor;
	import interfaces.IPassage;
	import interfaces.IRobot;

	import mockolate.nice;
	import mockolate.prepare;
	import mockolate.received;
	import mockolate.stub;

	import org.flexunit.assertThat;
	import org.flexunit.async.Async;

	public class BoardTest
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

		public function BoardTest()
		{
		}

		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------

		private var board:Board;

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
			Async.proceedOnEvent(BoardTest,
					prepare(IFloor, IRobot, IPassage),
					Event.COMPLETE);
		}

		[Before]
		public function setUp():void
		{
			board = new Board();
		}

		[After]
		public function tearDown():void
		{
			board = null;
		}

		[Test]
		public function testMoveRobotValid():void
		{
			var robot:IRobot = nice(IRobot);
			var floorA:IFloor = nice(IFloor);
			var floorB:IFloor = nice(IFloor);
			var passage:IPassage = nice(IPassage);

			stub(floorA).getter("occupant").returns(robot);
			stub(floorB).getter("occupant").returns(null);
			stub(passage).getter("to").returns(floorA);
			stub(passage).getter("from").returns(floorB);
			stub(passage).getter("hasWall").returns(false);

			board.addMapEntry(floorA, passage, null, null, null);
			board.addMapEntry(floorB, null, passage, null, null);

			//Everything is valid and passed
			board.moveRobot(robot, Direction.UP, floorA);

			assertThat(floorA, received().setter("occupant").args(null));
			assertThat(floorB, received().setter("occupant").args(robot));

			//Missing floor, the robot is found properly
			board.moveRobot(robot, Direction.UP);

			assertThat(floorA, received().setter("occupant").args(null));
			assertThat(floorB, received().setter("occupant").args(robot));
		}

		[Test]
		public function testMoveRobotNoMap():void
		{
			var robot:IRobot = nice(IRobot);
			var floorA:IFloor = nice(IFloor);

			stub(floorA).getter("occupant").returns(robot);

			//Everything is valid and passed
			board.moveRobot(robot, Direction.UP, floorA);

			assertThat(floorA, received().setter("occupant").times(0));
		}

		[Test]
		public function testMoveRobotInFromPosition():void
		{
			var robot:IRobot = nice(IRobot);
			var floorA:IFloor = nice(IFloor);
			var floorB:IFloor = nice(IFloor);
			var passage:IPassage = nice(IPassage);

			stub(floorA).getter("occupant").returns(null);
			stub(floorB).getter("occupant").returns(robot);
			stub(passage).getter("to").returns(floorA);
			stub(passage).getter("from").returns(floorB);
			stub(passage).getter("hasWall").returns(false);

			board.addMapEntry(floorA, passage, null, null, null);
			board.addMapEntry(floorB, null, passage, null, null);

			//currentLocation is passage.from
			board.moveRobot(robot, Direction.DOWN, floorB);

			assertThat(floorA, received().setter("occupant").args(robot));
			assertThat(floorB, received().setter("occupant").args(null));
		}

		[Test]
		public function testMoveRobotThroughWall():void
		{
			var robot:IRobot = nice(IRobot);
			var floorA:IFloor = nice(IFloor);
			var floorB:IFloor = nice(IFloor);
			var passage:IPassage = nice(IPassage);

			stub(floorA).getter("occupant").returns(robot);
			stub(floorB).getter("occupant").returns(null);
			stub(passage).getter("to").returns(floorA);
			stub(passage).getter("from").returns(floorB);
			stub(passage).getter("hasWall").returns(true);

			board.addMapEntry(floorA, passage, null, null, null);
			board.addMapEntry(floorB, null, passage, null, null);

			//currentLocation is passage.from
			board.moveRobot(robot, Direction.UP, floorA);

			assertThat(floorA, received().setter("occupant").times(0));
			assertThat(floorB, received().setter("occupant").times(0));
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