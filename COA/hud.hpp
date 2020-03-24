#define ticketsHud_idc 5000
#define hitmarkerHud_idc 5100

class TicketsHud {
	idd = -1;
    fadeout=0;
    fadein=0;
	duration = 10000000000;
	name= "TicketsHud";
	onLoad = "uiNamespace setVariable ['TicketsHud', _this select 0]";

	class controlsBackground {
		class TicketsHud_1:RscStructuredText
		{
			idc = ticketsHud_idc;
			type = CT_STRUCTURED_TEXT;
			size = 0.040;
			x = (SafeZoneX + SafeZoneW/2 - 0.1);
			y = (SafeZoneY + 0.015);
			w = 0.2; h = 0.1;
			colorText[] = {1,1,1,1};
			lineSpacing = 3;
			colorBackground[] = {0,0,0,0};
			text = "Text";
			font = "PuristaLight";
			shadow = 2;
			class Attributes {
				align = "center";
			};
		};

	};
};

class HitmarkerHud {
	idd = -1;
    fadeout=0;
    fadein=0;
	duration = 10000000000;
	name= "HitmarkerHud";
	onLoad = "uiNamespace setVariable ['HitmarkerHud', _this select 0]";

	class controlsBackground {
		class HitmarkerHud_1:RscStructuredText
		{
			idc = hitmarkerHud_idc;
			type = CT_STRUCTURED_TEXT;
			size = 0.040;
			x = (SafeZoneX + SafeZoneW/2 - 0.05);
			y = (SafeZoneY + SafeZoneH/2 - 0.05);
			w = 0.1; h = 0.1;
			colorText[] = {1,1,1,1};
			lineSpacing = 0;
			colorBackground[] = {0,0,0,0};
			text = "Text";
			font = "PuristaLight";
			shadow = 0;
			class Attributes {
				align = "center";
				valign = "middle";
			};
		};

	};
};
