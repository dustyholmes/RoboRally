package models
{
	import flash.utils.Dictionary;

	import interfaces.IBoard;
	import interfaces.IFloor;
	import interfaces.IPassage;
	import interfaces.IRobot;

	public class Board implements IBoard
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

		public function Board()
		{
			floorMap = new Dictionary();
		}

		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------

		protected var floorMap:Dictionary;

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

		public function moveRobot(robot:IRobot, direction:String, currentLocation:IFloor = null):void
		{
			if (!currentLocation)
				currentLocation = findRobot(robot);

			if (!currentLocation)
				return;

			var validMoves:MapEntry = floorMap[currentLocation] as MapEntry;

			if (!validMoves)
				return;

			var passage:IPassage = validMoves[direction];

			if (!passage || passage.hasWall)
				return;

			if (passage.from == currentLocation)
			{
				passage.to.occupant = robot;
				currentLocation.occupant = null;
			}
			else
			{
				passage.from.occupant = robot;
				currentLocation.occupant = null;
			}
		}

		//TODO: This should not be necessary.
		public function addMapEntry(floor:IFloor, up:IPassage, down:IPassage, left:IPassage, right:IPassage):void
		{
			this.floorMap[floor] = new MapEntry(up, down, left, right);
		}

		//--------------------------------------------------------------------------
		//
		//  Protected Methods
		//
		//--------------------------------------------------------------------------

		protected function findRobot(robot:IRobot):IFloor
		{
			for (var key:Object in floorMap)
			{
				var floor:IFloor = key as IFloor;

				if (floor.occupant == robot)
					return floor;
			}

			return null;
		}

		//--------------------------------------------------------------------------
		//
		//  Private Methods
		//
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//
		//  Overrides
		//
		//--------------------------------------------------------------------------
	}
}

import interfaces.IPassage;

class MapEntry
{
	public var down:IPassage;
	public var left:IPassage;
	public var right:IPassage;
	public var up:IPassage;

	public function MapEntry(up:IPassage, down:IPassage, left:IPassage, right:IPassage)
	{
		this.up = up;
		this.down = down;
		this.left = left;
		this.right = right;
	}
}
