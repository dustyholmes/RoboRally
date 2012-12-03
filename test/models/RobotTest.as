package models
{
	import constants.Direction;

	import events.RobotEvent;

	import flash.events.Event;

	import interfaces.IFloor;
	import interfaces.IRobot;
	import interfaces.IUpgrade;

	import mockolate.nice;
	import mockolate.prepare;

	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.async.Async;

	public class RobotTest
	{
		//--------------------------------------------------------------------------
		//
		//  Class Constants
		//
		//--------------------------------------------------------------------------

		protected const NAME:String = "robot";

		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------

		public function RobotTest()
		{
		}

		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------

		protected var robot:IRobot;

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
			Async.proceedOnEvent(RobotTest,
					prepare(IFloor, IUpgrade),
					Event.COMPLETE);
		}

		[Before]
		public function setUp():void
		{
			robot = new Robot(NAME);
		}

		[After]
		public function tearDown():void
		{
			robot = null;
		}


		[Test]
		public function testDefaults():void
		{
			assertEquals(Direction.UP, robot.direction);
			assertEquals(NAME, robot.name);
			assertEquals(0, robot.damage);
			assertEquals(3, robot.lives);
			assertFalse(robot.isPoweredDown);
			assertNotNull(robot.upgrades);
			assertEquals(0, robot.upgrades.length);
			assertNotNull(robot.program);
			assertEquals(0, robot.program.length);
		}

		[Test]
		public function testRemoveUpgrade():void
		{
			var upgrade:IUpgrade = nice(IUpgrade);

			//Verify that nothing awful happens if an invalid upgrade is removed.
			robot.removeUpgrade(upgrade);

			//Verify that the upgrade can be removed.
			robot.addUpgrade(upgrade);
			robot.removeUpgrade(upgrade);

			assertEquals(0, robot.upgrades.length);

			upgrade = null;
		}

		[Test]
		public function testRotate():void
		{
			//Robot should not rotate given an invalid parameter
			robot.rotate(Direction.UP);

			assertEquals(Direction.UP, robot.direction);

			//Rotate right
			robot.rotate((Direction.RIGHT));

			assertEquals(Direction.RIGHT, robot.direction);

			//Rotate left
			robot.rotate(Direction.LEFT);

			assertEquals(Direction.UP, robot.direction);
		}

		[Test]
		public function testAddUpgrade():void
		{
			var upgrade:IUpgrade = nice(IUpgrade);

			//Verify that the upgrade is added
			robot.addUpgrade(upgrade);

			assertEquals(1, robot.upgrades.length);
			assertEquals(upgrade,  robot.upgrades[0]);

			//Verify that the upgrade cannot be added again
			robot.addUpgrade(upgrade);

			assertEquals(1, robot.upgrades.length);

			upgrade = null;
		}

		[Test]
		public function testTakeDamage():void
		{
			var destroyedCount:int = 0;
			var eliminatedCount:int = 0;

			var destroyedHandler:Function = function():void
			{
				destroyedCount++;
			}

			var eliminatedHandler:Function = function ():void
			{
				eliminatedCount++;
			}

			robot.addEventListener(RobotEvent.DESTROYED, destroyedHandler);
			robot.addEventListener(RobotEvent.ELIMINATED, eliminatedHandler);

			robot.takeDamage(-1);

			assertEquals(0, robot.damage);
			assertEquals(3, robot.lives);

			robot.takeDamage(4);

			assertEquals(4, robot.damage);
			assertEquals(3, robot.lives);

			robot.takeDamage(-1);

			assertEquals(3, robot.damage);
			assertEquals(3, robot.lives);

			robot.takeDamage(15);

			assertEquals(2, robot.damage);
			assertEquals(2, robot.lives);
			assertEquals(1, destroyedCount);
			assertEquals(0, eliminatedCount);

			robot.takeDamage(10);
			robot.takeDamage(10);

			assertEquals(0, robot.lives);
			assertEquals(3, destroyedCount);
			assertEquals(1, eliminatedCount);
		}

		[Test]
		public function testSetLastCheckpoint():void
		{
			var floor:IFloor = nice(IFloor);

			//Archive updates when lastCheckpoint updates
			robot.lastCheckpoint = floor;

			assertEquals(floor, robot.archiveLocation);

			//Archive location doesn't update on null lastCheckpoint
			robot.lastCheckpoint = null;

			assertEquals(floor, robot.archiveLocation);
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
