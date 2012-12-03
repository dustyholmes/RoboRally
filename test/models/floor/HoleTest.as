package models.floor
{
	import flash.events.Event;

	import interfaces.IFloor;
	import interfaces.IGameController;
	import interfaces.IRobot;

	import mockolate.nice;
	import mockolate.prepare;
	import mockolate.received;

	import models.*;

	import org.flexunit.assertThat;
	import org.flexunit.async.Async;

	public class HoleTest
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

		public function HoleTest()
		{
		}

		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------

		protected var gameController:IGameController;

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
			Async.proceedOnEvent(HoleTest,
					prepare(IGameController, IRobot),
					Event.COMPLETE);
		}

		[Before]
		public function setUp():void
		{
			gameController = nice(IGameController);
		}

		[After]
		public function tearDown():void
		{
			gameController = null;
		}

		[Test]
		public function testOccupant():void
		{
			var robot:IRobot = nice(IRobot);
			var hole:IFloor = new Hole(gameController);

			//When an occupant enters a hole, it should take a lethal amount of damage.
			hole.occupant = robot;

			assertThat(gameController, received().method('damageRobot'));
			assertThat(gameController, received().method('damageRobot').args(robot, Robot.LETHAL_DAMAGE));
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
