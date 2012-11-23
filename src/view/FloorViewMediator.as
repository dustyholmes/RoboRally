package view
{
	import interfaces.IFloor;

	import models.BaseFloor;
	import models.Conveyor;
	import models.ExpressConveyor;
	import models.Gear;
	import models.Pusher;

	import view.components.FloorView;

	public class FloorViewMediator
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

		public function FloorViewMediator(floor:IFloor)
		{
			this.floor = floor;
			this._floorView = new FloorView();

			updateViewState();
		}

		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------

		protected var floor:IFloor

		//--------------------------------------------------------------------------
		//
		//  Properties
		//
		//--------------------------------------------------------------------------

		//----------------------------------
		//  floorView
		//----------------------------------
		private var _floorView:FloorView;

		public function get floorView():FloorView
		{
			return _floorView;
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

		protected function updateViewState():void
		{
			switch (typeof floor)
			{
				case BaseFloor:
					floorView.currentState = floorView.normalState.name;
					break;
				case Conveyor:
					floorView.currentState = floorView.conveyorState.name;
					break;
				case ExpressConveyor:
					floorView.currentState = floorView.expressState.name;
					break;
				case Gear:
					floorView.currentState = floorView.gearState.name;
					break;
				case Pusher:
					floorView.currentState = floorView.pusherState.name;
					break;
			}
		}

		//--------------------------------------------------------------------------
		//
		//  Private Methods
		//
		//--------------------------------------------------------------------------
	}
}
