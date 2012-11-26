package view
{
	import interfaces.IFloor;

	import models.floor.BaseFloor;
	import models.floor.Checkpoint;
	import models.floor.Conveyor;
	import models.floor.ExpressConveyor;
	import models.floor.Gear;
	import models.floor.Pusher;
	import models.floor.RepairFloor;
	import models.floor.UpgradeFloor;

	import org.as3commons.reflect.Type;

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
			var clazz:Class = Type.forInstance(floor).clazz;
			switch (clazz)
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
				case Checkpoint:
					floorView.currentState = floorView.checkpointState.name;
					break;
				case RepairFloor:
					floorView.currentState = floorView.repairState.name;
					break;
				case UpgradeFloor:
					floorView.currentState = floorView.upgradeState.name;
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
