package constants
{
	import interfaces.ICard;
	import interfaces.IUpgrade;

	import models.card.Upgrade;

	import org.as3commons.reflect.IMember;

	import org.as3commons.reflect.Type;

	public class Upgrades
	{
		public static const ABLATIVE_COAT:IUpgrade = new Upgrade("Albative Coat",
				"Ablative Coat abosrbs the next 3 Damage your robot receives.",
				false,
				3);

		public static const ABORT_SWITCH:IUpgrade = new Upgrade("Abort Switch",
				"Once each turn, you may replace one of the Program cards you" +
						" reveal with the top card from the deck." +
						" If you do, you must replace the Program cards for" +
						" all your remaining registers the same way.");

		public static const BRAKES:IUpgrade = new Upgrade("Brakes",
				"Whenever you execute a Move 1, you may move your robot 0" +
						" spaces instead of 1. Priority is that of the Move 1");

		public static const CIRCUIT_BREAKER:IUpgrade = new Upgrade("Circuit Breaker",
				"If you have 3 or more Damage tokens on your Program Sheet at the end of your turn," +
				" your robot will begin the next turn powered down.",
				false);

		public static const CONDITIONAL_PROGRAM:IUpgrade = new Upgrade("Conditional Program",
				"After you program your registers each turn, you may put one" +
						" of the Program cards left in your hand face down on" +
						" this Upgrade instead of discarding it. Later that" +
						" turn, you can substitue that card for one you had" +
						" programmed in any register, discarding the original" +
						" card. Announce the change before anyone reveals" +
						" Program cards for that register. If you put a card" +
						" on this Upgrage and don't use it, discard it at the" +
						" end of the turn.");

		public static const CRAB_LEGS:IUpgrade = new Upgrade("Crab Legs",
				"When programming your registers, you may put a Move 1 card in" +
						" the same register as a Rotate Left or Rotate Right" +
						" card. If you do during that register your robot will" +
						" move 1 space to the left or right, repectively," +
						" without rotating. Priority is that of the Move 1.");

		public static const DOUBLE_BARRELED_LASERS:IUpgrade = new Upgrade("Double-Barreled Laser",
				"Whenever your robot fires its main laser, it fires two shots" +
						" instead of one. You may use this Upgrade with Fire" +
						" Control and/or High-Power Laser.",
				false);

		public static const DUAL_PROCESSOR:IUpgrade = new Upgrade("Dual Processor",
				"When programming your registers you may put both a Move card" +
						" and a Rotate card in the same register. If you do," +
						" during that phase your robot will move 1 space less" +
						" than the move card says to move and then execute" +
						" the Rotate card. If the Rotate card is a U-Turn," +
						" move 2 spaces less than the Move cards says if possible.");

		public static const EXTRA_MEMORY:IUpgrade = new Upgrade("Extra Memory",
				"You receive one extra Program card each turn. (You still" +
						" discard all unused Program cards when you're done" +
						" programming your registers.)",
				false);

		public static const FIRE_CONTROL:IUpgrade = new Upgrade("Fire Control",
				"Whenever your robot hits another robot with its main laser," +
						" instead of doing damage you may choose one of the" +
						" target robot's registers and lock it or choose one" +
						" of that player's Upgrade card and destory it.");

		public static const FLYWHEEL:IUpgrade = new Upgrade("Flywheel",
				"After all players are done programming their registers each" +
						" turn, you may put one of your remaining Program cards" +
						" face down onto this card. You can add that Program" +
						" card to those dealt to you on any subsequent turn." +
						" You can have only one card on Flywheel at a time.");

		public static const FOURTH_GEAR:IUpgrade = new Upgrade("Fourth Gear",
				"Whenever you execute a Move 3, you may move your robot 4" +
						" spaces instead of 3. Priority is that of the Move 3");

		public static const GYROSCOPIC_STABILIZER:IUpgrade = new Upgrade("Gyroscopic Stabilizer",
				"Before players reveal the cards in their first registers each" +
						" turn, state whether this Upgrade is active. When it" +
						" is, your robot isn't rotated by gears or rotating" +
						" conveyor belts for the entire turn.");

		public static const HIGH_POWERED_LASER:IUpgrade = new Upgrade("High-Powered Laser",
				"Your robot's main laser can shoot through one wall or robot" +
						" to get to a target robot. If you shoot through a" +
						" robot, that robot also receives full damage. You may" +
						" use this option with Fire Control and/or Double Barreled Laser.",
				false);

		public static const MECHANICAL_ARM:IUpgrade = new Upgrade("Mechanical Arm",
				"Your robot can touch a flag or repair site from 1 space" +
						" away(diagonally or orthogonally), as long as there" +
						" isn't a wall between it and the flag or repair site.",
				false);

		public static const MINI_HOWITZER:IUpgrade = new Upgrade("Mini Howitzer",
				"Whenever you could fire your main laser at a robot, you may" +
						" fire the Mini Howitzer instead. This pushes the" +
						" target robot 1 space away from your robot, and the" +
						" target robot receives 1 Damage token (Robots can't" +
						" be pushed through walls.)\rYou may use this Option" +
						" five times.",
				true,
				5);

		public static const POWER_DOWN_SHIELD:IUpgrade = new Upgrade("Power-Down Shield",
				"As long as your robot is powered down, each register phase" +
						" you can prevent up to 1 Damage to it from each of" +
						" the four directions.");

		public static const PRESSOR_BEAM:IUpgrade = new Upgrade("Pressor Beam",
				"Whenever you could fire your main laser at a robot, you may" +
						" instead fire the Pressor Beam. This moves the target" +
						" robot 1 space away from your robot.");

		public static const RADIO_CONTROL:IUpgrade = new Upgrade("Radio Control",
				"Whenever you could fire your main laser at a robot, you may" +
						" instead fire the Radio Control beam. This causes the" +
						" target robot to execute your robot's program for the" +
						" rest of the turn. In cases of card priority, the" +
						" target robot moves immediately after your robot.");

		public static const RAMMING_GEAR:IUpgrade = new Upgrade("Ramming Gear",
				"Whenever your robot pushes or bumps into another robot, that" +
						" robot receives 1 Damage token.",
				false);

		public static const RECOMPILE:IUpgrade = new Upgrade("Recompile",
				"Once each turn, you may discard the hand of Program cards" +
						" dealt to you and draw a new hand from the deck. Your" +
						" robot then receives 1 Damage token.");

		public static const REAR_FIRING_LASER:IUpgrade = new Upgrade("Rear-Firing Laser",
				"Your robot has a rear firing laser in addition to its main" +
						" laser. This laser follows all the same rules as the" +
						" main laser.",
				false);

		public static const REVERSE_GEAR:IUpgrade = new Upgrade("Reverse Gear",
				"Whenever you execute a Back Up, you may move your robot" +
						" back 2 spaces instead of 1. Priority is that of the" +
						" Back Up.");

		public static const SCRAMBLER:IUpgrade = new Upgrade("Scrambler",
				"Whenever you could fire your main laser at a robot, you may" +
						" instead fire the Scrambler. This replaces the target" +
						" robot's next programmed card with the top Program" +
						" card from the deck. You can't use this Option on" +
						" the fifth register phase.");

		public static const SUPERIOR_ARCHIVE:IUpgrade = new Upgrade("Superior Archive",
				"When reentering play after being destroyed, your robot" +
						" doesn't receive the normal 2 Damage tokens.",
				false);

		public static const TRACTOR_BEAM:IUpgrade = new Upgrade("Tractor Beam",
				"Whenever you could fire your main laser at a robot that" +
						" isn't in an adjacent space, you may instead fire" +
						" the Tractor Beam. This pulls the target robot 1" +
						" space towards your robot.");
		
		public static function getCards():Vector.<ICard>
		{
			var upgradesDesc:Type = Type.forClass(Upgrades);
			var cards:Vector.<ICard> = new Vector.<ICard>();

			for each (var member:IMember in upgradesDesc.staticConstants)
			{
				if (member.type.name == "IUpgrade")
					cards.push(Upgrades[member.name]);
			}

			return cards;
		}
	}
}
