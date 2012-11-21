package models
{
	import constants.Direction;

	import events.RobotEvent;

	import flash.events.EventDispatcher;

	import interfaces.IFloor;
	import interfaces.IProgram;
	import interfaces.IRobot;
	import interfaces.IUpgrade;

	import utils.DirectionUtil;

	public class Robot extends EventDispatcher implements IRobot
	{
		//--------------------------------------------------------------------------
		//
		//  Class Constants
		//
		//--------------------------------------------------------------------------

		protected  static const MAX_DAMAGE:int = 10;

		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------

		public function Robot(name:String)
		{
			this._name = name;

			this._upgrades = new Vector.<IUpgrade>()
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
		//  direction
		//----------------------------------
		private var _direction:String = Direction.UP;

		public function get direction():String
		{
			return _direction;
		}

		//----------------------------------
		//  name
		//----------------------------------
		private var _name:String = null;

		public function get name():String
		{
			return _name;
		}

		//----------------------------------
		//  damage
		//----------------------------------
		private var _damage:int = 0;

		public function get damage():int
		{
			return _damage;
		}

		//----------------------------------
		//  lives
		//----------------------------------
		private var _lives:int = 3;

		public function get lives():int
		{
			return _lives;
		}

		//----------------------------------
		//  isPoweredDown
		//----------------------------------
		private var _isPoweredDown:Boolean = false;

		public function get isPoweredDown():Boolean
		{
			return _isPoweredDown;
		}

		public function set isPoweredDown(value:Boolean):void
		{
			if (value == _isPoweredDown)
				return;

			_isPoweredDown = value;
		}

		//----------------------------------
		//  upgrades
		//----------------------------------
		private var _upgrades:Vector.<IUpgrade> = null;

		public function get upgrades():Vector.<IUpgrade>
		{
			return _upgrades.concat();
		}

		//----------------------------------
		//  archiveLocation
		//----------------------------------
		private var _archiveLocation:IFloor = null;

		public function get archiveLocation():IFloor
		{
			return _archiveLocation;
		}

		public function set archiveLocation(value:IFloor):void
		{
			if (value == _archiveLocation)
				return;

			_archiveLocation = value;
		}
		
		//----------------------------------
		//  program
		//----------------------------------
		private var _program:Vector.<IProgram> = null;

		public function get program():Vector.<IProgram>
		{
			if (!_program)
				_program = new Vector.<IProgram>();

			return _program.concat();
		}

		public function set program(value:Vector.<IProgram>):void
		{
			if (value == _program)
				return;

			_program = value;
		}

		//--------------------------------------------------------------------------
		//
		//  Public Methods
		//
		//--------------------------------------------------------------------------


		public function rotate(direction:String):void
		{
			if (!DirectionUtil.isValidRotation(direction))
				return;

			_direction = DirectionUtil.rotate(this.direction, direction);
		}

		public function takeDamage(amount:int):void
		{
			this._damage += amount;

			if (damage >= MAX_DAMAGE)
			{
				this._lives--;
				this._damage = 2;

				dispatchEvent(new RobotEvent(RobotEvent.DESTROYED));

				if (lives == 0)
					dispatchEvent(new RobotEvent(RobotEvent.ELIMINATED));
			}
		}

		public function addUpgrade(upgrade:IUpgrade):void
		{
			var index:int = this._upgrades.indexOf(upgrade);

			if (index < 0)
				this._upgrades.push(upgrade);
		}

		public function removeUpgrade(upgrade:IUpgrade):void
		{
			var index:int = this._upgrades.indexOf(upgrade);

			if (index >= 0)
				this._upgrades.splice(index, 1);
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
