library Axy_AAR_Extension;

uses
  SysUtils
  , Windows
  , shlobj
  ;

{$R *.res}

const
  C_ConfigFolder= '\Arma 3\@AXY_AAR';
  C_ConfigFilename= '\AXY_AAR_Extension.config';

  C_Config_AARDir= 'AARDirectory';
  C_Config_CommentChar= '#';

  C_LogFilename= 'AXY_AAR_Extension.log';

  C_MissionExt= '.raw_aar';

  C_Version= '1.0';

  C_CMD_Version= 'version';
  C_CMD_Clear= 'clear';
  C_CMD_Save= 'save';
  C_CMD_Load= 'load';
  C_CMD_SetMission= 'mission';
  C_CMD_GetMissions='list';

  C_Response_unknown= 'unrecognised';

  C_AlphaChars= ['a'..'z','A'..'Z','<'];

var
  {Folder that we save/load aars to/from (and log file).  Defined in the config file.}
  G_AARDirectory: String;
  {Contains the name of the current aar file, if not defined, then we shouldn't allow the other commands.}
  G_CurrentMission: String;
  {Contains the last line we loaded - we have to load one line at a time (and remember what we were up to) because
  the ArmA buffer has a length limit.}
  G_LastLoadLine: Integer;
  {Should we be saving?}
  G_PerformSaves: Boolean;

{Just logs whatever string passed to the log file.}
function logMessage(logMessage: String): Boolean;
var
  logFile: TextFile;
begin
  { no logging at the moment .}
//  result:= True;
//  exit;

  
  AssignFile(logFile, G_AARDirectory+ '\'+ C_LogFilename);
  if FileExists(G_AARDirectory+ '\'+ C_LogFilename) then
//  AssignFile(logFile, 'E:\Temp\aar.log');
//  if FileExists('E:\Temp\aar.log') then
    Append(logFile)
  else
    ReWrite(logFile);
  try
    Writeln(logFile, formatDateTime('yyyymmdd hh:nn:ss', now)+ ' - '+ logMessage);
  finally
    CloseFile(logFile);
  end;
end;  {end of logmessage function.}

{ Just returning the version of the extension. }
function handleVersion(toArmA: PAnsiChar; outputSize: Integer): Boolean;
begin
  strcopy(toARmA, C_Version);
  Result:= True;
end;

function handleClear(toArmA: PAnsiChar; outputSize: Integer; fromArmA: string): Boolean;
begin
  Result:= False;
  logMessage('Clearing existing Mission.');
  if FileExists(G_AARDirectory+ '\'+ G_CurrentMission+ C_MissionExt) then
  begin
    // Rename it?
    CopyFile(PChar(G_AARDirectory+ '\'+ G_CurrentMission+ C_MissionExt), PChar(G_AARDirectory+ '\'+ G_CurrentMission+ C_MissionExt+ '.old'), False);
    SysUtils.DeleteFile(G_AARDirectory+ '\'+ G_CurrentMission+ C_MissionExt);
    G_LastLoadLine:= 0;
    strcopy(toArmA, 'ok');
    Result:= true;
  end
  else
  begin
    logMessage('Mission does not exist.');
    strcopy(toArmA, 'nok');
    Result:= False;
  end;
  // Either way, allow saves...
  G_PerformSaves:= True;
end;

function handleSave(toArmA: PAnsiChar; outputSize: Integer; fromArmA: string): Boolean;
var
  missionFile: TextFile;
begin
  if not G_PerformSaves then
  begin
    StrCopy(toArma, 'nok');
    LogMessage('Not allowing Saves...');
    exit;
  end;

  assignFile(missionFile, G_AARDirectory+ '\'+ G_CurrentMission+ C_MissionExt);
  if FileExists(G_AARDirectory+ '\'+ G_CurrentMission+ C_MissionExt) then
    Append(missionFile)
  else
    Rewrite(missionFile);
  try
    { Just blindly writing it at the moment. }
    Writeln(missionFile, fromArmA);
    logMessage('saved data.');
  finally
    CloseFile(missionFile);
  end;
  StrCopy(toArma, 'ok');
  Result:= true;
end;

{Load and return the next line in the save file...reference the G_LastLoadLine global variable...
as we only want to return one line at a time and I don't want the ArmA side to worry about it when it shouldn't
have to.}
function handleLoad(toArmA: PAnsiChar; outputSize: Integer; fromArmA: string): Boolean;
var
  missionFile: TextFile;
  missionLine: String;
  skipCount: Integer;
begin
  Result:= False;
  G_PerformSaves:= False;
  logMessage('Loading next mission file line.');
  if FileExists(G_AARDirectory+ '\'+ G_CurrentMission+ C_MissionExt) then
  begin
    assignFile(missionFile, G_AARDirectory+ '\'+ G_CurrentMission+ C_MissionExt);
    reset(missionFile);
    try
      // Ignore any line that starts with a # - it's a comment
      for skipCount:= 1 to G_LastLoadLine do
      begin
        if eof(missionFile) then
        begin
          strCopy(toArmA, 'end');
          result:= True;
          logMessage('Returning EOF');
          exit;
        end;
        readln(missionFile, missionLine);
      end;
      repeat
        readln(missionFile, missionLine);
        inc(G_LastLoadLine);
      until (eof(missionFile)) or (missionLine[1]<> '#');
      // return the line to ArmA.  (Should we skip the type?)
      logMessage('Returning '+ missionLine);

      StrCopy(toArmA, PAnsiChar(AnsiString(missionLine)));
      result:= true;
      exit;
    finally
      CloseFile(missionFile);
    end;
  end
  else
  begin
    logMessage('Mission does not exist.');
    strcopy(toArmA, 'nok');
    Result:= False;
  end;
end;

function handleSetMission(toArmA: PAnsiChar; outputSize: Integer; fromArmA: String): Boolean;
begin
  if (length(fromArmA)> 0) and (Pos('\', fromArma)= 0) then
  begin
    G_CurrentMission:= fromArmA;
    logMessage('New mission set to '+ G_CurrentMission);
    G_LastLoadLine:= 0;
    strcopy(toArmA ,'ok');
    // Don't allow saves, until it's cleared...
    G_PerformSaves:= False;
    Result:= true;
  end
  else
  begin
    logMessage('Mission name length too short.');
    strcopy(toARmA, 'nok');
    Result:= False;
  end;
end;

{ Return an array list of all available missions to load up. }
function handleGetMissions(toArmA: PAnsiChar; outputSize: Integer; fromArmA: String): Boolean;
var
  missionFile: TextFile;
  missionLine: String;
  skipCount: Integer;

  srFiles: TSearchRec;
  missionList, fileName: String;

begin
  Result:= False;
  logMessage('Getting list of mission files.');
  if DirectoryExists(G_AARDirectory) then
  begin
    missionList:= '';
    if FindFirst(G_AARDirectory+ '\*'+ C_MissionExt, faAnyFile, srFiles)= 0 then
    begin
      repeat
        logMessage('Found filename: '+ srFiles.Name);
        fileName:= Copy(srFiles.Name, 1, pos('.', srFiles.Name)- 1);
        if length(missionList)= 0 then
          missionList:= '["'+ filename+ '"'
        else
          missionList:= missionList+ ',"'+ fileName+ '"';
      until findNext(srFiles)<>0 ;
      missionList:= missionList+ ']';
    end
    else
    begin
      missionList:= '[]';
    end;
    strCopy(toArma, PAnsiChar(AnsiString(missionList)));
    Result:= True;
    exit;
  end
  else
  begin
    logMessage('AAR Folder does not exist.');
    strcopy(toArmA, '[nok]');
    Result:= False;
  end;
end;

{Returns/Logs that we have nfi what the caller sent.}
function handleUnknown(toArmA: PAnsiChar; outputSize: Integer): Boolean;
begin
  logMessage('No recognised command sent.');
  strcopy(toArmA, C_Response_unknown);
  Result:= True;
end;

{Just removes the command part from the string...}
function removeCommand(fromARmA: PAnsiChar): string;
begin
  if pos(':', fromArmA)> 0 then
    result:= copy(fromARmA, Pos(':', fromArmA)+ 1, length(fromArmA))
  else
  begin
    logMessage('Syntax of line not correct.  Command needs to have a : following it, before content.');
    Result:= '';
  end;
end;

{ Entry Point from ArmA }
procedure RVExtension(toArmA: PAnsiChar; outputSize: Integer; fromArma: PAnsiChar); stdcall; export;
var
  //toArma: PAnsiChar;
  newStuff: UTF8String;
  Response: WideString;
begin
  try
    logMessage('Received: '+ fromArmA);

    // Check for the different command requests.
    if copy(fromArmA, 1, Length(C_CMD_Version))= C_CMD_Version then
      handleVersion(toArmA, outputSize)
    else if copy(fromArmA, 1, Length(C_CMD_Clear))= C_CMD_Clear then
      handleClear(toArmA, outputSize, removeCommand(fromArmA))
    else if copy(fromArmA, 1, Length(C_CMD_Save))= C_CMD_Save then
      handleSave(toArmA, outputSize, removeCommand(fromArmA))
    else if copy(fromArmA, 1, Length(C_CMD_Load))= C_CMD_Load then
      handleLoad(toArmA, outputSize, removeCommand(fromArmA))
    else if copy(fromArmA, 1, Length(C_CMD_SetMission))= C_CMD_SetMission then
      handleSetMission(toArmA, outputSize, removeCommand(fromArma))
    else if copy(fromArma, 1, length(C_CMD_GetMissions))= C_CMD_GetMissions then
      handleGetMissions(toArma, outputSize, removeCommand(fromArma))
    else
      handleUnknown(toArmA, outputSize);

    Logmessage('Response: '+ toArmA);
  except
    logMessage('Exception: '+ Exception(ExceptObject).Message);
  end;
end;

{ Returns the fully qualified config filename .}
function getConfigFileName: string;
var
  myDocs: array[0..Max_Path] of Char;
begin
  // try a few different places for the config file...base A3 folder and my documents
  Result:= '';
  if fileExists(GetCurrentDir+ C_ConfigFilename) then
    Result:= GetCurrentDir+ C_ConfigFilename
  else
  begin
    if not shGetSpecialFolderPath(0, myDocs, CSIDL_personal, False) then exit;
    if fileExists(string(myDocs)+ C_ConfigFolder+ C_ConfigFilename) then
      Result:= string(myDocs)+ C_ConfigFolder+ C_ConfigFilename;
  end;
  logMessage('config used is '+ result);
end;

{ Loads up the config parameters. }
function loadConfig: Boolean;
var
  configFile: TextFile;
  missionsDirectory, fileLine: String;
begin
  // Only one config parameter at the moment, location of the mission files...so I can be lazy.
//  logMessage('reading config, looking for '+ getCurrentDir+ '\'+ C_ConfigFilename);
  if getConfigFileName<> '' then
  begin
    AssignFile(configFile, getConfigFileName);
    reset(configFile);
    try
      while not Eof(configFile) do
      begin
        readln(configFile, fileLine);
        //logmessage('read config line of '+ fileLine);
        // Allowing comment lines to start with #...so skip those.
        if copy(fileLine, 1, 1)= C_Config_CommentChar then
        begin
          {Nothing to do - ignore.}
        end
        else if pos(C_Config_AARDir, fileLine)> 0 then
        begin
          //logMessage('found missions definition.');
          missionsDirectory:= trimLeft(copy(fileLine, pos('=', fileLine)+ 1, length(fileLine)));
          //logMessage('missions directory is '+ missionsDirectory);
          if DirectoryExists(missionsDirectory) then
          begin
            G_AARDirectory:= missionsDirectory;
            // Logging here because that's where G_MissionsDIrectory is set.
            logMessage('Config Missions Directory set to: '+ missionsDirectory);
          end;
        end;
      end;
    finally
      Closefile(configFile);
    end;
  end;
end;  {end of loadConfig function.}

exports
  RVExtension name '_RVExtension@12';

begin
  { Run when the dll is loaded .}
  G_AARDirectory:= '';   // Start with the ArmA folder.
  G_CurrentMission:= '';
  G_LastLoadLine:= 0;
  G_PerformSaves:= False;  // Don't start out by saving anything.
  loadConfig;
end.





