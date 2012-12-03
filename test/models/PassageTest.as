package models
{
	import constants.Direction;

	import flash.events.Event;

	import interfaces.IFloor;
	import interfaces.IPassage;

	import mockolate.nice;
	import mockolate.prepare;

	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertNull;
	import org.flexunit.async.Async;

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

		[BeforeClass(async, timeout=5000)]
		public static function prepareMockolates():void
		{
			Async.proceedOnEvent(PassageTest,
					prepare(IFloor),
					Event.COMPLETE);
		}

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
			var floorA:IFloor = nice(IFloor);
			var floorB:IFloor = nice(IFloor);

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

			floorA = floorB = null;
			passage = null;
		}


		[Test]
		public function testGetPartner():void
		{
			var floorA:IFloor = nice(IFloor);
			var floorB:IFloor = nice(IFloor);
			var floorC:IFloor = nice(IFloor);

			var passage:IPassage = new Passage(floorA, floorB, true, Direction.UP);

			assertEquals(floorB, passage.getPartner(floorA));
			assertEquals(floorA, passage.getPartner(floorB));
			assertNull(passage.getPartner(floorC));

			floorA = floorB = floorC = null;
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
