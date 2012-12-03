package models.deck
{
	import constants.Upgrades;

	import interfaces.ICard;
	import interfaces.IUpgrade;

	import org.flexunit.asserts.assertEquals;

	import org.flexunit.asserts.assertNotNull;

	public class UpgradeDeckTest
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

		public function UpgradeDeckTest()
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
		public function testDraw():void
		{
			var deck:UpgradeDeck = new UpgradeDeck();

			//Verify that draw gets you an IUpgrade
			var upgrade:IUpgrade = deck.draw() as IUpgrade;

			assertNotNull(upgrade);
			assertEquals(deck, upgrade.deck);
		}

		[Test]
		public function testBuildDeck():void
		{
			var deck:UpgradeDeck = new UpgradeDeck();
			var expectedUpgrades:Vector.<ICard> = Upgrades.getCards();
			var actualUpgrades:Vector.<ICard> = new Vector.<ICard>();

			var upgrade:ICard = deck.draw();
			while (upgrade)
			{
				actualUpgrades.push(upgrade);
				upgrade = deck.draw();
			}

			assertEquals(expectedUpgrades.length, actualUpgrades.length);
		}

		[Test]
		public function testDiscard():void
		{
			//TODO: Implement if/when this can be verified
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
