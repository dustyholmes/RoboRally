package interfaces
{
	public interface ICard
	{
		function get deck():IDeck;
		function set deck(value:IDeck):void

		function discard():void;

		function destroy():void;
	}
}
