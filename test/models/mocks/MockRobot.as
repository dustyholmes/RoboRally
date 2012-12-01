package models.mocks
{
	import interfaces.IFloor;
	import interfaces.IProgram;
	import interfaces.IRobot;
	import interfaces.IUpgrade;

	import mocks.Mock;

	public class MockRobot extends Mock implements IRobot
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

		public function MockRobot()
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

		public function get direction():String
		{
			return "";
		}

		public function get name():String
		{
			return "";
		}

		public function get damage():int
		{
			return 0;
		}

		public function get lives():int
		{
			return 0;
		}

		public function get isPoweredDown():Boolean
		{
			return false;
		}

		public function set isPoweredDown(value:Boolean):void
		{
		}

		public function get upgrades():Vector.<IUpgrade>
		{
			return null;
		}

		public function get archiveLocation():IFloor
		{
			return null;
		}

		public function set archiveLocation(value:IFloor):void
		{
			this.appendSpyResult("set archiveLocation", [value]);
		}

		public function get lastCheckpoint():IFloor
		{
			return null;
		}

		public function set lastCheckpoint(value:IFloor):void
		{
			this.appendSpyResult("set lastCheckpoint", [value]);
		}

		public function get program():Vector.<IProgram>
		{
			return null;
		}

		public function set program(value:Vector.<IProgram>):void
		{
		}

		//--------------------------------------------------------------------------
		//
		//  Public Methods
		//
		//--------------------------------------------------------------------------

		public function rotate(direction:String):void
		{
			this.appendSpyResult("rotate", [direction]);
		}

		public function takeDamage(amount:int):void
		{
			this.appendSpyResult("takeDamage", [amount]);
		}

		public function addUpgrade(upgrade:IUpgrade):void
		{
		}

		public function removeUpgrade(upgrade:IUpgrade):void
		{
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
