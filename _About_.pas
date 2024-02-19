unit _About_;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, ShellAPI, Dialogs, Menus;

type
  TAboutBox = class(TForm)
    OKButton: TButton;
    Panel2: TPanel;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    Comments: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    Label3: TLabel;
    MainMenu1: TMainMenu;
    Iesire1: TMenuItem;
    procedure OKButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Label2Click(Sender: TObject);
    procedure ProgramIconClick(Sender: TObject);
    procedure Iesire1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;

implementation

{$R *.DFM}

Uses _Controv_;

Procedure Executie (s:String);
  Var t:Array[0..79]Of Char;
  Begin
    StrPCopy(t,s);
    ShellExecute(0, Nil, t, Nil, Nil, SW_NORMAL);
  End;

procedure TAboutBox.OKButtonClick(Sender: TObject);
begin
  AboutBox.Close;
end;

procedure TAboutBox.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  OKButtonClick(Sender);
end;

procedure TAboutBox.Label2Click(Sender: TObject);
begin
  If MessageDlg('Se confirma descarcarea de pe Internet'+#13+
                'a ultimei versiuni a aplicatiei?',mtInformation,
                [mbYes,mbNo],0)=mrYes Then
    Begin
      Executie ('http:\\'+Label2.Caption);
      Label2.Font.Color:=clRed;
    End;
end;

procedure TAboutBox.ProgramIconClick(Sender: TObject);
begin
  If MessageDlg('Se confirma trimiterea unui mesaj autorului?',
                mtInformation,[mbYes,mbNo],0)=mrYes Then
    Executie ('mailto:stedanarh@go.ro');
end;


procedure TAboutBox.Iesire1Click(Sender: TObject);
begin
  If PermiteIesirea Then
    AboutBox.Close;
end;

procedure TAboutBox.FormActivate(Sender: TObject);
begin
  Height:=232;
end;

end.

