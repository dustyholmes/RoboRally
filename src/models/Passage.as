package models
{
	import interfaces.IFloor;
	import interfaces.IPassage;

	import utils.DirectionUtil;

	public class Passage implements IPassage
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

		public function Passage(from:IFloor, to:IFloor, hasWall:Boolean = false, laserDirection:String = null)
		{
			this._from = from;
			this._hasWall = hasWall;

			//to and from cannot be the same.
			if (from != to)
				this._to = to;

			//A laser direction is only valid if there is a wall.
			if (hasWall && DirectionUtil.isValid(laserDirection))
				this._laserDirection = laserDirection;
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
		//  program
		//----------------------------------
		private var _from:IFloor;

		public function get from():IFloor
		{
			return _from;
		}

		//----------------------------------
		//  to
		//----------------------------------
		private var _to:IFloor;

		public function get to():IFloor
		{
			return _to;
		}

		//----------------------------------
		//  hasWall
		//----------------------------------
		private var _hasWall:Boolean;

		public function get hasWall():Boolean
		{
			return _hasWall;
		}

		//----------------------------------
		//  laserDirection
		//----------------------------------
		private var _laserDirection:String;

		public function get laserDirection():String
		{
			return _laserDirection;
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
