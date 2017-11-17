#define AppName "Sonic R Updater"
#define AppVersion "1.0"
#define GameName "Sonic R"

[Setup]
AppId={{AD463876-A5A1-401D-B12F-44794F3803E7}
AppName={#AppName}
AppVersion={#AppVersion}
DefaultDirName={code:GetDefaultDir}
DisableProgramGroupPage=yes
DirExistsWarning=no
DisableDirPage=no
AppendDefaultDirName=no
DisableReadyPage=yes
AlwaysShowDirOnReadyPage=yes
CloseApplications=yes
OutputBaseFilename={#AppName} {#AppVersion}
SetupIconFile=srud.ico
WizardImageFile=SR_large.bmp
WizardImageStretch=no
WizardSmallImageFile=SR_small.bmp 
Compression=lzma
SolidCompression=yes
Uninstallable=no
PrivilegesRequired=admin

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Messages]
SetupAppTitle={#AppName} {#AppVersion}
SetupWindowTitle={#AppName} {#AppVersion}
SelectDirLabel3={#AppName} will install an update for {#GameName} in the following folder.
FinishedLabel=Setup has completed update of {#GameName} on your computer. A Shortcut to {#GameName} Mod Manager has been added to the start menu.
ExitSetupMessage={#GameName} has not been updated.%nAre you sure you want to close the updater?
SelectDirDesc=Where should the update for {#GameName} be installed?
InstallingLabel=Please wait while Setup installs the {#GameName} update on your computer.

[InstallDelete]
Type: files; Name: "{app}\SonicR.exe"
Type: files; Name: "{app}\BIN\credits\credit00.raw"
Type: files; Name: "{app}\BIN\demos\city.dem"
Type: files; Name: "{app}\BIN\demos\factory.dem"
Type: files; Name: "{app}\BIN\demos\island.dem"
Type: files; Name: "{app}\BIN\demos\ruin.dem"
Type: files; Name: "{app}\BIN\option\opt01.raw"
Type: files; Name: "{app}\SOUND\sfx\Amy.wav"
Type: files; Name: "{app}\SOUND\sfx\Tails.wav"
Type: filesandordirs; Name: "{app}\help"

#include <idp.iss>
[CustomMessages]
IDP_FormCaption=Attempting Download of {#GameName} Mod Loader...
IDP_FormDescription=Please wait a moment...

[Files]
Source: ".\2004_Files\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: ".\New_Files\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: ".\Replace_Files\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: ".\Temp_Files\*"; DestDir: "{tmp}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{commonprograms}\Sega\SonicR\Sonic R Mod Manager"; Filename: "{app}\SonicRModManager.exe"; WorkingDir: "{app}"
Name: "{commonprograms}\Sega\SonicR\Sonic R"; Filename: "{app}\SonicR.exe"; WorkingDir: "{app}"
Name: "{commonprograms}\Sega\SonicR\Sonic R Manual"; Filename: "{app}\help\eng_html\index.htm"; WorkingDir: "{app}"
Name: "{commonprograms}\Sega\SonicR\Uninstall Sonic R"; Filename: "{app}\directx\setup.exe"; WorkingDir: "{app}"; IconFilename: "{app}\sonicr.ico"; Parameters: "/r"

[Code]
var ProgressPage: TOutputProgressWizardPage;

procedure InitializeWizard;
begin
  idpSetOption('ErrorDialog',  'none');
  idpAddFile('http://mm.reimuhakurei.net/misc/SonicRModLoader.7z', ExpandConstant('{tmp}\SonicRModLoader.7z'));
  idpDownloadAfter(wpSelectDir);
  ProgressPage := CreateOutputProgressPage('Finishing up...','');
end;

function GetDefaultDir(def: string): string;
var InstalledDir : string;
begin
    //Check 32bit registry
    if RegQueryStringValue(HKLM, 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Sonic R',
     'UninstallString', InstalledDir) then
    begin
    end
    else if RegQueryStringValue(HKLM32, 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Sonic R',
     'UninstallString', InstalledDir) then
    begin
    end
    //Check 64bit registry
    else if RegQueryStringValue(HKLM64, 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Sonic R',
     'UninstallString', InstalledDir) then
    begin
    end
	  StringChangeEx(InstalledDir, 'directx\setup /r', '', True);
    Result := InstalledDir;    
end;

function NextButtonClick(PageId: Integer): Boolean;
begin
    Result := True;
    if (PageId = wpSelectDir) and (
    not FileExists(ExpandConstant('{app}\sonicr.exe'))
    or not FileExists(ExpandConstant('{app}\directx\setup.exe'))
    ) then
    begin
        MsgBox('The selected path does not contain a copy of Sonic R (1998), please browse to the correct path and try again or exit.', mbError, MB_OK);
        Result := False;
        exit;
    end
end;

procedure CurStepChanged(CurStep: TSetupStep);
var ErrorCode: Integer;
begin
  if CurStep = ssPostInstall then
  begin 
      //Start Post Install
      ProgressPage.Show;
      
      //Install Sonic R Mod Loader
      ProgressPage.SetText('Installing Sonic R Mod Loader...', '');
      ProgressPage.SetProgress(10, 100);
      begin
        if FileExists(ExpandConstant('{tmp}\SonicRModLoader.7z')) then begin
        Exec(ExpandConstant('{tmp}\7za.exe'), ExpandConstant('x -y {tmp}\SonicRModLoader.7z -o"{app}"'), '', SW_HIDE, ewWaitUntilTerminated, ErrorCode);
        end else begin
        Exec(ExpandConstant('{tmp}\7za.exe'), ExpandConstant('x -y {tmp}\SonicRModLoader_fallback.7z -o"{app}"'), '', SW_HIDE, ewWaitUntilTerminated, ErrorCode);
        end
      end
      
      //Install Mod Loader DLL Into Game
      Exec('cmd.exe', ExpandConstant('/c COPY /Y "{app}\mods\SonicRModLoader.dll" "{app}\d3d9.dll"'), '', SW_HIDE, ewWaitUntilTerminated, ErrorCode);
      
      //Installing .NET Runtime...
      ProgressPage.SetText('Installing Microsoft .NET...', '');
      ProgressPage.SetProgress(40, 100);
      Exec(ExpandConstant('{tmp}\redists\dotNetFx40_Full_x86_x64.exe'), '/q /norestart', '', SW_SHOW, ewWaitUntilTerminated, ErrorCode);
            
      //Install Visual C++ Runtimes...
      ProgressPage.SetText('Installing Visual C++...', '');
      ProgressPage.SetProgress(70, 100);
      Exec(ExpandConstant('{tmp}\redists\vc_redist.x86.2017.exe'), '/q /norestart', '', SW_SHOW, ewWaitUntilTerminated, ErrorCode);      

      //Delete files - 7za, SonicRModLoader.7z, 1998 shortcuts
      ProgressPage.SetText('Cleaning up work files...', '');
      ProgressPage.SetProgress(90, 100);
      DelTree(ExpandConstant('{app}\7za.exe'), False, True, False);
      DelTree(ExpandConstant('{app}\SonicRModLoader.7z'), False, True, False);
      DelTree(ExpandConstant('{userprograms}\Sega Sonic R'), True, True, True);

      //End Post Install
      ProgressPage.Hide;
    end;
end;

[Run]
Filename: "{app}\SonicRModManager.exe"; Description: "Open Sonic R Mod Manager"; Flags: shellexec runasoriginaluser postinstall nowait