if (!isDedicated) then {
    disableSerialization;
	_hudText = "<t size='1' color='#cccccc'>\ /<br/>/ \</t>";
	"hitmarkerlayer" cutRsc ["HitmarkerHud","PLAIN"];
	_ui = uiNameSpace getVariable "HitmarkerHud";
	_TicketsHud = _ui displayCtrl 5100;
	_TicketsHud ctrlSetFade 1;
	_TicketsHud ctrlSetStructuredText parseText _hudText;
	_TicketsHud ctrlCommit 1;
};
true;