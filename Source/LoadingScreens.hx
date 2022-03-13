package;

import characterUtils.CharacterEditorState;
import flixel.math.FlxRandom;
import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.ui.FlxBar;
import flixel.system.FlxSound;
import extraShit.Speen;
import IntroStuff;
import FileUtils; // if i can fix this it will HOPEFULLY work. lmao

using StringTools;

/**Startup loading screen. Handles the Intro loader.
@since 0.0.1*/
class StartupScreen extends FlxState {
    var speen:Speen;
    var bg:FlxSprite;
    var bar:FlxBar;
    var assetsLoaded:Int;
    var assetsToLoad:Array<String> = ['picThing.png'];
    var shitCam:FlxCamera;
    public static var NavigateSound:FlxSound;

    public function new() {
        assetsToLoad.push('xpNavigate' + IntroStuff.sndExtension[IntroStuff.yourPlatform]);
        super();
    }

    override function create() {
        shitCam = new FlxCamera();
        shitCam.bgColor = 0xFF000000;
        FlxG.cameras.reset(shitCam);
        bg = new FlxSprite(0).loadGraphic(FileUtils.pic('loading'));
        add(bg);
        assetsLoaded = 0;
        bar = new FlxBar(2, 30, LEFT_TO_RIGHT, FlxG.width - 4, 24, this, 'assetsLoaded', 0, 2);
        add(bar);
        speen = new Speen(0, FlxG.height - 48, true);
        add(speen);
        NavigateSound = new FlxSound();
        NavigateSound.loadEmbedded(FileUtils.sound('xpNavigate'));
        FlxG.sound.cache(FileUtils.sound('xpNavigate'));
        new FlxTimer().start(3, function(tmr:FlxTimer) {
            assetsLoaded += 1;
            if (assetsLoaded == 2) FlxG.switchState(new CharacterEditorState());
        }, 2);
    }
}

class DumbBarTestThing extends FlxState {
    var bar:FlxBar;
    var bg:FlxSprite;
    var start:Int = 0;
    var finish:Int;
    var currentShit:Int = 0;
    var bussy:FlxRandom;
    public function new() {
        bussy = new FlxRandom();
        finish = bussy.int(0, 200);
        super();
    }

    override function create() {
        bg = new FlxSprite(0).loadGraphic(FileUtils.pic('loading'));
        add(bg);
        bar = new FlxBar(0, 24, LEFT_TO_RIGHT, FlxG.width, 24, this, 'currentShit');
        bar.createFilledBar(0xFF696969, 0xFFAACCFF);
        add(bar);
        new FlxTimer().start(1, function(tmr:FlxTimer) {
            currentShit += 1;
        }, finish);
    }
}

/**This'll be used later on when I figure out the actual character info screen.
@since 0.0.2 (March 2022) [when I made the class]*/
class CharacterPreloadScreen extends FlxState {
    public static var CharLoadingName:String = '';
    public static var CharLoadingColour:FlxColor;
    public static var CharFilePath:String = '';
    public static var PUBLIC_VARS:Array<Dynamic> = [
        CharLoadingName,
        CharLoadingColour,
        CharFilePath
    ];

    public function new() {
        super();
    }
}