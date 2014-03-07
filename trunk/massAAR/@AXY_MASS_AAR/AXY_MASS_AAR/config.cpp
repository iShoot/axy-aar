
class CfgPatches
{
	class axy_mass_aar
		{
			units[] = { };
			weapons[] = { };
			requiredAddons[] = {"CBA_Extended_EventHandlers"};
			version = "0.3";
			versionStr = "0.3";
			versionDesc="Automated MASS AAR Generator";
			versionAr[] = {0,3,0};
			author[] = {"axyl - craig.foley@gmail.com"};
		};
};

class Extended_PostInit_EventHandlers {
    class axy_mass_aar {
        init = "call compile preprocessFileLineNumbers '\axy_mass_aar\init.sqf'";
    };
}; 

class CfgFunctions
{
	class axy
	{
		class mass_aar
		{
			file= "axy_mass_aar";
			class massaarUnitFired{};
			class massaarUnitHit{};
		};
	};
};
