unit _Istoric_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Menus;

type
  TIstoric_ = class(TForm)
    Memo2: TMemo;
    Memo1: TMemo;
    Panel1: TPanel;
    Memo3: TMemo;
    MainMenu1: TMainMenu;
    Iesire1: TMenuItem;
    Ajutor: TRadioButton;
    Versiune: TRadioButton;
    Contract: TRadioButton;
    procedure Iesire1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Istoric_: TIstoric_;

implementation

{$R *.DFM}

Uses _Controv_;

procedure TIstoric_.Iesire1Click(Sender: TObject);
begin
  If PermiteIesirea Then
    Istoric_.Close;
end;

procedure TIstoric_.FormActivate(Sender: TObject);
begin
  Memo1.Visible:=Ajutor.Checked;
  Memo2.Visible:=Versiune.Checked;
  Memo3.Visible:=Contract.Checked;
end;

end.
