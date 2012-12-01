package models.floor
{
	import interfaces.IFloor;
	import interfaces.IGameController;
	import interfaces.IRobot;

	public class Checkpoint extends BaseFloor
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

		public function Checkpoint(controller:IGameController, requiredCheckpoint:IFloor = null)
		{
			super(controller);

			this.requiredCheckpoint = requiredCheckpoint;
		}

		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------

		private var requiredCheckpoint:IFloor;

		//--------------------------------------------------------------------------
		//
		//  Properties
		//
		//--------------------------------------------------------------------------

		override public function set occupant(value:IRobot):void
		{
			if (value == occupant)
				return;

			super.occupant = value;

			if (occupant)
				controller.checkpointReached(occupant, requiredCheckpoint, this);
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
