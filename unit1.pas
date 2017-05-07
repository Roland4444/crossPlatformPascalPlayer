unit Unit1;

{$mode objfpc}{$H+}

interface

uses



 Messages,Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, uos_flat;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    Label2: TLabel;
    OpenDialog1: TOpenDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  floatable: DWORD; // floating-point channel support?
  FileSong: String;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  OpenDialog1.InitialDir:='/run/media/roland/92A66B79A66B5CAB/music/Angerfist/Angerfist (Danny Masseling) Discography/Unreleased, Other/';
  OpenDialog1.Execute;
  Label2.Caption:=OpenDialog1.FileName;
  FileSong := OpenDialog1.FileName;




end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  uos_LoadLib( '/usr/lib64/libportaudio.so', nil, '/usr/lib64/libmpg123.so',  nil, nil, nil); // only PortAudio and Mpg123 are needed.
  uos_CreatePlayer( 0 );              // you may create how many players you want, from 0 to to what you computer can do...
  uos_AddIntoDevOut( 0 );             // Add Output with default parameters
  uos_AddFromFile( 0, PChar(FileSong) ); // Input from audio file
    // And let's play it...
  uos_Play(0);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  uos_Stop(0);
end;

end.

