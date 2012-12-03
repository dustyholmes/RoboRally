package interfaces
{
	public interface IProgram
	{
		function get priority():int;

		function get direction():String; // Left, Right, Forward, Back

		function get count():int;
	}
}
