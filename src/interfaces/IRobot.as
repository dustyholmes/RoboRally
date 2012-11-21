package interfaces
{
	import flash.events.IEventDispatcher;

	public interface IRobot extends IEventDispatcher
	{
		function get direction():String;

		function get name():String;

		function get damage():int;

		function get lives():int;

		function get isPoweredDown():Boolean;
		function set isPoweredDown(value:Boolean):void;

		function get upgrades():Vector.<IUpgrade>;

		function get archiveLocation():IFloor
		function set archiveLocation(value:IFloor):void;

		function get program():Vector.<IProgram>;
		function set program(value:Vector.<IProgram>):void;

		function rotate(direction:String):void;

		function takeDamage(amount:int):void;

		function addUpgrade(upgrade:IUpgrade):void;

		function removeUpgrade(upgrade:IUpgrade):void;
	}
}
