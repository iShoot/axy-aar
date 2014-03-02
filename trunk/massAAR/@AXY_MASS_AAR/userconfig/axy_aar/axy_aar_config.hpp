// Customisable definitions for addon...

// How many seconds after a final "hit", "kill" or "fired" event does a contact end?
#define AXY_AAR_CONTACT_ENDS 90

// How long to pause, at the end of all the checks, before starting again. 
// i.e. How often to update position, contact check etc.
#define AXY_AAR_PAUSE_LOOP 15

// Should the position updates track the group leader or player?  Set True to track leader.
#define AXY_AAR_TRACK_LEADER false

// Settings for aarShow when displaying an AAR.

// Used to eliminate teleports...any distance between track updates greater than this are not plotted.
#define AXY_AAR_aarShow_DISTANCE_IGNORE 1200

// Thickness of the plotted line
#define AXY_AAR_aarShow_LINE_THICKNESS 2

// Settings for the Extension.

// Where should AAR files be stored?
#define AXY_AAR_Extension_AAR_Folder "C:\Temp\"