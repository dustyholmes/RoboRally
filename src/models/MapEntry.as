package models
{
	import interfaces.IPassage;

	public class MapEntry
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

		public function MapEntry(up:IPassage, down:IPassage, left:IPassage, right:IPassage)
		{
			this._up = up;
			this._down = down;
			this._left = left;
			this._right = right;
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

		//----------------------------------
		//  up
		//----------------------------------
		private var _up:IPassage;

		public function get up():IPassage
		{
			return _up;
		}

		//----------------------------------
		//  down
		//----------------------------------
		private var _down:IPassage;

		public function get down():IPassage
		{
			return _down;
		}

		//----------------------------------
		//  left
		//----------------------------------
		private var _left:IPassage;

		public function get left():IPassage
		{
			return _left;
		}

		//----------------------------------
		//  right
		//----------------------------------
		private var _right:IPassage;

		public function get right():IPassage
		{
			return _right;
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

		//--------------------------------------------------------------------------
		//
		//  Private Methods
		//
		//--------------------------------------------------------------------------
	}
}
