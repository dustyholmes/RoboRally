package models
{
	import constants.Direction;

	import interfaces.IFloor;
	import interfaces.IPassage;
	import interfaces.IRobot;

	import models.mocks.MockFloor;
	import models.mocks.MockRobot;

	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertNull;

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
		public function testMoveRobot():void
		{
			var robot:IRobot = new MockRobot();
			var floorA:IFloor = new MockFloor();
			var floorB:IFloor = new MockFloor();
			var floorC:IFloor = new MockFloor();
			var passage:IPassage = new Passage(floorA, floorB, false);
			var walled:IPassage = new Passage(floorA, floorC, true);

			floorA.occupant = robot;

			board.addMapEntry(floorA, passage, walled, null, null);

			//Everything is valid and passed
			board.moveRobot(robot, Direction.UP, floorA);

			assertNull(floorA.occupant);
			assertEquals(robot, floorB.occupant);

			//Missing floor, the robot is found properly
			floorA.occupant = robot;
			floorB.occupant = null;
			board.moveRobot(robot, Direction.UP);

			assertNull(floorA.occupant);
			assertEquals(robot, floorB.occupant);

			//No valid map
			board.moveRobot(robot, Direction.UP);

			assertEquals(robot, floorB.occupant);

			//currentLocation is passage.from
			board.addMapEntry(floorB, null, passage, null, null);
			board.moveRobot(robot, Direction.DOWN, floorB);

			assertNull(floorB.occupant);
			assertEquals(robot, floorA.occupant);

			//Doesn't move through walls
			board.moveRobot(robot, Direction.DOWN, floorA);

			assertNull(floorC.occupant);
			assertEquals(robot, floorA.occupant);
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