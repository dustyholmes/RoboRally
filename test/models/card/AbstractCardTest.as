package models.card
{
	import flash.events.Event;

	import interfaces.IDeck;

	import mockolate.nice;
	import mockolate.prepare;
	import mockolate.received;

	import org.flexunit.asserts.assertNull;

	import org.flexunit.async.Async;

	import org.hamcrest.assertThat;

	public class AbstractCardTest
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

		public function AbstractCardTest()
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
			Async.proceedOnEvent(AbstractCardTest,
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
		public function testDiscard():void
		{
			var card:AbstractCard = new AbstractCard();
			var deck:IDeck = nice(IDeck);

			card.deck = deck;

			card.discard();

			assertThat(deck, received().method("discard").times(1));
			assertThat(deck, received().method("discard").args(card));
		}

		[Test]
		public function testDestroy():void
		{
			var card:AbstractCard = new AbstractCard();
			var deck:IDeck = nice(IDeck);

			card.deck = deck;

			card.destroy();

			assertNull(card.deck);
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
