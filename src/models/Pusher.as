package models
{
	import constants.Direction;

	import events.ControllerEvent;

	import interfaces.IGameController;

	import utils.DirectionUtil;

	public class Pusher extends BaseFloor
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

		public function Pusher(controller:IGameController, direction:String, phases:Vector.<int>)
		{
			super(controller);

			this.registers = phases;

			if (DirectionUtil.isValid(direction))
				this.direction = direction;
			else
				this.direction = Direction.UP;

			controller.addEventListener(ControllerEvent.PUSH, pushEventHandler, false, 0, true);
		}

		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------

		protected var direction:String;
		protected var registers:Vector.<int>;

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

		//--------------------------------------------------------------------------
		//
		//  Protected Methods
		//
		//--------------------------------------------------------------------------

		protected  function isActive():Boolean
		{
			return this.registers.indexOf(controller.register) >= 0;
		}

		protected function pushOccupant():void
		{
			if (!occupant || !isActive())
				return;

			controller.moveRobot(occupant, direction, this);
		}

		protected function pushEventHandler(event:ControllerEvent):void
		{
			pushOccupant();
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
