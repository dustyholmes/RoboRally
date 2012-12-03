package interfaces
{
	public interface IDeck
	{
		function draw():ICard;

		function discard(card:ICard):void
	}
}
