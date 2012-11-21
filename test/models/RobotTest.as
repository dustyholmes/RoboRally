package models
{
	import constants.Direction;

	import events.RobotEvent;

	import interfaces.IRobot;
	import interfaces.IUpgrade;

	import models.mocks.MockUpgrade;

	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.asserts.assertNull;

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
			var upgrade:IUpgrade = new MockUpgrade();

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
			var upgrade:IUpgrade = new MockUpgrade();

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

			robot.takeDamage(3);

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
