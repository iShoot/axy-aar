
class CfgPatches
{
	class axy_aar
		{
			units[] = { };
			weapons[] = { };
			requiredAddons[] = {"CBA_Extended_EventHandlers"};
			version = "0.3";
			versionStr = "0.3";
			versionDesc="Axyl's AAR System - www.combatteambravo.com";
			versionAr[] = {0,3,0};
			author[] = {"Axyl"};
		};
};

class Extended_PostInit_EventHandlers {
    class axy_aar {
        clientInit = "call compile preprocessFileLineNumbers '\axy_aar\init.sqf'";
    };
}; 

class CfgFunctions
{
	class axy
	{
		class aar
		{
			file= "axy_aar";
			class aarSectionInContact{};
			class aarSectionUnitFired{};
			class aarSectionUnitHit{};
			class aarSectionUnitKilled{};
			class aarUpdateSection{};
			class aarUpdateAllUnits{};
			class aarEnemyUnitsHit{};
			class aarEnemyUnitsKilled{};
			class aarEnemyHitInContact{};
			class aarContactSectionStats{};
			class aarContactEnemyStats{};
		};
	};
};
