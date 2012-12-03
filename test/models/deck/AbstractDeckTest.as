package models.deck
{
	import flash.events.Event;

	import interfaces.ICard;
	import interfaces.IDeck;

	import mockolate.nice;

	import mockolate.prepare;

	import org.flexunit.asserts.assertNull;
	import org.flexunit.async.Async;

	public class AbstractDeckTest
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

		public function AbstractDeckTest()
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
			Async.proceedOnEvent(AbstractDeckTest,
					prepare(ICard),
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
			//TODO: This test should do more than verify that there are no errors, right?
			var deck:AbstractDeck = new AbstractDeck();
			var card:ICard = nice(ICard);

			deck.discard(null);
			deck.discard(card);
		}

		[Test]
		public function testDraw():void
		{
			var deck:AbstractDeck = new AbstractDeck();

			//Ensure that draw returns null on an empty deck
			assertNull(deck.draw());
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
