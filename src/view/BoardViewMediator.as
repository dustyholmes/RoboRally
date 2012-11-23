package view
{
	import interfaces.IBoard;

	import models.BaseFloor;

	import view.components.BoardView;

	public class BoardViewMediator
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

		public function BoardViewMediator(board:IBoard)
		{
			this.board = board;

			this._boardView = new BoardView();

			createChildren();
		}

		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------

		protected var board:IBoard;

		//--------------------------------------------------------------------------
		//
		//  Properties
		//
		//--------------------------------------------------------------------------

		//----------------------------------
		//  boardView
		//----------------------------------
		private var _boardView:BoardView;

		public function get boardView():BoardView
		{
			return _boardView;
		}
		//--------------------------------------------------------------------------
		//
		//  Public Methods
		//
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//
		//  Protected Methods
		//
		//--------------------------------------------------------------------------

		protected function createChildren():void
		{
			var floorViewMediator:FloorViewMediator;

			for (var i:int = 0; i < 144; i++)
			{
				floorViewMediator = new FloorViewMediator(new BaseFloor(null));
				boardView.addElement(floorViewMediator.floorView);
			}
		}

		//--------------------------------------------------------------------------
		//
		//  Private Methods
		//
		//--------------------------------------------------------------------------
	}
}
