unit _Monitor_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Menus, Printers, ExtCtrls;

type
  TMonitor_ = class(TForm)
    RichEdit1: TRichEdit;
    PopupMenu1: TPopupMenu;
    Dimensiunecaractere1: TMenuItem;
    N08: TMenuItem;
    N10: TMenuItem;
    N12: TMenuItem;
    N14: TMenuItem;
    N1: TMenuItem;
    Inchidere1: TMenuItem;
    N06: TMenuItem;
    Export1: TMenuItem;
    Notepad1: TMenuItem;
    WordPad1: TMenuItem;
    Excel1: TMenuItem;
    N07: TMenuItem;
    N09: TMenuItem;
    N11: TMenuItem;
    N13: TMenuItem;
    N15: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Imprimanta1: TMenuItem;
    PrinterSetupDialog1: TPrinterSetupDialog;
    Loading: TPanel;
    ProgressBar1: TProgressBar;
    MainMenu1: TMainMenu;
    Iesire1: TMenuItem;
    procedure Inchidere1Click(Sender: TObject);
    procedure N06Click(Sender: TObject);
    procedure N07Click(Sender: TObject);
    procedure N08Click(Sender: TObject);
    procedure N09Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Notepad1Click(Sender: TObject);
    procedure WordPad1Click(Sender: TObject);
    procedure Excel1Click(Sender: TObject);
    procedure Imprimanta1Click(Sender: TObject);
    procedure Iesire1Click(Sender: TObject);
  private
    { Private declarations }
    Procedure Dimensionare(i:Integer);
  public
    { Public declarations }
  end;

var
  Monitor_: TMonitor_;

implementation

uses _Export_, _Controv_;

{$R *.DFM}

procedure TMonitor_.Inchidere1Click(Sender: TObject);
begin
  Monitor_.Close;
end;

Procedure TMonitor_.Dimensionare(i:Integer);
Begin
  RichEdit1.Font.Size:=i;
End;

procedure TMonitor_.N06Click(Sender: TObject);
begin
  N06.Checked:=True;
  Dimensionare(6);
end;

procedure TMonitor_.N07Click(Sender: TObject);
begin
  N07.Checked:=True;
  Dimensionare(7);
end;

procedure TMonitor_.N08Click(Sender: TObject);
begin
  N08.Checked:=True;
  Dimensionare(8);
end;

procedure TMonitor_.N09Click(Sender: TObject);
begin
  N09.Checked:=True;
  Dimensionare(9);
end;

procedure TMonitor_.N10Click(Sender: TObject);
begin
  N10.Checked:=True;
  Dimensionare(10);
end;

procedure TMonitor_.N11Click(Sender: TObject);
begin
  N11.Checked:=True;
  Dimensionare(11);
end;

procedure TMonitor_.N12Click(Sender: TObject);
begin
  N12.Checked:=True;
  Dimensionare(12);
end;

procedure TMonitor_.N13Click(Sender: TObject);
begin
  N13.Checked:=True;
  Dimensionare(13);
end;

procedure TMonitor_.N14Click(Sender: TObject);
begin
  N14.Checked:=True;
  Dimensionare(14);
end;

procedure TMonitor_.N15Click(Sender: TObject);
begin
  N15.Checked:=True;
  Dimensionare(15);
end;

procedure TMonitor_.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Export_.SaveDialog1.DefaultExt:='MNT';
end;

procedure TMonitor_.Notepad1Click(Sender: TObject);
begin
  Export_.SaveDialog1.DefaultExt:='TXT';
  Export_.SaveDialog1.FilterIndex:=1;
  Export_.BitBtn1Click(Sender);
end;

procedure TMonitor_.WordPad1Click(Sender: TObject);
begin
  Export_.SaveDialog1.DefaultExt:='RTF';
  Export_.SaveDialog1.FilterIndex:=2;
  Export_.BitBtn1Click(Sender);
end;

procedure TMonitor_.Excel1Click(Sender: TObject);
begin
  Export_.SaveDialog1.DefaultExt:='XLS';
  Export_.SaveDialog1.FilterIndex:=3;
  Export_.BitBtn1Click(Sender);
end;

procedure TMonitor_.Imprimanta1Click(Sender: TObject);
begin
  Printer.Orientation:=poLandScape;
  If PrinterSetupDialog1.Execute Then
    RichEdit1.Print('Controv - ['+Extragere(ExtractFileName(AdresaFisier),4,True)+']');
end;



procedure TMonitor_.Iesire1Click(Sender: TObject);
begin
  If PermiteIesirea Then
    Monitor_.Close;
end;

end.
