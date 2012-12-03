package utils
{
	import constants.Direction;

	public class DirectionUtil
	{
		/**
		 * Validates the given direction.
		 *
		 * @param direction The direction to validate.
		 *
		 * @return Returns true if the given direction is valid.
		 */
		public static function isValid(direction:String):Boolean
		{
			if (direction == Direction.DOWN || direction == Direction.LEFT || direction == Direction.RIGHT || direction == Direction.UP)
				return true;

			return false;
		}

		/**
		 * Validates the given direction as a rotation type.
		 *
		 * @param direction The direction to validate.
		 *
		 * @return Returns true if the given direction is valid for rotation.
		 */
		public static function isValidRotation(direction:String):Boolean
		{
			if (direction == Direction.LEFT || direction == Direction.RIGHT)
				return true;

			return false;
		}

		/**
		 * Given a direction and a rotation, returns the new direction.
		 *
		 * @param direction The current direction.
		 * @param rotation The direction to rotate.
		 *
		 * @return Returns the result of rotating.
		 */
		public static function rotate(direction:String, rotation:String):String
		{
			if (rotation == Direction.LEFT)
			{
				if (direction == Direction.UP)
					direction = Direction.LEFT;
				else if (direction == Direction.LEFT)
					direction = Direction.DOWN;
				else if (direction == Direction.DOWN)
					direction = Direction.RIGHT;
				else
					direction = Direction.UP;
			}
			else if (rotation == Direction.RIGHT)
			{
				if (direction == Direction.UP)
					direction = Direction.RIGHT;
				else if (direction == Direction.RIGHT)
					direction = Direction.DOWN;
				else if (direction == Direction.DOWN)
					direction = Direction.LEFT;
				else
					direction = Direction.UP;
			}

			return direction;
		}
	}
}
