package models.deck
{
	import constants.Upgrades;

	import interfaces.ICard;
	import interfaces.IUpgrade;

	public class UpgradeDeck extends AbstractDeck
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

		public function UpgradeDeck()
		{
			super();
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

		override public function discard(card:ICard):void
		{
			if (card is IUpgrade)
				super.discard(card);
		}

		//--------------------------------------------------------------------------
		//
		//  Protected Methods
		//
		//--------------------------------------------------------------------------

		override protected function buildDeck():void
		{
			this.discarded = Upgrades.getCards();
			shuffle();

			//Associate all of the cards back to this deck
			for each (var card:ICard in available)
				card.deck = this;
		}

		//--------------------------------------------------------------------------
		//
		//  Private Methods
		//
		//--------------------------------------------------------------------------
	}
}
