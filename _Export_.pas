unit _Export_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, checklst, ExtCtrls, Spin, Buttons, ComCtrls, ShellApi(*Executie fisier*), ComObj,
  Menus(*Lucrul cu Excel*);

type
  TExport_ = class(TForm)
    NrContract: TCheckListBox;
    Label1: TLabel;
    Label2: TLabel;
    Campuri: TCheckListBox;
    Panel1: TPanel;
    SelecteazaContractele: TRadioButton;
    DeselecteazaContractele: TRadioButton;
    Panel2: TPanel;
    SelecteazaCampurile: TRadioButton;
    DeselecteazaCampurile: TRadioButton;
    BitBtn1: TBitBtn;
    SaveDialog1: TSaveDialog;
    Panel4: TPanel;
    GroupBox1: TGroupBox;
    ListBox1: TListBox;
    RichEdit1: TRichEdit;
    Loading: TPanel;
    ProgressBar1: TProgressBar;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Liniere: TCheckBox;
    Deschidere: TCheckBox;
    AutoRaport: TCheckBox;
    IngrosareAntet: TCheckBox;
    Panel3: TPanel;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Panel6: TPanel;
    Label3: TLabel;
    DataMin: TEdit;
    DataMax: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ComboBox1: TComboBox;
    ExcludereNule: TCheckBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    Label7: TLabel;
    MainMenu1: TMainMenu;
    Iesire1: TMenuItem;
    Setariimplicite1: TMenuItem;
    procedure SelecteazaContracteleClick(Sender: TObject);
    procedure DeselecteazaContracteleClick(Sender: TObject);
    procedure SelecteazaCampurileClick(Sender: TObject);
    procedure DeselecteazaCampurileClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CampuriClickCheck(Sender: TObject);
    procedure SaveDialog1TypeChange(Sender: TObject);
    procedure NrContractClickCheck(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure DataMinChange(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure LiniereClick(Sender: TObject);
    procedure Iesire1Click(Sender: TObject);
    procedure Setariimplicite1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Export_: TExport_;

implementation

uses _Controv_, _Monitor_;

{$R *.DFM}

Const Run4FirstTime:Boolean=True;
      NumarLuni:Integer=1;
      Car:String[1]='|';
      SetariExport:Array [1..20] Of Record
                                      Caractere:Integer;
                                      Eticheta1,Eticheta2:String[30];
                                    End=((Caractere: 8;Eticheta1:'Numar';              // 1
                                                       Eticheta2:'contract'),
                                         (Caractere:11;Eticheta1:'Data';               // 2
                                                       Eticheta2:'contract'),
                                         (Caractere: 5;Eticheta1:'Numar';              // 3
                                                       Eticheta2:'rata'),
                                         (Caractere: 8;Eticheta1:'Valoare';            // 4
                                                       Eticheta2:'rata'),
                                         (Caractere:11;Eticheta1:'Termen de';          // 5
                                                       Eticheta2:'plata rata'),
                                         (Caractere:25;Eticheta1:'Perioada curenta';   // 6
                                                       Eticheta2:'valabilitate rovinieta'),
                                         (Caractere:11;Eticheta1:'Data exp.';          // 7
                                                       Eticheta2:'rovinieta'),
                                         (Caractere:10;Eticheta1:'Numar rata';         // 8
                                                       Eticheta2:'de achitat'),
                                         (Caractere:12;Eticheta1:'Valoare rata';       // 9
                                                       Eticheta2:'de achitat'),
                                         (Caractere:25;Eticheta1:'Valabilitate';       //10
                                                       Eticheta2:'rata de achitat'),
                                         (Caractere: 9;Eticheta1:'Rata';               //11
                                                       Eticheta2:'achitata'),
                                         (Caractere: 7;Eticheta1:'Numar';              //12
                                                       Eticheta2:'factura'),
                                         (Caractere: 3;Eticheta1:'Nr.';                //13
                                                       Eticheta2:'crt'),
                                         (Caractere:25;Eticheta1:'Tip';                //14
                                                       Eticheta2:'autovehicul'),
                                         (Caractere:13;Eticheta1:'Numar';              //15
                                                       Eticheta2:'inmatriculare'),
                                         (Caractere:17;Eticheta1:'Numar';              //16
                                                       Eticheta2:'identificare'),
                                         (Caractere: 9;Eticheta1:'Masa';               //17
                                                       Eticheta2:'max.aut.'),
                                         (Caractere: 5;Eticheta1:'Numar';              //18
                                                       Eticheta2:'axe'),
                                         (Caractere: 8;Eticheta1:'Clasa';              //19
                                                       Eticheta2:'poluare'),
                                         (Caractere: 8;Eticheta1:'Tarif';
                                                       Eticheta2:'auto'));             //20

procedure TExport_.SelecteazaContracteleClick(Sender: TObject);
Var i:Integer;
begin
  For i:=0 To NrContract.Items.Capacity-1 DO
    NrContract.Checked[i]:=True;
end;

procedure TExport_.DeselecteazaContracteleClick(Sender: TObject);
Var i:Integer;
begin
  For i:=0 To NrContract.Items.Capacity-1 DO
    NrContract.Checked[i]:=False;
end;

procedure TExport_.SelecteazaCampurileClick(Sender: TObject);
Var i:Integer;
begin
  For i:=0 To Campuri.Items.Capacity-1 DO
    Campuri.Checked[i]:=True;
end;

procedure TExport_.DeselecteazaCampurileClick(Sender: TObject);
Var i:Integer;
begin
  For i:=0 To Campuri.Items.Capacity-1 DO
    Campuri.Checked[i]:=False;
end;

procedure TExport_.BitBtn1Click(Sender: TObject);
Const TotalRatePerioada:Extended=0;
Var i,j,k,l,m,n,maxk:Integer;
    s1,s2,s3:AnsiString;
    t:String;
    Fisier,Book,Sheet,Range,Temp:Variant;
Function Linie(n:Integer):AnsiString;
Var s:AnsiString;
    i:LongInt;
Begin
  s:='';
  For i:=1 To n Do
    s:=s+'-';
  Linie:=s;
End;
Function EDE(s:String):String;  //Extragere data expirare
Begin
  Result:='';
  If Length(s)=17 Then
    Begin
      Delete(s,1,Length(s)-8);
      Result:=s;
    End;
End;
Function RatePerioada(Poz:Integer;Verifica:Boolean):Boolean;
Var k:Integer;
    s:Boolean;
Begin
  s:=True;
  If Verifica Then
    Case ComboBox3.ItemIndex Of
      0:
        s:=(Controv[Poz].Rata[1].Termen>=DataMin.Text) And (Controv[Poz].Rata[1].Termen<=DataMax.Text) Or
           (Controv[Poz].Rata[2].Termen>=DataMin.Text) And (Controv[Poz].Rata[2].Termen<=DataMax.Text) Or
           (Controv[Poz].Rata[3].Termen>=DataMin.Text) And (Controv[Poz].Rata[3].Termen<=DataMax.Text) Or
           (Controv[Poz].Rata[4].Termen>=DataMin.Text) And (Controv[Poz].Rata[4].Termen<=DataMax.Text);
      1:
        s:=(EDE(Controv[Poz].Rata[1].Valabilitate)>=DataMin.Text) And (EDE(Controv[Poz].Rata[1].Valabilitate)<=DataMax.Text) Or
           (EDE(Controv[Poz].Rata[2].Valabilitate)>=DataMin.Text) And (EDE(Controv[Poz].Rata[2].Valabilitate)<=DataMax.Text) Or
           (EDE(Controv[Poz].Rata[3].Valabilitate)>=DataMin.Text) And (EDE(Controv[Poz].Rata[3].Valabilitate)<=DataMax.Text) Or
           (EDE(Controv[Poz].Rata[4].Valabilitate)>=DataMin.Text) And (EDE(Controv[Poz].Rata[4].Valabilitate)<=DataMax.Text);
    End;
  Result:=s;
End;
Procedure GenerareRaport;
  Var i,k,r,s,Temp:Integer;
      c:Currency;
      TotalRateNoi:Extended;
      Aproximare:String[5];
      TempS:String;
  Begin
    ListBox1.Clear;
    RichEdit1.Clear;
    s1:=Car+' ';
    s2:=Car+' ';
    k:=0;
    r:=0;
    For i:=1 To 20 Do
      If Campuri.Checked[i-1] Then
        Begin
          s1:=s1+AddSpace(SetariExport[i].Eticheta1,SetariExport[i].Caractere,False)+' '+Car+' ';
          s2:=s2+AddSpace(SetariExport[i].Eticheta2,SetariExport[i].Caractere,False)+' '+Car+' ';
          If (i>6) And (r=0) Then
            Begin
              Inc(r);
              Delete(s1,Length(s1),1);       ///--- personalizare
              s1:=s1+'| ';                   ///--- linia dubla
              Delete(s2,Length(s2),1);       ///--- personalizare
              s2:=s2+'| ';                   ///--- linia dubla
            End;
        End;
    If Liniere.Checked Then
      Begin
        ListBox1.Items.Add (Car+Linie(Length(s1)-3)+Car);
        RichEdit1.Lines.Add (Car+Linie(Length(s1)-3)+Car);
      End;
    ListBox1.Items.Add(s1);
    ListBox1.Items.Add(s2);
    If IngrosareAntet.Checked Then
      RichEdit1.SelAttributes.Style:=[fsBold];
    RichEdit1.Lines.Add(s1);
    RichEdit1.Lines.Add(s2);
    If IngrosareAntet.Checked Then
      RichEdit1.SelAttributes.Style:=[];
    s2:='';
    j:=0;
    TotalRatePerioada:=0;
    TotalRateNoi:=0;
    Aproximare:='';
    For i:=1 To NrContract.Items.Capacity Do
      Begin
        If (NrContract.Checked[i-1]) And (RatePerioada(i,ExcludereNule.Checked)) Then
          Begin
            If Liniere.Checked Then
              Begin
                TempS:=Car+'-';
                r:=0;
                For s:=1 To 20 Do
                  Begin
                    If Campuri.Checked[s-1] Then
                      TempS:=TempS+Linie(SetariExport[s].Caractere)+'-'+Car+'-';
                    If (s>6) And (r=0) Then
                      Begin
                        Inc(r);
                        Delete(TempS,Length(TempS),1);       ///--- personalizare
                        TempS:=TempS+'|-';                   ///--- linia dubla
                      End;
                  End;
                Delete(TempS,Length(TempS),1);
                ListBox1.Items.Add(TempS);
                RichEdit1.Lines.Add(TempS);
              End;
            s2:=Car+' ';
            Inc(j);
            If Campuri.Checked[0] Then
              s2:=s2+AddSpace(Controv[i].nrContract,SetariExport[1].Caractere,True)+' '+Car+' ';
            If Campuri.Checked[1] Then
              s2:=s2+AddSpace(ScriereData(Controv[i].dataContract,FormatData),SetariExport[2].Caractere,True)+' '+Car+' ';
            For k:=1 To 4 Do
              Begin
                If Campuri.Checked[2] Then
                  Case ComboBox3.ItemIndex Of
                    0:
                      If (Controv[i].Rata[k].Termen>=DataMin.Text) And (Controv[i].Rata[k].Termen<=DataMax.Text) Then
                        s2:=s2+AddSpace(IntToStr(Controv[i].Rata[k].Poz),SetariExport[3].Caractere,True)+' '+Car+' ';
                    1:
                      If (EDE(Controv[i].Rata[k].Valabilitate)>=DataMin.Text) And (EDE(Controv[i].Rata[k].Valabilitate)<=DataMax.Text) Then
                        s2:=s2+AddSpace(IntToStr(Controv[i].Rata[k].Poz),SetariExport[3].Caractere,True)+' '+Car+' ';
                  End;
              End;
            For k:=1 To 4 Do
              Begin
                If Campuri.Checked[3] Then
                  Case ComboBox3.ItemIndex Of
                    0:
                      If (Controv[i].Rata[k].Termen>=DataMin.Text) And (Controv[i].Rata[k].Termen<=DataMax.Text) Then
                        Begin
                          s2:=s2+AddSpace(Virgularizare3(Controv[i].Rata[k].Taxa,Controv_.Utilizareseparatormii1.Checked),SetariExport[4].Caractere,True)+' '+Car+' ';
                          TotalRatePerioada:=TotalRatePerioada+Controv[i].Rata[k].Taxa;
                        End;
                    1:
                      If (EDE(Controv[i].Rata[k].Valabilitate)>=DataMin.Text) And (EDE(Controv[i].Rata[k].Valabilitate)<=DataMax.Text) Then
                        Begin
                          s2:=s2+AddSpace(Virgularizare3(Controv[i].Rata[k].Taxa,Controv_.Utilizareseparatormii1.Checked),SetariExport[4].Caractere,True)+' '+Car+' ';
                          TotalRatePerioada:=TotalRatePerioada+Controv[i].Rata[k].Taxa;
                        End;
                  End;
              End;
            For k:=1 To 4 Do
              Begin
                If Campuri.Checked[4] Then
                  Case ComboBox3.ItemIndex Of
                    0:
                      If (Controv[i].Rata[k].Termen>=DataMin.Text) And (Controv[i].Rata[k].Termen<=DataMax.Text) Then
                        s2:=s2+AddSpace(ScriereData(Controv[i].Rata[k].Termen,FormatData),SetariExport[5].Caractere,False)+' '+Car+' ';
                    1:
                      If (EDE(Controv[i].Rata[k].Valabilitate)>=DataMin.Text) And (EDE(Controv[i].Rata[k].Valabilitate)<=DataMax.Text) Then
                        s2:=s2+AddSpace(ScriereData(Controv[i].Rata[k].Termen,FormatData),SetariExport[5].Caractere,False)+' '+Car+' ';
                  End;
              End;
            For k:=1 To 4 Do
              Begin
                If Campuri.Checked[5] Then
                  Case ComboBox3.ItemIndex Of
                    0:
                      If (Controv[i].Rata[k].Termen>=DataMin.Text) And (Controv[i].Rata[k].Termen<=DataMax.Text) Then
                        s2:=s2+AddSpace(ScriereData(Extragere(Controv[i].Rata[k].Valabilitate,Length(Controv[i].Rata[k].Valabilitate)-8,True),FormatData)+' - '+
                                        ScriereData(Extragere(Controv[i].Rata[k].Valabilitate,8,False),FormatData),SetariExport[6].Caractere,True)+' '+Car+' ';
                    1:
                      If (EDE(Controv[i].Rata[k].Valabilitate)>=DataMin.Text) And (EDE(Controv[i].Rata[k].Valabilitate)<=DataMax.Text) Then
                        s2:=s2+AddSpace(ScriereData(Extragere(Controv[i].Rata[k].Valabilitate,Length(Controv[i].Rata[k].Valabilitate)-8,True),FormatData)+' - '+
                                        ScriereData(Extragere(Controv[i].Rata[k].Valabilitate,8,False),FormatData),SetariExport[6].Caractere,True)+' '+Car+' ';
                  End;
              End;
            ///---6..9
            If Campuri.Checked[6] Then
              Begin
                For k:=1 To 4 Do
                  Begin
                    Temp:=0;
                    Case ComboBox3.ItemIndex Of
                      0:
                        If (Controv[i].Rata[k].Termen>=DataMin.Text) And (Controv[i].Rata[k].Termen<=DataMax.Text) Then
                          Begin
                            Temp:=Controv[i].Rata[k].Poz+1;
                            Break;
                          End;
                      1:
                        If (EDE(Controv[i].Rata[k].Valabilitate)>=DataMin.Text) And (EDE(Controv[i].Rata[k].Valabilitate)<=DataMax.Text) Then
                          Begin
                            Temp:=Controv[i].Rata[k].Poz+1;
                            Break;
                          End;
                    End;
                  End;
                s2:=s2+AddSpace(ScriereData(Extragere(Controv[i].Rata[k].Valabilitate,8,False),FormatData),SetariExport[7].Caractere,True)+' '+Car+' '
              End;
            Delete(s2,Length(s2),1);       ///--- personalizare
            s2:=s2+'| ';                   ///--- linia dubla
            If Campuri.Checked[7] Then
              Begin
                For k:=1 To 4 Do
                  Begin
                    Temp:=0;
                    Case ComboBox3.ItemIndex Of
                      0:
                        If (Controv[i].Rata[k].Termen>=DataMin.Text) And (Controv[i].Rata[k].Termen<=DataMax.Text) Then
                          Begin
                            Temp:=Controv[i].Rata[k].Poz+1;
                            Break;
                          End;
                      1:
                        If (EDE(Controv[i].Rata[k].Valabilitate)>=DataMin.Text) And (EDE(Controv[i].Rata[k].Valabilitate)<=DataMax.Text) Then
                          Begin
                            Temp:=Controv[i].Rata[k].Poz+1;
                            Break;
                          End;
                    End;
                  End;
                If Temp In [1..4] Then
                  s2:=s2+AddSpace(IntToStr(Controv[i].Rata[k].Poz+1),SetariExport[8].Caractere,True)+' '+Car+' '
                Else
                  s2:=s2+AddSpace('contr.nou!',SetariExport[8].Caractere,True)+' '+Car+' ';
              End;
            //If Campuri.Checked[8] Then
              Begin
                For k:=1 To 4 Do
                  Begin
                    Temp:=0;
                    Case ComboBox3.ItemIndex Of
                      0:
                        If (Controv[i].Rata[k].Termen>=DataMin.Text) And (Controv[i].Rata[k].Termen<=DataMax.Text) Then
                          Begin
                            Temp:=Controv[i].Rata[k].Poz+1;
                            Break;
                          End;
                      1:
                        If (EDE(Controv[i].Rata[k].Valabilitate)>=DataMin.Text) And (EDE(Controv[i].Rata[k].Valabilitate)<=DataMax.Text) Then
                          Begin
                            Temp:=Controv[i].Rata[k].Poz+1;
                            Break;
                          End;
                    End;
                  End;
                If Temp In [1..4] Then
                  Begin
                    TotalRateNoi:=TotalRateNoi+Controv[i].Rata[k+1].Taxa;
                    If Campuri.Checked[8] Then
                      s2:=s2+AddSpace(FloatToStrF(Controv[i].Rata[k+1].Taxa,ffFixed,16,2),SetariExport[9].Caractere,True)+' '+Car+' '
                  End
                Else
                  Begin
                    c:=(Controv[i].Rata[1].Taxa+
                        Controv[i].Rata[2].Taxa+
                        Controv[i].Rata[3].Taxa+
                        Controv[i].Rata[4].Taxa)/4;
                    TotalRateNoi:=TotalRateNoi+c;
                    Aproximare:='cca. ';
                    If Campuri.Checked[8] Then
                      s2:=s2+AddSpace('cca. '+FloatToStrF(c,ffFixed,16,2),SetariExport[9].Caractere,True)+' '+Car+' ';
                  End;
              End;
            If Campuri.Checked[9] Then
              Begin
                For k:=1 To 4 Do
                  Begin
                    Temp:=0;
                    Case ComboBox3.ItemIndex Of
                      0:
                        If (Controv[i].Rata[k].Termen>=DataMin.Text) And (Controv[i].Rata[k].Termen<=DataMax.Text) Then
                          Begin
                            Temp:=Controv[i].Rata[k].Poz+1;
                            Break;
                          End;
                      1:
                        If (EDE(Controv[i].Rata[k].Valabilitate)>=DataMin.Text) And (EDE(Controv[i].Rata[k].Valabilitate)<=DataMax.Text) Then
                          Begin
                            Temp:=Controv[i].Rata[k].Poz+1;
                            Break;
                          End;
                    End;
                  End;
                If Temp In [1..4] Then
                  s2:=s2+AddSpace(ScriereData(Extragere(Controv[i].Rata[k+1].Valabilitate,Length(Controv[i].Rata[k+1].Valabilitate)-8,True),FormatData)+' - '+
                                  ScriereData(Extragere(Controv[i].Rata[k+1].Valabilitate,8,False),FormatData),SetariExport[10].Caractere,True)+' '+Car+' '
                Else
                  s2:=s2+AddSpace(AutoIntroducereData(Controv[i].Rata[k].Termen,3),SetariExport[10].Caractere,True)+' '+Car+' ';
              End;
            ///---6..9
            For k:=1 To 4 Do
              Begin
                If Campuri.Checked[10] Then
                  Case ComboBox3.ItemIndex Of
                    0:
                      If (Controv[i].Rata[k].Termen>=DataMin.Text) And (Controv[i].Rata[k].Termen<=DataMax.Text) Then
                        s2:=s2+AddSpace(Controv[i].Rata[k].Plata,SetariExport[11].Caractere,False)+' '+Car+' ';
                    1:
                      If (EDE(Controv[i].Rata[k].Valabilitate)>=DataMin.Text) And (EDE(Controv[i].Rata[k].Valabilitate)<=DataMax.Text) Then
                        s2:=s2+AddSpace(Controv[i].Rata[k].Plata,SetariExport[11].Caractere,False)+' '+Car+' ';
                  End;
              End;
            For k:=1 To 4 Do
              Begin
                If Campuri.Checked[11] Then
                  Case ComboBox3.ItemIndex Of
                    0:
                      If (Controv[i].Rata[k].Termen>=DataMin.Text) And (Controv[i].Rata[k].Termen<=DataMax.Text) Then
                        s2:=s2+AddSpace(Controv[i].Rata[k].nrFactura,SetariExport[12].Caractere,False)+' '+Car+' ';
                    1:
                      If (EDE(Controv[i].Rata[k].Valabilitate)>=DataMin.Text) And (EDE(Controv[i].Rata[k].Valabilitate)<=DataMax.Text) Then
                        s2:=s2+AddSpace(Controv[i].Rata[k].nrFactura,SetariExport[12].Caractere,False)+' '+Car+' ';
                  End;
              End;
            r:=0;
            s:=0;
            TempS:=Car+' ';
            For k:=1 To 12 Do
              If Campuri.Checked[k-1] Then
                Begin
                  s:=s+SetariExport[k].Caractere+2;
                  TempS:=TempS+AddSpace('',SetariExport[k].Caractere,False)+' '+Car+' ';
                  If (k>6) And (r=0) Then
                    Begin
                      Inc(r);
                      Delete(TempS,Length(TempS),1);       ///--- personalizare
                      TempS:=TempS+'| ';                   ///--- linia dubla
                    End;
                End;
            r:=0;
            s3:=s2;
            For k:=1 To 50 Do //fiecare eventuala masina figurata in contract
              If (Controv[i].Auto[k].nrInmatriculare<>'') And
                 (Campuri.Checked[12] Or Campuri.Checked[13] Or Campuri.Checked[14] Or
                  Campuri.Checked[15] Or Campuri.Checked[16] Or Campuri.Checked[17] Or
                  Campuri.Checked[18] Or Campuri.Checked[19]) Then
                Begin
                  Inc(r);
                  s2:='';
                  If r>1 Then
                    //s3:=AddSpace(' ',s,True);
                    s3:=TempS;
                  If Campuri.Checked[12] Then
                    Begin
                      s2:=s2+AddSpace(IntToStr(Controv[i].Auto[k].Poz),SetariExport[13].Caractere,True)+' '+Car+' ';
                    End;
                  If Campuri.Checked[13] Then
                    Begin
                      s2:=s2+AddSpace(Controv[i].Auto[k].Tip,SetariExport[14].Caractere,False)+' '+Car+' ';
                    End;
                  If Campuri.Checked[14] Then
                    Begin
                      s2:=s2+AddSpace(Controv[i].Auto[k].nrInmatriculare,SetariExport[15].Caractere,False)+' '+Car+' ';
                    End;
                  If Campuri.Checked[15] Then
                    Begin
                      s2:=s2+AddSpace(Controv[i].Auto[k].nrIdentificare,SetariExport[16].Caractere,False)+' '+Car+' ';
                    End;
                  If Campuri.Checked[16] Then
                    Begin
                      s2:=s2+AddSpace(Virgularizare(Controv[i].Auto[k].MasaMaxima,Controv_.Utilizareseparatormii1.Checked),SetariExport[17].Caractere,True)+' '+Car+' ';
                    End;
                  If Campuri.Checked[17] Then
                    Begin
                      s2:=s2+AddSpace(Virgularizare(Controv[i].Auto[k].Axe,Controv_.Utilizareseparatormii1.Checked),SetariExport[18].Caractere,True)+' '+Car+' ';
                    End;
                  If Campuri.Checked[18] Then
                    Begin
                      s2:=s2+AddSpace(Controv[i].Auto[k].ClasaPoluare,SetariExport[19].Caractere,True)+' '+Car+' ';
                    End;
                  If Campuri.Checked[19] Then
                    Begin
                      s2:=s2+AddSpace(Virgularizare3(Controv[i].Auto[k].Tarif,Controv_.Utilizareseparatormii1.Checked),SetariExport[20].Caractere,True)+' '+Car+' ';
                    End;
                  ListBox1.Items.Add (s3+s2);
                  RichEdit1.Lines.Add (s3+s2);
                End
              Else
                If k=1 Then
                  Begin
                    ListBox1.Items.Add (s3);
                    RichEdit1.Lines.Add (s3);
                  End;
          End;
      End;
    If Liniere.Checked Then
      Begin
        ListBox1.Items.Add (Car+Linie(Length(s1)-3)+Car);
        RichEdit1.Lines.Add (Car+Linie(Length(s1)-3)+Car);
      End;
    ListBox1.Items.Add('');
    RichEdit1.Lines.Add('');
    ListBox1.Items.Add('          TOTAL RATE          GENERARE RAPORT            INTOCMIT');
    If IngrosareAntet.Checked Then
      RichEdit1.SelAttributes.Style:=[fsBold];
    RichEdit1.Lines.Add('          TOTAL RATE          GENERARE RAPORT            INTOCMIT');
    If IngrosareAntet.Checked Then
      RichEdit1.SelAttributes.Style:=[];
    ListBox1.Items.Add(AddSpace(Aproximare+Virgularizare3(TotalRateNoi,Controv_.Utilizareseparatormii1.Checked),20,True)+
                       AddSpace(ScriereData(FormatDateTime('yyyymmdd',Now),FormatData)+' '+
                                            FormatDateTime('hh:nn:ss',Now),25,True));
    RichEdit1.Lines.Add(AddSpace(Aproximare+Virgularizare3(TotalRateNoi,Controv_.Utilizareseparatormii1.Checked),20,True)+
                        AddSpace(ScriereData(FormatDateTime('yyyymmdd',Now),FormatData)+' '+
                                            FormatDateTime('hh:nn:ss',Now),25,True));
    ListBox1.Items.Add (AddSpace('_______________',72,True));
    RichEdit1.Lines.Add (AddSpace('_______________',72,True));
    ListBox1.Items.Insert(0,'');
    RichEdit1.Lines.Insert(0,'');
    ListBox1.Items.Insert(0,'SC TRACON SRL '+
                            AddSpace('Scadente rate roviniete '+
                            ScriereData(DataMin.Text,FormatData)+' - '+
                            ScriereData(DataMax.Text,FormatData),Length(s1)-15,True));
    If IngrosareAntet.Checked Then
      RichEdit1.SelAttributes.Style:=[fsBold];
    RichEdit1.Lines.Insert(0,'SC TRACON SRL'+
                             AddSpace('Scadente rate roviniete '+
                             ScriereData(DataMin.Text,FormatData)+' - '+
                             ScriereData(DataMax.Text,FormatData),Length(s2+s3)-15,True));
    If IngrosareAntet.Checked Then
      RichEdit1.SelAttributes.Style:=[];
  End;
begin
  SaveDialog1.FileName:='Controv - ['+Extragere(ExtractFileName(AdresaFisier),4,True)+']';
  If SaveDialog1.DefaultExt='MNT' Then
    Begin
      GenerareRaport;
      Monitor_.RichEdit1.Clear;
      Monitor_.RichEdit1.Lines:=Export_.ListBox1.Items;
      Monitor_.RichEdit1.Lines.Insert(0,'');
      Monitor_.RichEdit1.Lines.Delete(0);
      Monitor_.ShowModal;
    End
  Else
    Begin
      If SaveDialog1.Execute Then
        Begin
          If SaveDialog1.DefaultExt='XLS' Then
            Begin
              Loading.Visible:=True;
              ProgressBar1.Position:=0;
              With Monitor_ Do
                Begin
                  Loading.Left:=(Width-Loading.Width) Div 2;
                  Loading.Top:=(Height-Loading.Height) Div 2;
                  Loading.Visible:=True;
                  Loading.Repaint;
                  ProgressBar1.Position:=0;
                End;
              Export_.Repaint;
//deschidere EXCEL
              Try
                Fisier:=CreateOleObject('Excel.Application');
                If VarType(Fisier)<>VarDispatch Then
                  Begin
                    ShowMessage('MS Excel nu este instalat');
                    Exit;
                  End;
                Fisier.Visible:=False;
              Except
                Fisier.Quit;
                ShowMessage('Eroare la lansarea MS Excel');
              End;
//creare fisier XLS nou
              If Not VarIsEmpty(Fisier) Then
                Begin
                  Try
                    Book:=Fisier.WorkBooks.Add;
                    Sheet:=Fisier.WorkBooks[1].Sheets[1];
                    Fisier.DisplayAlerts:=False;
                    j:=3;
                    k:=0;
                    For i:=1 To 16 Do
                      If Campuri.Checked[i-1] Then
                        Begin
                          Inc(k);
                          Sheet.Cells[j,k]:=SetariExport[i].Eticheta1;
                        End;
                    maxk:=k;
                    TotalRatePerioada:=0;
                    For i:=1 To NrContract.Items.Capacity Do
                      If (NrContract.Checked[i-1]) And (RatePerioada(i,ExcludereNule.Checked)) Then
                        Begin
                          ProgressBar1.Position:=Round(100*i/NrContract.Items.Capacity);
                          Monitor_.ProgressBar1.Position:=ProgressBar1.Position;
                          Export_.Repaint;
                          If NrContract.Checked[i-1] Then
                            Begin
                              Inc(j);
                              k:=0;
                              If Campuri.Checked[0] Then
                                Begin
                                  Inc(k);
                                  Sheet.Cells[j,k]:=Controv[i].nrContract;
                                End;
                              If Campuri.Checked[1] Then
                                Begin
                                  Inc(k);
                                  Sheet.Cells[j,k]:=''''+ScriereData(Controv[i].dataContract,FormatData);
                                End;
                              For l:=1 To 4 Do
                                If (Controv[i].Rata[l].Termen>=DataMin.Text) And (Controv[i].Rata[l].Termen<=DataMax.Text) Then
                                  Begin
                                    If Campuri.Checked[2] Then
                                      Begin
                                        Inc(k);
                                        Sheet.Cells[j,k]:=Controv[i].Rata[l].Poz;
                                      End;
                                    If Campuri.Checked[3] Then
                                      Begin
                                        Inc(k);
                                        Sheet.Cells[j,k]:=Controv[i].Rata[l].Taxa;
                                        TotalRatePerioada:=TotalRatePerioada+Controv[i].Rata[l].Taxa;
                                      End;
                                    If Campuri.Checked[4] Then
                                      Begin
                                        Inc(k);
                                        Sheet.Cells[j,k]:=''''+ScriereData(Controv[i].Rata[l].Termen,FormatData);
                                      End;
                                    If Campuri.Checked[5] Then
                                      Begin
                                        Inc(k);
                                        Sheet.Cells[j,k]:=ScriereData(Extragere(Controv[i].Rata[l].Valabilitate,Length(Controv[i].Rata[l].Valabilitate)-8,True),FormatData)+' - '+
                                                          ScriereData(Extragere(Controv[i].Rata[l].Valabilitate,8,False),FormatData);
                                      End;
                                    If Campuri.Checked[6] Then
                                      Begin
                                        Inc(k);
                                        Sheet.Cells[j,k]:=Controv[i].Rata[l].Plata;
                                      End;
                                    If Campuri.Checked[7] Then
                                      Begin
                                        Inc(k);
                                        Sheet.Cells[j,k]:=''''+Controv[i].Rata[l].nrFactura;
                                      End;
                                End;
                              k:=0;
                              For n:=0 To 7 Do
                                If Campuri.Checked[n] Then
                                  Inc(k);
                              n:=0;    
                              For m:=1 To 50 Do
                                If (Controv[i].Auto[m].nrInmatriculare<>'') And (Campuri.Checked[10]) Then
                                  Begin
                                    n:=k;
                                    If Campuri.Checked[8] Then
                                      Begin
                                        Inc(n);
                                        Sheet.Cells[j,n]:=Controv[i].Auto[m].Poz;
                                      End;
                                    If Campuri.Checked[9] Then
                                      Begin
                                        Inc(n);
                                        Sheet.Cells[j,n]:=Controv[i].Auto[m].Tip;
                                      End;
                                    If Campuri.Checked[10] Then
                                      Begin
                                        Inc(n);
                                        Sheet.Cells[j,n]:=Controv[i].Auto[m].nrInmatriculare;
                                      End;
                                    If Campuri.Checked[11] Then
                                      Begin
                                        Inc(n);
                                        Sheet.Cells[j,n]:=''''+Controv[i].Auto[m].nrIdentificare;
                                      End;
                                    If Campuri.Checked[12] Then
                                      Begin
                                        Inc(n);
                                        Sheet.Cells[j,n]:=Controv[i].Auto[m].MasaMaxima;
                                      End;
                                    If Campuri.Checked[13] Then
                                      Begin
                                        Inc(n);
                                        Sheet.Cells[j,n]:=Controv[i].Auto[m].Axe;
                                      End;
                                    If Campuri.Checked[14] Then
                                      Begin
                                        Inc(n);
                                        Sheet.Cells[j,n]:=Controv[i].Auto[m].ClasaPoluare;
                                      End;
                                    If Campuri.Checked[15] Then
                                      Begin
                                        Inc(n);
                                        Sheet.Cells[j,n]:=Controv[i].Auto[m].Tarif;
                                      End;
                                    Inc(j);
                                  End;
                              If n<>0 Then
                                Dec(j);
                            End;
                        End;
                    If IngrosareAntet.Checked Then
                      Begin
                        Range:=Sheet.Range['A1:AW3']; //selectare 49 coloane - maximul de campuri ce pot fi exportate
                        Range.Font.Bold:=True;
                      End;
                    If Liniere.Checked Then
                      Begin
                        If maxk<=26 Then
                          t:=Chr(maxk+64)
                        Else
                          t:='A'+Chr(maxk+64-26);
                        Range:=Sheet.Range['A3:'+t+IntToStr(j)];
                        Range.Borders.LineStyle:=$00000001;//linie continua
                      End;
                    If AutoRaport.Checked Then
                      Sheet.Columns.AutoFit;
                    Sheet.Cells[1,1]:='SC TRACON SRL       '+
                                      'Scadente rate roviniete '+
                                      ScriereData(DataMin.Text,FormatData)+' - '+
                                      ScriereData(DataMax.Text,FormatData);
                    Sheet.Cells[j+2,1]:='Total rate';
                    Sheet.Cells[j+2,3]:='Generare raport';
                    Sheet.Cells[j+2,5]:='Intocmit';
                    Sheet.Cells[j+3,1]:=TotalRatePerioada;
                    Sheet.Cells[j+3,3]:=''''+ScriereData(FormatDateTime('yyyymmdd',Now),FormatData);
                    Sheet.Cells[j+4,5]:='_______________';
//salvare fisier XLS
                    Try
                      If FileExists(SaveDialog1.FileName) Then
                        DeleteFile (SaveDialog1.FileName);
                      Fisier.ActiveWorkBook.SaveAs(SaveDialog1.FileName);
                      If MessageDlg('Se deschide fisierul exportat?'#13+
                          '("'+SaveDialog1.FileName+'")',mtConfirmation,[mbYes,mbNo],0)=mrYes Then
                        Fisier.Visible:=True
                      Else
                        Begin
//inchidere EXCEL
                          Loading.Visible:=False;
                          Monitor_.Loading.Visible:=Loading.Visible;
                          Fisier.Quit;
                          Fisier:=Temp;
                          Book:=Temp;
                        End;
                    Except
                      Loading.Visible:=False;
                      Monitor_.Loading.Visible:=Loading.Visible;
                      Fisier.Quit;
                      Fisier:=Temp;
                      Book:=Temp;
                      ShowMessage('Fisierul "'+SaveDialog1.FileName+'" este deschis!'+#13+'Inchideti Excel apoi incercati din nou exportul');
                    End;
                  Except
                    Loading.Visible:=False;
                    Monitor_.Loading.Visible:=Loading.Visible;
                    Fisier.Quit;
                    ShowMessage ('Se recomanda repornirea calculatorului!');
                  End;
                End;
              Loading.Visible:=False;
              Monitor_.Loading.Visible:=Loading.Visible;
            End
          Else
            Begin
              GenerareRaport;
              If SaveDialog1.DefaultExt='TXT' Then
                ListBox1.Items.SaveToFile(SaveDialog1.FileName);
              If SaveDialog1.DefaultExt='RTF' Then
                Begin
                  RichEdit1.Lines.SaveToFile(SaveDialog1.FileName);
                  ListBox1.Items.LoadFromFile(SaveDialog1.FileName);
                  ListBox1.Items.Delete(0); ///Seteaza fontul Courier New
                  ListBox1.Items.Insert(0,'{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil Courier New;}}');
                  ListBox1.Items.SaveToFile(SaveDialog1.FileName);
                End;
            End;
          If (Deschidere.Checked) And (SaveDialog1.DefaultExt<>'XLS') Then
            If MessageDlg('Se deschide fisierul exportat?'#13+
                          '("'+SaveDialog1.FileName+'")',mtCOnfirmation,[mbYes,mbNo],0)=mrYes Then
              Executie(SaveDialog1.FileName);
        End;
    End;
end;

procedure TExport_.CampuriClickCheck(Sender: TObject);
begin
  RadioButton2.Checked:=True;
end;

procedure TExport_.SaveDialog1TypeChange(Sender: TObject);
begin
  Case SaveDialog1.FilterIndex Of
    1:SaveDialog1.DefaultExt:='TXT';
    2:SaveDialog1.DefaultExt:='RTF';
    3:SaveDialog1.DefaultExt:='XLS';
  End;
end;

procedure TExport_.NrContractClickCheck(Sender: TObject);
begin
  RadioButton1.Checked:=True;
end;

procedure TExport_.FormActivate(Sender: TObject);
Var i:Integer;
begin
  Height:=376;
  NrContract.Items:=Controv_.ComboBox1.Items;
  NrContract.ItemIndex:=0;
  SelecteazaContracteleClick(Sender);
  If Run4FirstTime Then
    Begin
      Run4FirstTime:=False;
      RadioButton2.Checked:=True;
      For i:=1 To Campuri.Items.Capacity Do
        Campuri.Checked[i-1]:=False;
      Campuri.Checked[0]:=True;
      Campuri.Checked[1]:=True;
      Campuri.Checked[6]:=True;
      Campuri.Checked[7]:=True;
      Campuri.Checked[8]:=True;
      Campuri.Checked[14]:=True;
      Campuri.ItemIndex:=0;
      DataMin.Text:=FormatDateTime('yyyymmdd',Now);
      ComboBox1.ItemIndex:=0;
      ComboBox2.ItemIndex:=0;
      ComboBox3.ItemIndex:=1;
    End;
  DataMinChange(Sender);
  ComboBox1Change(Sender);
end;

procedure TExport_.RadioButton4Click(Sender: TObject);
begin
  (*RadioButton5.Enabled:=RadioButton4.Checked;
  RadioButton6.Enabled:=RadioButton4.Checked;
  RadioButton7.Enabled:=RadioButton4.Checked;*)
  ComboBox2.Enabled:=RadioButton4.Checked;//////////
  If RadioButton3.Checked Then
    Begin
      SaveDialog1.DefaultExt:='MNT';
      //SaveDialog1.FilterIndex:=0;
    End
  Else
    Begin
      (*If RadioButton5.Checked Then
        Begin
          SaveDialog1.DefaultExt:='TXT';
          SaveDialog1.FilterIndex:=1;
        End;
      If RadioButton6.Checked Then
        Begin
          SaveDialog1.DefaultExt:='RTF';
          SaveDialog1.FilterIndex:=2;
        End;
      If RadioButton7.Checked Then
        Begin
          SaveDialog1.DefaultExt:='XLS';
          SaveDialog1.FilterIndex:=3;
        End;*)
      Case ComboBox2.ItemIndex Of
        0:
          Begin
            SaveDialog1.DefaultExt:='TXT';
            SaveDialog1.FilterIndex:=1;
          End;
        1:
          Begin
            SaveDialog1.DefaultExt:='RTF';
            SaveDialog1.FilterIndex:=2;
          End;
        2:
          Begin
            SaveDialog1.DefaultExt:='XLS';
            SaveDialog1.FilterIndex:=3;
          End;
      End;
    End;
end;      

procedure TExport_.DataMinChange(Sender: TObject);
Var s,s1,s2,s3:String;
    t1,t2:String;
    r1,r2,r3:Integer;
    w1,w2,w3:Integer;
begin
  If IsDataCorecta(DataMin.Text) Then
    Begin
      s:=DataMin.Text;
      s1:=Extragere(s,4,True);
      s2:=Extragere(Extragere(s,4,False),2,True);
      s3:=Extragere(s,2,False);
      r1:=StrToInt(s1);
      r2:=StrToInt(s2);
      r3:=StrToInt(s3);
      t1:=s;
      w3:=r3-1;         //ziua
      w2:=r2+NumarLuni; //luna
      w1:=r1;
      If w3=0 Then            (*daca ziua este mai mica de 1*)
        Begin
          w2:=w2-1;
          If w2>12 Then       (*daca luna este mai mare de 12*)
            Begin
              w1:=r1+1; //anul
              w2:=(w2-1) Mod 12+1;
            End
          Else
            w1:=r1;     //anul
          Case w2 Of
            1,3,5,7,8,10,12:
              w3:=31;
            2:
              If (w1 Div 4)=0 Then w3:=29
              Else w3:=28;
            4,6,9,11:
              w3:=30;
          End;
          w3:=31;
        End
      Else
        If w2>12 Then       (*daca luna este mai mare de 12*)
          Begin
            w1:=r1+1; //anul
            w2:=(w2-1) Mod 12+1;
          End
        Else
          w1:=r1;     //anul
      If w2=2 Then
        If w1 Mod 4=0 Then
          If w3>29 Then
            w3:=29
          Else
        Else
          If w3>28 Then
            w3:=28;
      If (w2 In [1,3,5,7,8,10,12]) Then
        If w3>31 Then
          w3:=31;
      If (w2 In [4,6,9,11]) Then
        If w3>30 Then
          w3:=30;
      s1:=AddChar(IntToStr(w1),'0',4);
      s2:=AddChar(IntToStr(w2),'0',2);
      s3:=AddChar(IntToStr(w3),'0',2);
      t2:=s1+s2+s3;
      DataMax.Text:=t2;
      BitBtn1.Enabled:=True;
    End
  Else
    Begin
      DataMax.Text:='Incorect...';
      BitBtn1.Enabled:=False;
    End;
end;




procedure TExport_.ComboBox1Change(Sender: TObject);
begin
  NumarLuni:=ComboBox1.ItemIndex+1;
  DataMinChange(Sender);
end;

procedure TExport_.LiniereClick(Sender: TObject);
begin
  Case Liniere.Checked Of
    True:
      Car:='|';
    False:
      Car:=' ';
  End;
end;


procedure TExport_.Iesire1Click(Sender: TObject);
begin
  If PermiteIesirea Then
    Export_.Close;
end;

procedure TExport_.Setariimplicite1Click(Sender: TObject);
begin
  If MessageDlg('Se incarca setarile implicite?',mtConfirmation,[mbYes,mbNo],0)=mrYes Then
    Begin
      Run4FirstTime:=True;
      Export_.Activate;
    End;
end;

end.
