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
    Button4: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ListBox1: TListBox;
    OpenDialog1: TOpenDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Label3ChangeBounds(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure play(FN: String);
  private
    { private declarations }
  public
    { public declarations }
  end;


  type track = class(TObjecT)
    public
      Path: String;
  end;

var
  Form1: TForm1;
  floatable: DWORD; // floating-point channel support?
  FileSong: String;
  CurIndex: Integer;
  Counter : Integer = 0;
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.play(FN: String);
begin
  uos_LoadLib( '/usr/lib64/libportaudio.so', nil, '/usr/lib64/libmpg123.so',  nil, nil, nil); // only PortAudio and Mpg123 are needed.
  uos_CreatePlayer( 0 );              // you may create how many players you want, from 0 to to what you computer can do...
  uos_AddIntoDevOut( 0 );             // Add Output with default parameters
  uos_AddFromFile( 0, PChar(FN) ); // Input from audio file
    // And let's play it...
  uos_Play(0);
  curIndex :=    ListBox1.ItemIndex+1;
  if (counter>curIndex) then
  begin
     ListBox1.ItemIndex:=curIndex;
  end;


end;



procedure TForm1.Button1Click(Sender: TObject);
begin
  OpenDialog1.InitialDir:='/run/media/roland/92A66B79A66B5CAB/music/Angerfist/Angerfist (Danny Masseling) Discography/Unreleased, Other/';
  OpenDialog1.Execute;
  Label2.Caption:=OpenDialog1.FileName;
  FileSong := OpenDialog1.FileName;
  ListBox1.Items.Add(FileSong);
  Counter := counter +1;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 play(ListBox1.GetSelectedText);
end;


procedure TForm1.Button4Click(Sender: TObject);
begin
  uos_Stop(0);
end;

procedure TForm1.Label3ChangeBounds(Sender: TObject);
begin
  play(ListBox1.GetSelectedText);
end;

procedure TForm1.ListBox1Click(Sender: TObject);
begin

end;





end.

