package models
{
	import constants.Direction;

	import events.ControllerEvent;

	import interfaces.IGameController;

	import utils.DirectionUtil;

	public class Gear extends BaseFloor
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

		public function Gear(controller:IGameController, direction:String)
		{
			super(controller);

			if (DirectionUtil.isValidRotation(direction))
				this.direction = direction;
			else
				this.direction = Direction.LEFT;

			controller.addEventListener(ControllerEvent.ROTATE, rotateEventHandler, false, 0, true);
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

		protected function rotateOccupant():void
		{
			if (!occupant)
				return;

			controller.rotateRobot(occupant, direction);
		}

		protected function rotateEventHandler(event:ControllerEvent):void
		{
			rotateOccupant();
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
