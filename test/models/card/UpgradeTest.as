package models.card
{
	import flash.events.Event;

	import interfaces.IDeck;

	import mockolate.nice;

	import mockolate.prepare;
	import mockolate.received;

	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertTrue;
	import org.flexunit.async.Async;
	import org.hamcrest.assertThat;

	public class UpgradeTest
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

		public function UpgradeTest()
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
			Async.proceedOnEvent(UpgradeTest,
					prepare(IDeck),
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
		public function testDeactivate():void
		{
			var upgrade:Upgrade = new Upgrade("name", "description");

			upgrade.deactivate();

			assertFalse(upgrade.active);
		}

		[Test]
		public function testActivate():void
		{
			var upgrade:Upgrade = new Upgrade("name", "description");

			upgrade.deactivate();
			upgrade.activate();

			assertTrue(upgrade.active);
		}

		[Test]
		public function testUsed():void
		{
			var upgrade:Upgrade = new Upgrade("name", "description");

			upgrade.used();

			assertEquals(1, upgrade.uses);
		}

		[Test]
		public function testUsedWithMaximum():void
		{
			var upgrade:Upgrade = new Upgrade("name", "description", false, 1);
			var deck:IDeck = nice(IDeck);
			upgrade.deck = deck;

			upgrade.used();

			assertEquals(1, upgrade.uses);
			assertThat(deck, received().method("discard").times(1));
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
