package models
{
	import constants.Direction;

	import interfaces.IFloor;
	import interfaces.IPassage;

	import models.mocks.MockFloor;

	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertNull;

	public class PassageTest
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

		public function PassageTest()
		{
		}

		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------

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

		}

		[After]
		public function tearDown():void
		{

		}


		[Test]
		public function testConstructor():void
		{
			var floorA:IFloor = new MockFloor();
			var floorB:IFloor = new MockFloor();

			var passage:IPassage = new Passage(floorA, floorB, true, Direction.UP);

			assertEquals(floorA, passage.from);
			assertEquals(floorB, passage.to);
			assertEquals(true, passage.hasWall);
			assertEquals(Direction.UP, passage.laserDirection);

			//Lasers require a wall
			passage = new Passage(floorA, floorB, false, Direction.UP);

			assertNull(passage.laserDirection);

			passage = new Passage(floorA, floorA);

			assertNull(passage.to);

			floorA = null;
			floorB = null;
			passage = null;
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
