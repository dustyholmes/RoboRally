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

		public function Pusher(controller:IGameController, direction:String)
		{
			super(controller);

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

		protected function pushOccupant():void
		{
			if (!occupant)
				return;

			controller.moveRobot(occupant, direction);
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
