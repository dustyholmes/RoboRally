package models.floor
{
	import flash.events.Event;

	import interfaces.IGameController;
	import interfaces.IRobot;

	import mockolate.nice;
	import mockolate.prepare;

	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertNull;
	import org.flexunit.async.Async;

	public class BaseFloorTest
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

		public function BaseFloorTest()
		{
		}

		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------

		private var boardElement:BaseFloor;
		private var controller:IGameController;

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
			Async.proceedOnEvent(BaseFloorTest,
					prepare(IGameController, IRobot),
					Event.COMPLETE);
		}

		[Before]
		public function setUp():void
		{
			controller = nice(IGameController);
			boardElement = new BaseFloor(controller);
		}

		[After]
		public function tearDown():void
		{
			controller = null;
			boardElement = null;
		}

		[Test]
		public function testOccupant():void
		{
			var robot:IRobot = nice(IRobot);

			assertNull(boardElement.occupant);

			boardElement.occupant = robot;

			assertEquals(robot, boardElement.occupant);
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
