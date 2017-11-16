#define AppName "Sonic R Updater"
#define AppVersion "InDev"
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
;SetupLogging=yes
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

[Files]
Source:  ".\2004_Files\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs;
Source:  ".\New_Files\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs;
Source:  ".\Replace_Files\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs;

[Icons]
Name: "{userprograms}\Sega Sonic R\Sonic R Mod Manager"; Filename: "{app}\SonicRModManager.exe"; WorkingDir: "{app}"

[Code]
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
