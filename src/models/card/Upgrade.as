package models.card
{
	import interfaces.IUpgrade;

	public class Upgrade extends AbstractCard implements IUpgrade
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

		public function Upgrade(name:String, description:String, elective:Boolean = true, useMaximum:int = 0)
		{
			super();

			this._name = name;
			this._description = description;
			this._elective = elective;
			this._useMaximum = useMaximum;
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
		//  name
		//----------------------------------
		private var _name:String = "";

		public function get name():String
		{
			return _name;
		}

		//----------------------------------
		//  description
		//----------------------------------
		private var _description:String = "";

		public function get description():String
		{
			return _description;
		}

		//----------------------------------
		//  elective
		//----------------------------------
		private var _elective:Boolean = true;

		public function get elective():Boolean
		{
			return _elective;
		}

		//----------------------------------
		//  active
		//----------------------------------
		private var _active:Boolean = false;

		public function get active():Boolean
		{
			return _active;
		}

		//----------------------------------
		//  uses
		//----------------------------------
		private var _uses:uint = 0;

		public function get uses():uint
		{
			return _uses;
		}

		//----------------------------------
		//  useMaximum
		//----------------------------------
		private var _useMaximum:uint = 0;

		public function get useMaximum():uint
		{
			return _useMaximum;
		}

		//--------------------------------------------------------------------------
		//
		//  Public Methods
		//
		//--------------------------------------------------------------------------

		public function used():void
		{
			_uses++;

			if (useMaximum && uses >= useMaximum)
				discard(); //TODO: Is this really what happens?
		}

		public function activate():void
		{
			this._active = true;
		}

		public function deactivate():void
		{
			this._active = false;
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
