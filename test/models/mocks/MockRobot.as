package models.mocks
{
	import flash.events.EventDispatcher;

	import interfaces.IFloor;
	import interfaces.IProgram;
	import interfaces.IRobot;
	import interfaces.IUpgrade;

	public class MockRobot extends EventDispatcher implements IRobot
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
		}

		public function takeDamage(amount:int):void
		{
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
