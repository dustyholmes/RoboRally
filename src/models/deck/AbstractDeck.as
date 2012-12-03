package models.deck
{
	import interfaces.ICard;
	import interfaces.IDeck;

	public class AbstractDeck implements IDeck
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

		public function AbstractDeck()
		{
			available = new Vector.<ICard>();
			discarded = new Vector.<ICard>();

			buildDeck();
		}

		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------

		protected var available:Vector.<ICard>;
		protected var discarded:Vector.<ICard>;

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

		public function draw():ICard
		{
			if (!available.length)
				shuffle();

			return available.pop();
		}

		public function discard(card:ICard):void
		{
			if (card)
				this.discarded.push(card);
		}

		//--------------------------------------------------------------------------
		//
		//  Protected Methods
		//
		//--------------------------------------------------------------------------

		protected function buildDeck():void
		{
			//Subclasses should implement this method.
		}

		protected function shuffle():void
		{
			for (var i:int = discarded.length - 1; i > 0; i--)
			{
				var swap:int = Math.round(Math.random() * i);

				if (swap != i)
				{
					var tmp:ICard = discarded[swap];
					discarded[swap] = discarded[i];
					discarded[i] = tmp;
				}
			}

			available = available.concat(discarded);
			discarded = new Vector.<ICard>();
		}

		//--------------------------------------------------------------------------
		//
		//  Private Methods
		//
		//--------------------------------------------------------------------------
	}
}
