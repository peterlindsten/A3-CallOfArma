/**
 * fn_endPlayers
 * 
 * Ends mission for player
 */

params ["_victor"];

switch (_victor) do {
	case "west":
	{
		if (west == playerSide) then {
			["Blufor_win", true] call BIS_fnc_endMission;
		} else {
			["Blufor_win", false] call BIS_fnc_endMission;
		};
	};
	case "east":
	{
		if (east == playerSide) then {
			["Opfor_win", true] call BIS_fnc_endMission;
		} else {
			["Opfor_win", false] call BIS_fnc_endMission;
		};
	};
	case "draw":
	{
		["Draw", false] call BIS_fnc_endMission;
	};
};
true;