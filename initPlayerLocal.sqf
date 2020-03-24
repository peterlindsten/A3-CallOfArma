player setCustomAimCoef 0.2;
player setUnitRecoilCoefficient 0.5;
player enableStamina FALSE;

// Lower recoil, lower sway, remove stamina, set speed on encumberance on respawn
player addEventHandler ['Respawn',{
    player setCustomAimCoef 0.2;
    player setUnitRecoilCoefficient 0.5;
    player enableStamina FALSE;
    _fac = 1.875 - 0.875 * (load player);
    [player, _fac] remoteExec ["setAnimSpeedCoef"];
}];

_leave_trg = createTrigger ["EmptyDetector", [0, 0]];
_leave_trg setTriggerStatements ["!(player inArea ""agina_marina_area"")",
                                 "call COA_fnc_bounceback", ""];


[] call COA_fnc_updateHud;
_hud_trg = createTrigger ["EmptyDetector", [0, 0]];
_hud_trg setTriggerStatements ["[] call COA_fnc_updateHud", "", ""];
/*
// Delete all map markers on clients
{
    _currMarker = toArray _x;
    if(count _currMarker >= 4) then {
        _currMarker resize 8; _currMarker = toString _currMarker;
        if(_currMarker == "bulwark_") then{ deleteMarker _x; };
    };
} foreach allMapMarkers;
*/
hitMarker = [40, false];

//Show the Bulwark label on screen
onEachFrame {
    /*if(!isNil "bulwarkBox") then {
        _textPos = getPosATL bulwarkBox vectorAdd [0, 0, 1.5];
        drawIcon3D ["", [1,1,1,0.5], _textPos, 1, 1, 0, "Bulwark", 0, 0.04, "RobotoCondensed", "center", true];
    };*/
/*
    _age    = hitMarker select 0;
    _active  = hitMarker select 1;
    //_colour = hitMarker select 2;


    if(_active) then {
        hitMarker set [0, _age + 1];
        _hudText = "<t size='1.2' color='#bbbbbb'>\ /<br/>/ \</t>";

        _alpha = (-(_age^5)) + 1;

        1000 cutRsc ["HitmarkerHud","PLAIN"];
        _ui = uiNameSpace getVariable "HitmarkerHud";
        _TicketsHud = _ui displayCtrl 5100;
        _TicketsHud ctrlSetFade _alpha;
        _TicketsHud ctrlSetStructuredText parseText _hudText;
        _TicketsHud ctrlCommit 1;

        if(_age > 60) then {_x set [4, false];};
        //drawIcon3D ["", [_colour select 0, _colour select 1, _colour select 2, _alpha], _textPos, 1, 1, 0, format ["%1", _label], 0, _scale, "RobotoCondensed", "center", false];
    };
    **/
};

player createDiarySubject ["CallofArma","Call of Arma","preview.paa"];

player createDiaryRecord ["CallofArma", ["Basics", "
<br />
Kill the enemy
<br />
Get some!
"]];


player createDiaryRecord ["CallofArma", ["Supports", "<br />Supports can be purchased at the Bulwark Box. To use a Support bring up the Support menu <font color='#FFCC00'>(Default keys '0' then '8')</font>.
<br />
<br />
<br />
<font color='#FFCC00'>Recon UAV</font> - Shows All hostiles on the map until shot down
<br />
<br />
<font color='#FFCC00'>Paratroopers</font> - AI Reinforcements paradrop wherever you are looking or on a selected location on the map
<br />
<br />
<font color='#FFCC00'>Predator Drone</font> - Take control of a UAV armed with 6 Skalpel Missiles (Drone self destructs when out of ammo)
<br />
<br />
<font color='#FFCC00'>Missile CAS</font> - Calls in an airstrike wherever you are looking or on a selected location on the map
<br />
<br />
<font color='#FFCC00'>Mine Cluster Shell</font> - Call in a Mine Cluster Shell to create an instant mine field wherever you are looking or on a selected location on the map
<br />
<br />
<font color='#FFCC00'>Rage Stimpack</font> - No need to reload, unlimited ammo, invicibility and increased speed for a short time.
<br />
<br />
<font color='#FFCC00'>ARMAKART TM</font> - 1 minute in an invincible Go-Kart with an automatically targeting HMG
<br />
<br />
<font color='#FFCC00'>Emergency Teleport</font> - Teleports you back to the Bulwark Box but it's unstable and will create an explosion at your original position
<br />
<br />
<font color='#FFCC00'>Mind Control Gas</font> - Deploy a gas canister wherever you are looking or on a selected location on the map. Units that enter the gas will join your team! That's good! But the gas is fatal and the units die at the end of the wave.... That's bad.
<br />
<br />
<br />
Some Supports can be targeted by just looking at the target when you call the Support. Alternatively, you can use your map to target the support by openning your map and bring up the support menu. Have the support highlighted and then middle click your mouse on the map to have the support target that location."]];

player createDiaryRecord ["CallofArma", ["How to Play", "<img image='preview.paa' height=175 width=350/>
<br />
<br />
<font color='#FFCC00'>You are unarmed and there are hostile untis moving towards you. Survive for as many waves as possible.</font>
<br />
<br />
Search buildings for weapons, equipment and supplies. Build a Bulwark and defend it for as long as you can!
<br />
<br />
Kill enemies to earn points to spend at the Bulwark Box Shop (in the action menu on the Bulwark Box). Points can be used to purchase Building Supplies and Supports. Purchased Supports can be used via the Supports menu (0 - 8 on keyboard).
<br />
<br />
Allies will make regular ammo drops! Initially marked with blue smoke, find these wooden crates to get much needed ammo for your weapon.
<br />
<br />
If you are knocked unconscious but you have a Medikit in your inventory you will be automatically resurected within 10 seconds. 15 FAKs can be converted into a Medikit at the Bulwark Box.
<br />
<br />
You can repack your magazines by pressing CTRL + R.
<br />
<br />
<font color='#FFCC00'>You won't survive this fight but take as many of the bastards with you as you can!</font>"]];


/*
while {true} do {
    	waitUntil {inputAction "reloadMagazine" > 0};
        sleep 10;
    	[player] execVM "bulwark\magRepack.sqf";
};
*/
/*
MY_KEYDOWN_FNC = {
    _handled = false;
    params ["_ctrl", "_dikCode", "_shift", "_ctrlKey", "_alt"];
    if (_dikCode == 19 && _ctrlKey) then { // using if instead of switch since it's faster when evaluating only one condition
        [player] execVM "bulwark\magRepack.sqf";
        _handled = true;
    };
    _handled
};

toggled = 0;

waituntil {!(isNull (findDisplay 46))};
(findDisplay 46) displayAddEventHandler ["KeyDown",{_this call MY_KEYDOWN_FNC}];
*/