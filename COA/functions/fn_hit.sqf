if (isServer) then {
    _instigator = _this select 3;
    if (isPlayer _instigator) then {
        [] remoteExec ["COA_fnc_hitMarker", _instigator];
    };
};
