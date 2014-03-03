unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

const
  contactExpireTime= 90;  // Hard coded at the moment ****


type
  TGroupContact= record
    groupName: string;
    contactStart, lastUpdate, Duration: Double;
    shots: integer;
    startXPos, startYPos: Double;
    finished: Boolean;
    WIAs: String;
    members: String;
    indexPosStart: Integer;
  end;

  PgroupContact= ^TGroupContact;


  TmainForm = class(TForm)
    generatorReport: TButton;
    logProgress: TMemo;
    aarFileSelect: TOpenDialog;
    procedure generatorReportClick(Sender: TObject);
  private
    { Private declarations }
    contactReports: TList;
    function logMessage(const msg: string): Boolean;
    function parseJSONUnitPos(var fileData: String; isDead: Boolean= false; indexPosition: Integer= -1): String;
    function parseJSONVehiclePos(var fileData: String): string;
    function SecToTime(Sec: Integer): string;
    function CloseContacts(currTime: Double; forceClose: Boolean= false): Boolean;
    function PublishContacts: Boolean;
    function recordContact(unitName, groupName: string; contactTime: double;
      shots, hits: integer; xPos, yPos: Double; indexPos: Integer): Boolean;
    function vehicleType(source: String): String;
    function DeleteJsonFiles: Boolean;
  public
    { Public declarations }
  end;

var
  mainForm: TmainForm;

implementation

{$R *.dfm}

uses
  System.StrUtils
  ;

function TmainForm.parseJSONUnitPos(var fileData: String; isDead: Boolean= false; indexPosition: Integer= -1): String;
var
  jsonResponse, groupName, unitName: String;
  recordTime, xPos, yPos: double;
  hits, shots: integer;
begin
  // String will look like this - 7036.01,'unitpos',["Isofidou",[14177.9,18652.4,0.00139427],"Alpha 2-1",false,0,EAST,0,0]]
