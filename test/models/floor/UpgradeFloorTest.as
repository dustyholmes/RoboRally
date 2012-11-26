package models.floor
{
	import controller.mocks.MockGameController;

	import interfaces.IGameController;

	public class UpgradeFloorTest
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

		public function UpgradeFloorTest()
		{
		}

		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------
		private var boardElement:UpgradeFloor;
		private var controller:IGameController;

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

		[Before]
		public function setUp():void
		{
			controller = new MockGameController();
			boardElement = new UpgradeFloor(controller);
		}

		[After]
		public function tearDown():void
		{
			controller = null;
			boardElement = null;
		}

		//An upgrade should respond to a repair phase event from the controller

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
