package sphis.sclait.states;

import flixel.FlxG;
import flixel.FlxState;
import sphis.sclait.modding.PolymodHandler;

class InitState extends FlxState
{
	override function create()
	{
		super.create();

		PolymodHandler.forceReloadAssets();
	}
}