(*if !(vehicle _x== _x) then
		{
			_unitDetail= [name _x, netId _x, position _x, groupID (group _x), true, damage _x, side _x, assignedTeam _x ,_x getVariable "axymassaar_shotCount", _x getVariable "axymassaar_hitCount"];
		} else
		{
			_unitDetail= [name _x, netId _x, position _x, groupID (group _x), false, damage _x, side _x, assignedTeam _x, _x getVariable "axymassaar_shotCount", _x getVariable "axymassaar_hitCount"];
		};

  and if dead..

  _unitDetail= [name _x, netId _x, position _x, groupID (group _x), false, 1, side (group _x), assignedTeam _x];

                *)

  recordTime:= StrtoFloat(copy(fileData, 1, pos(',', fileData)- 1));
  // Remove the initial crap up to the name.
  delete(fileData, 1, pos('[', fileData));
  jsonResponse:= '{"name":"'+ copy(fileData, 2, pos(',', fileData)- 3)+ '",';
  unitName:= copy(fileData, 2, pos(',', fileData)- 3);
  // Now the unit ID.
  delete(fileData, 1, pos('","', fileData)+ 2);
  jsonResponse:= jsonResponse+ '"id":"'+ copy(fileData, 1, pos('",', fileData)- 1)+ '",';
  // Now up to the coordinates.
  delete(fileData, 1, pos(',[', fileData)+ 1);
  jsonResponse:= jsonResponse+ '"x":'+ InttoStr(Round(StrtoFloat(copy(fileData, 1, pos(',', fileData)- 1))))+ ',';
  xPos:= StrtoFloat(copy(fileData, 1, pos(',', fileData)- 1));
  delete(fileData, 1, pos(',', fileData));
  jsonResponse:= jsonResponse+ '"y":'+ InttoStr(Round(StrtoFloat(copy(fileData, 1, pos(',', fileData)- 1))))+ ',';
  yPos:= StrtoFloat(copy(fileData, 1, pos(',', fileData)- 1));

  // now the group they're in - can be empty, especially if they've been dead for a while.
  delete(fileData, 1, pos('"', fileData));
  jsonResponse:= jsonResponse+ '"grp":"'+copy(fileData, 1, pos('"', fileData)- 1)+ '",';
  groupName:= copy(fileData, 1, pos('"', fileData)- 1);

  // Now if in a vehicle.
  delete(fileData, 1, pos('"', fileData)+ 1);
  if copy(fileData, 1, 4)= 'true' then
    jsonResponse:= jsonResponse+ '"inveh":true,'
  else
    jsonResponse:= jsonResponse+ '"inveh":false,';

  // Now damage.
  delete(fileData, 1, pos(',', fileData));
  jsonResponse:= jsonResponse+ '"dam":'+ copy(fileData, 1, pos(',', fileData)- 1)+ ',';

  // Now the side.
  delete(fileData, 1, pos(',', fileData));
  jsonResponse:= jsonResponse+ '"side":"'+ Copy(fileData, 1, pos(',', fileData)- 1)+ '",';

  // Alive specific hits/fired.
  if (not isDead) then
  begin
    // Team (main or colour. - skipped for now, might be an issue with locality on this.)
    //so just delete that bit.
    delete(fileData, 1, pos(',', fileData));
    delete(fileData, 1, pos(',', fileData));
    // now shots fired.
    jsonResponse:= jsonResponse+ '"shots":'+ copy(fileData, 1, pos(',', fileData)- 1)+ ',';
    try
      shots:= StrtoInt(copy(fileData, 1, pos(',', fileData)- 1));

      // Hits taken
      delete(fileData, 1, pos(',', fileData));
      jsonResponse:= jsonResponse+ '"hits":'+ copy(fileData, 1, pos(',', fileData)- 1)+ ',';
      hits:= StrtoInt(copy(fileData, 1, pos(',', fileData)- 1));

      // shot direction taken.
      delete(fileData, 1, pos(',', fileData));
      jsonResponse:= jsonResponse+ '"fdir":'+ copy(fileData, 1, pos(']', fileData)- 1);  // no trailing comma.

      // Contact Report?
      recordContact(unitName, groupName, recordTime, shots, hits, xPos, yPos, indexPosition);
    except
      {Don't care yet.}
    end;
  end
  else
    jsonResponse:= jsonResponse+ '"isDead":true';  // No final comma.
  // wrap it up.
  jsonResponse:= jsonResponse+ '}';

  Result:= jsonResponse;
end;

function TmainForm.parseJSONVehiclePos(var fileData: String): string;
var
  jsonResponse: String;
begin
  //   2923.51,'vehiclepos',["B_Heli_Transport_01_F",[23727.4,18540.2,0.048718],"",0.0669291,WEST]]
  // Remove the initial crap up to the name.
  delete(fileData, 1, pos('[', fileData));
  jsonResponse:= '{"vehicle":"'+ vehicleType(copy(fileData, 2, pos(',', fileData)- 3))+ '",';
  // Now up to the coordinates.
  delete(fileData, 1, pos(',[', fileData)+ 1);
  jsonResponse:= jsonResponse+ '"x":'+ InttoStr(Round(StrtoFloat(copy(fileData, 1, pos(',', fileData)- 1))))+ ',';
  delete(fileData, 1, pos(',', fileData));
  jsonResponse:= jsonResponse+ '"y":'+ InttoStr(Round(StrtoFloat(copy(fileData, 1, pos(',', fileData)- 1))))+ ',';
  if pos('EAST', fileData)> 0 then
    jsonResponse:= jsonResponse+ '"side":"EAST"'
  else if pos('CIV', fileData)> 0 then
    jsonResponse:= jsonResponse+ '"side":"CIV"'
  else
    jsonResponse:= jsonResponse+ '"side":"WEST"';
  // wrap it up.
  jsonResponse:= jsonResponse+ '}';
  Result:= jsonResponse;
end;

function TmainForm.SecToTime(Sec: Integer): string;
var
   ZH, ZM, ZS: Integer;
   wantedTime: TDateTime;
begin
   ZH := Sec div 3600;
   ZM := Sec div 60 - ZH * 60;

   ZS := Sec - (ZH * 3600 + ZM * 60) ;
   wantedTime:= encodeTime(ZH, ZM, ZS, 0);
   Result:= formatDateTime('hh:nn:ss', wantedTime);
end;

function TmainForm.vehicleType(source: String): String;
begin
  if leftstr(source, 3)= 'HMG' then
    result:= 'installation'
  else if leftstr(source, 3)= 'GMG' then
    result:= 'mortar'
  else if leftstr(source, 2)= 'AA' then
    result:= 'installation'
  else if pos('Offroad', source)> 0 then
    result:= 'motor_inf'
  else if leftstr(source, 4)= 'MRAP' then
    result:= 'motor_inf'
  else if pos('plane', source)> 0 then
    result:= 'plane'
  else if pos('heli', source)> 0 then
    result:= 'air'
  else if leftstr(source, 3)= 'AT_' then
    result:= 'mech_inf'
  else if leftstr(source, 3)= 'UAV' then
    result:= 'uav'
  else
  begin
    // LogMessage('Unrecognised Vehicle Type of '+ source+ ' setting as unknown.');
    result:= 'unknown';
  end;
end;

{ Starts or updates an existing contact for a group. }
function TmainForm.recordContact(unitName, groupName: string; contactTime: double;
  shots, hits: integer; xPos, yPos: Double; indexPos: Integer): Boolean;
var
  PContact: PgroupContact;
  contacts: Integer;
begin
  result:= false;
  if (shots= 0) and (hits= 0) then exit;
  for contacts:= 0 to contactReports.Count- 1 do
  begin
    pContact:= ContactReports.Items[contacts];
    // Found an existing contact to update?
    if (not pContact^.finished) and (pContact^.groupName= groupName) then
    begin
      pContact^.shots:= pContact^.shots+ shots;
      pContact^.lastUpdate:= contactTime;
      if hits> 0 then
      begin
        // Have we already recorded a hit for this player?
        if Length(pContact^.WIAs)= 0 then
          pContact^.WIAs:= unitName
        else if pos(unitName, pContact^.WIAs)= 0 then
          pContact^.WIAs:= pContact^.WIAs+ ', '+ UnitName;
      end;

      result:= True;
      exit;
    end;
  end;
  // Must be a new contact.
  new(pContact);
  pContact^.groupName:= groupName;
  pContact^.contactStart:= contactTime;
  pContact^.lastUpdate:= contactTime;
  pContact^.shots:= shots;
  pContact^.startXPos:= xPos;
  pContact^.startYPos:= yPos;
  pContact^.finished:= false;
  pContact^.indexPosStart:= indexPos;
  if hits=  0 then
    pContact^.WIAs:= ''
  else
    pContact^.WIAS:= unitName;
  contactReports.Add(pContact);
end;  {End of recordContact function.}

function TmainForm.CloseContacts(currTime: Double; forceClose: Boolean= false): Boolean;
var
  contacts: Integer;
  PContact: PGroupContact;
begin
  for contacts:= 0 to contactReports.Count- 1 do
  begin
    pContact:= contactReports.Items[contacts];
    if not pContact^.finished then
    begin
      if forceClose then
        pContact^.finished:= True
      else
      begin
        if (pContact^.LastUpdate+ contactExpireTime< currTime) then
        begin
          pContact^.Finished:= True;
          pContact^.Duration:= pContact^.lastUpdate- pContact^.contactStart;
        end;
      end;
    end;
  end;
  Result:= True;
end;

function TMainForm.PublishContacts: Boolean;
var
  contactFile: TextFile;
  contacts: Integer;
  PContact: PGroupContact;

begin
  AssignFile(contactFile, 'contacts.json');
  rewrite(contactFile);
  try
    // Start it.
    writeln(contactFile, '{"contacts":[');

    for contacts:= 0 to contactReports.count- 1 do
    begin
      PContact:= contactReports.Items[contacts];
      write(contactFile, '{"group":"'+ PContact^.groupName+ '","startTime":'+ FloattoStr(PContact^.contactStart)+ ',"Duration":'+ FloattoStr(PContact^.Duration)+ ',"shots":'+
        InttoStr(PContact^.shots)+ ',"xpos":'+ FloattoStr(PContact^.StartXPos)+
       ',"ypos":'+ FloattoStr(PContact^.StartYPos)+ ',"indexPos":', InttoStr(PContact^.indexPosStart)+ ',"cas":"'+ PContact^.WIAs+ '"}');
      if contacts< contactReports.Count- 1 then
        writeln(contactFile, ',');

    end;

    // End it.
    writeln(contactFile, ']}');

  finally
    CloseFile(contactFile);
  end;
  Result:= True;
end;

function TMainForm.DeleteJsonFiles: Boolean;
var
  existingFiles: TSearchrec;
begin
  if FindFirst('*.json', 0, existingFiles)= 0 then
  try
    repeat
      DeleteFile(existingFiles.Name);
    until findNext(existingFiles)<> 0;
  finally
    findClose(existingFiles);
  end;
end;

procedure TmainForm.generatorReportClick(Sender: TObject);
var
  sourceFile: TextFile;
  indexFile: TStringList;
  currentMomentFile: TStringList;
  stFileLine: String;
  currentTime, priorTime: String;

begin
  generatorReport.Enabled:= false;
  try
    if aarFileSelect.Execute then
    begin
      logMessage('Reading '+ aarFileSelect.FileName);

      // Delete the existing json files...
      DeleteJsonFiles;

      contactReports:= Tlist.Create;
      try
        assignFile(sourceFile, aarFileSelect.FileName);
        reset(sourceFile);
        try
          indexFile:= TStringList.create;
          currentMomentFile:= TStringList.Create;
          try
            // Setup the start of the index.
            indexFile.Add('{"timeline":[');

            // ignore the version line.
            readln(sourceFile, stFileLine);
            while not eof(sourceFile) do
            begin
              try
              readln(sourceFile, stFileLine);
              delete(stFileline, 1, 1);
              currentTime:= SecToTime(Round(StrtoFloat(copy(stFileline, 1, pos(',', stFileLine)- 1))));
              // In a new timezone?
              if priorTime<> currentTime then
              begin
                // It's a new event, so save the old one?
                if currentMomentFile.Count> 0 then
                begin
                  // Wrap up the last line.
                  currentMomentFile.add(']}');
                  // save it.
                  currentMomentFile.SaveToFile(InttoStr(indexFile.count- 1)+'.json');
                  // and update the index.
                  indexFile.Add('{"index":"'+ InttoStr(indexFile.count- 1)+ '","time":"'+ currentTime+ '"},');
                end;
                logMessage('Starting new position for time '+ currentTime);
                { Give the UI a mo.}
//                application.ProcessMessages;
                // New file.
                currentMomentFile.Clear;
                currentMomentFile.Add('{"positions":[');
                priorTime:= currentTime;
                // Close off any contacts?
                CloseContacts(StrtoFloat(copy(stFileline, 1, pos(',', stFileLine)- 1)));
              end;
              if pos('deadunitpos', stFileLine)> 0 then
              begin
                if currentMomentFile.Count> 1 then
                  currentMomentFile.Add(','+ parseJSONUnitPos(stFileLine, true))
                else
                  currentMomentFile.Add(parseJSONUnitPos(stFileLine, true));
              end
              else
              if pos('unitpos', stFileLine)> 0 then
              begin
                if currentMomentFile.Count> 1 then
                  currentMomentFile.Add(','+ parseJSONUnitPos(stFileLine, false, indexFile.count- 1))
                else
                  currentMomentFile.Add(parseJSONUnitPos(stFileLine, false, indexFile.count- 1));
              end
              else if pos('vehiclepos', stFileLine)> 0 then
              begin
                if currentMomentFile.Count> 1 then
                  currentMomentFile.Add(','+ parseJSONVehiclePos(stFileLine))
                else
                  currentMomentFile.Add(parseJSONVehiclePos(stFileLine));
              end;
              except
                ShowMessage(stFileLine);
              end;
            end;  //end of while.
            // Finished the index.
            indexFile.add(']}');
            indexFile.SaveToFile('index.json');
          finally
            FreeandNil(indexFile);
            FreeandNil(currentMomentFile);
          end;
        finally
          closeFile(sourceFile);
        end;
        // Close off remaining contacts.
        CloseContacts(0, true);
        // Produce the contacts reports.
        PublishContacts;

      finally
        freeandnil(contactReports);
      end;
      LogMessage('Done');
    end;
  finally
    generatorReport.Enabled:= True;
  end;
end;

function TmainForm.logMessage(const msg: string): Boolean;
begin
  logProgress.Lines.Add(TimetoStr(Time)+ ' - '+ msg);
  Result:= True;
end;

end.
