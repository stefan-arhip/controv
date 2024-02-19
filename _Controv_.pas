unit _Controv_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, ToolWin, ComCtrls, Menus, Tabnotbk, ShellApi;

Const FormatData:Integer=1;
      AdresaFisier:String='';
      Run41Time:Boolean=True;
      PermiteIesirea:Boolean=True;

Type TAuto=Record
             Poz:Integer;
             Tip,nrInmatriculare,nrIdentificare:String[30];
             MasaMaxima,Axe:Integer;
             ClasaPoluare:String[8];
             Tarif:Currency;
           End;
     TRata=Record
             Poz:Integer;
             Taxa:Currency;
             Termen:String[8];
             Plata,nrFactura,Valabilitate:String[30];
           End;
     TControv=Record
                nrContract:String[30];
                dataContract:String[8];
                Auto:Array[1..50] Of TAuto;
                Rata:Array[1..4] Of TRata;
              End;
  TArrayControv=Array [1..100] Of TControv;
  TControv_ = class(TForm)
    ToolBar1: TToolBar;
    SpeedButton4: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Edit3: TEdit;
    Panel3: TPanel;
    ListBox1: TListBox;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Panel4: TPanel;
    Edit12: TEdit;
    Label4: TLabel;
    ListBox2: TListBox;
    Edit14: TEdit;
    Edit15: TEdit;
    ComboBox2: TComboBox;
    Edit13: TEdit;
    Edit17: TEdit;
    Label5: TLabel;
    Edit18: TEdit;
    Edit16: TEdit;
    ComboBox1: TComboBox;
    Label50: TLabel;
    Edit1: TEdit;
    Panel1: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    Panel5: TPanel;
    RadioButton9: TRadioButton;
    RadioButton10: TRadioButton;
    RadioButton11: TRadioButton;
    RadioButton13: TRadioButton;
    RadioButton14: TRadioButton;
    RadioButton12: TRadioButton;
    Label1: TLabel;
    DataSalvare: TEdit;
    MainMenu1: TMainMenu;
    Fisier1: TMenuItem;
    Nou1: TMenuItem;
    Deschidere1: TMenuItem;
    Salvare1: TMenuItem;
    Salvareca1: TMenuItem;
    N5: TMenuItem;
    Export1: TMenuItem;
    N1: TMenuItem;
    Iesire1: TMenuItem;
    Editare1: TMenuItem;
    AdaugareCR1: TMenuItem;
    StergereCR1: TMenuItem;
    N3: TMenuItem;
    Cautare1: TMenuItem;
    N4: TMenuItem;
    Contractprecedent1: TMenuItem;
    Contracturmator1: TMenuItem;
    N6: TMenuItem;
    Autoprecedent1: TMenuItem;
    Autourmator1: TMenuItem;
    N7: TMenuItem;
    Rataprecedenta1: TMenuItem;
    Rataurmatoare1: TMenuItem;
    Optiuni1: TMenuItem;
    Setari1: TMenuItem;
    Informatii1: TMenuItem;
    Ajutor1: TMenuItem;
    Versiune1: TMenuItem;
    Contract1: TMenuItem;
    N2: TMenuItem;
    Dreptdeautor1: TMenuItem;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    PopupMenu1: TPopupMenu;
    Formatdata2: TMenuItem;
    aaaallzz1: TMenuItem;
    zzlllaaaa1: TMenuItem;
    zzllaaaa1: TMenuItem;
    zzllaaaa2: TMenuItem;
    zzllaaaa3: TMenuItem;
    Utilizareseparatormii1: TMenuItem;
    N9: TMenuItem;
    Autointroducerevalabilitate1: TMenuItem;
    FindDialog1: TFindDialog;
    procedure Ajutor1Click(Sender: TObject);
    procedure Versiune1Click(Sender: TObject);
    procedure Dreptdeautor1Click(Sender: TObject);
    procedure Iesire1Click(Sender: TObject);
    procedure Salvare1Click(Sender: TObject);
    procedure Salvareca1Click(Sender: TObject);
    procedure Deschidere1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure AdaugareCR1Click(Sender: TObject);
    procedure Nou1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure RadioButton5Click(Sender: TObject);
    procedure RadioButton6Click(Sender: TObject);
    procedure RadioButton7Click(Sender: TObject);
    procedure RadioButton8Click(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure Edit6Change(Sender: TObject);
    procedure Edit7Change(Sender: TObject);
    procedure Edit8Change(Sender: TObject);
    procedure Edit9Change(Sender: TObject);
    procedure Edit10Change(Sender: TObject);
    procedure Edit11Change(Sender: TObject);
    procedure Edit14Change(Sender: TObject);
    procedure Edit15Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure Edit16Change(Sender: TObject);
    procedure Edit17Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RadioButton9Click(Sender: TObject);
    procedure RadioButton10Click(Sender: TObject);
    procedure RadioButton11Click(Sender: TObject);
    procedure RadioButton12Click(Sender: TObject);
    procedure RadioButton13Click(Sender: TObject);
    procedure RadioButton14Click(Sender: TObject);
    procedure StergereCR1Click(Sender: TObject);
    procedure Export1Click(Sender: TObject);
    procedure Contractprecedent1Click(Sender: TObject);
    procedure Contracturmator1Click(Sender: TObject);
    procedure Autoprecedent1Click(Sender: TObject);
    procedure Autourmator1Click(Sender: TObject);
    procedure Rataprecedenta1Click(Sender: TObject);
    procedure Rataurmatoare1Click(Sender: TObject);
    procedure aaaallzz1Click(Sender: TObject);
    procedure zzlllaaaa1Click(Sender: TObject);
    procedure zzllaaaa1Click(Sender: TObject);
    procedure zzllaaaa2Click(Sender: TObject);
    procedure zzllaaaa3Click(Sender: TObject);
    procedure Contract1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure Setari1Click(Sender: TObject);
    procedure Autointroducerevalabilitate1Click(Sender: TObject);
    procedure Utilizareseparatormii1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Cautare1Click(Sender: TObject);
    procedure FindDialog1Find(Sender: TObject);
  private
    { Private declarations }
    Procedure RefreshControv;
    Procedure Sortare;
    Procedure Ordonare1(Var Controv:TArrayControv;Criteriu:Integer);
    Procedure Ordonare2(Var Controv:TArrayControv;Criteriu:Integer);
  public
    { Public declarations }
    Procedure IncarcareBazaDate; //este folosita in "Setari_" si nu poate fi "private"
    Procedure AutoIntroducere(b:Boolean);
  end;

var
  Controv_: TControv_;
  Controv:TArrayControv;

Function IsDataCorecta(s:String):Boolean;
Function ScriereData(s:String;i:Integer):String;
Function AddChar(s:String;c:Char;i:Integer):String;
Function AddSpace(t:String;i:Integer;a:Boolean):String;
Function Virgularizare(n:Currency;s:Boolean):String;
Function Virgularizare3(n:Currency;s:Boolean):String;
Function Extragere(t:String;i:Integer;b:Boolean):String;
Procedure Executie (s:String);
Function AutoIntroducereData(Data:String;i:Integer):String;

implementation

uses _Istoric_, _About_, _Export_;

{$R *.DFM}

Const Index:Integer=1;
      Criteriu1:Integer=2;
      Criteriu2:Integer=2;
      Blocare:Boolean=False;

Procedure Executie (s:String);
  Var t:Array[0..79]Of Char;
  Begin
    StrPCopy(t,s);
    ShellExecute(0, Nil, t, Nil, Nil, SW_MAXIMIZE);//SW_NORMAL
  End;

Function AddZero(t:String;i:Integer):String;
Begin
  While Length(t)<i Do
    t:='0'+t;
  AddZero:=t;
End;

Function MaxChar(t:String;i:Integer;a:Boolean):String;
Begin
  If Length(t)>i Then
    Begin
      Repeat
        If a Then
          Delete(t,1,1)
        Else
          Delete(t,Length(t),1);
      Until Length(t)<i;
    End;
  MaxChar:=t;
End;

Function AddSpace(t:String;i:Integer;a:Boolean):String;
Begin
  If Length(t)<i Then
    Repeat
      If a Then
        t:=' '+t
      Else
        t:=t+' ';
    Until Length (t)>=i;
  AddSpace:=t;
End;

Function AddChar(s:String;c:Char;i:Integer):String;
Begin
  While Length(s)<i Do
    s:=c+s;
  AddChar:=s;
End;

Function Extragere(t:String;i:Integer;b:Boolean):String;
Var s:string;
Begin
  s:=t;
  If b Then
    Delete(s,Length(s)-i+1,length(s))
  Else
    Delete(s,1,Length(s)-i);
  Extragere:=s;
End;

Function LastIsPoint(s:String):Boolean;
Begin
  If Length(s)>0 Then
    LastIsPoint:=s[Length(s)]='.'
  Else
    LastIsPoint:=False;
End;

Function IsNumber(s:String):Boolean;
Var i:Integer;
    n:Boolean;
Begin
  n:=True;
  For i:=1 To Length (s) Do
    If (s[i]<'0') Or (s[i]>'9') Then
      n:=False;
  IsNumber:=n;
End;

Function IsDataCorecta(s:String):Boolean;
Var s1,s2,s3:String;
    DataCorecta:Boolean;
Begin
  DataCorecta:=True;
  If IsNumber(s) Then
    Begin
      If Length(s)<>0 Then
        Begin
          If Length(s)=8 Then
            Begin
              s1:=Extragere(s,4,True);
              s2:=Extragere(Extragere(s,4,False),2,True);
              s3:=Extragere(s,2,False);
              If (StrToInt(s1)>1900) And (StrToInt(s1)<2100) And
                 (StrToInt(s2)>0) And (StrToInt(s2)<13) And
                 (StrToInt(s3)>0) And (StrToInt(s3)<32) Then
                DataCorecta:=True
              Else
                DataCorecta:=False;
            End
          Else
            DataCorecta:=False;
        End
      Else
        DataCorecta:=False;
    End
  Else
    DataCorecta:=False;
  IsDataCorecta:=DataCorecta;
End;

Function ScriereData(s:String;i:Integer):String;
Const Luna:Array[1..12]Of String[3]=('ian','feb','mar',
                                     'apr','mai','iun',
                                     'iul','aug','sep',
                                     'oct','nov','dec');
Var s1,s2,s3:String;
Begin
  If IsNumber(s) Then
    Begin
      If Length(s)<>0 Then
        Begin
          If Length(s)=8 Then
            Begin
              s1:=Extragere(s,4,True);
              s2:=Extragere(Extragere(s,4,False),2,True);
              s3:=Extragere(s,2,False);
              If (StrToInt(s1)>1900) And (StrToInt(s1)<2100) And
                 (StrToInt(s2)>0) And (StrToInt(s2)<13) And
                 (StrToInt(s3)>0) And (StrToInt(s3)<32) Then
                Begin
                  If i=0 Then
                    s:=s;
                  If i=1 Then
                    s:=s3+' '+Luna[StrToInt(s2)]+' '+s1;
                  //If i=1 Then
                  //  s:=s3+' '+Luna[StrToInt(s2)]+''''+Extragere(s1,2,False);
                  If i=2 Then
                    s:=s3+'.'+s2+'.'+s1;
                  If i=3 Then
                    s:=s3+'/'+s2+'/'+s1;
                  If i=4 Then
                    s:=s3+'-'+s2+'-'+s1;
                End
              Else
                s:='incorect..';
            End
          Else
            s:='scriere...';
        End
      Else
        s:='';
      ScriereData:=s;
    End
  Else
    ScriereData:='incorect..';
End;

Function Virgularizare3(n:Currency;s:Boolean):String;
Var t:String;
Begin
  If s Then
    t:=FloatToStrF(n,ffNumber,15,2)
  Else
    t:=FloatToStrF(n,ffFixed,15,2);
  Virgularizare3:=t;
End;

Function Virgularizare2(n:Currency):String;
Var f:TextFile;
    s1,s2:String;
    i:Integer;
Begin
  AssignFile(f,'Temp.txt');
  Rewrite(f);
  Write(f,n:0);
  CloseFile(f);
  AssignFile(f,'Temp.txt');
  Reset(f);
  Read(f,s1);
  CloseFile(f);
  s2:='';
  For i:=1 To Length(s1) Do
    Begin
      s2:=s1[Length(s1)-i+1]+s2;
      If (i Mod 3=0) And (i<>Length(s1)) Then
        s2:='.'+s2;
    End;
  Virgularizare2:=s2;
  DeleteFile('Temp.txt');
End;

Function Virgularizare(n:Currency;s:Boolean):String;
Var s1,s2:String;
    i:Longint;
Begin
  If s Then
    If n<1E+9 Then
      Begin
        Str(Round(n),s1);
        s2:='';
        For i:=1 To Length(s1) Do
          Begin
            s2:=s1[Length(s1)-i+1]+s2;
            If (i Mod 3=0) And (i<>Length(s1)) And (s1[Length(s1)-i]<>'-')Then
              s2:='.'+s2;
          End;
      End
    Else
      s2:=Virgularizare2(n)
  Else
    s2:=FloatToStr(n);
  Virgularizare:=s2;
End;

Procedure VidareKontrov(i:Integer);
Var j:Integer;
Begin
  With Controv[i] Do
    Begin
      nrContract:='';
      dataContract:='';
      For j:=1 To 10 Do
        With Auto[j] Do
          Begin
            Poz:=0;
            Tip:='';
            nrInmatriculare:='';
            nrIdentificare:='';
            MasaMaxima:=0;
            Axe:=0;
            ClasaPoluare:='';
            Tarif:=0;
          End;
      For j:=1 To 4 Do
        With Rata[j] Do
          Begin
            Poz:=j;
            Taxa:=0;
            Termen:='';
            Plata:='Neplatita';
            Valabilitate:='';
            nrFactura:='';
          End;
    End;
End;

Procedure VidareControv;
Var i:Integer;
Begin
  For i:=1 To 100 Do
    VidareKontrov(i);
End;

Procedure TControv_.Ordonare1;
Var i:Integer;
  Procedure MinimControv(Var Controv:TControv;Min,Max:Integer);
    Procedure SchimbaControvAuto(Var Controv:TControv;i,j:Integer);
      Var Temp:TControv;
      Begin
        Temp.Auto[1]:=Controv.Auto[j];
        Controv.Auto[j]:=Controv.Auto[i];
        Controv.Auto[i]:=Temp.Auto[1];
      End;
    Var i,j:Integer;
        MinimStr:String;
        MinimInt:Integer;
        MinimFlt:Currency;
    Begin
      Case Criteriu Of
        0: //pozitie
          Begin
            j:=0;
            MinimInt:=0;
            For i:=Min To Max Do
              If Controv.Auto[i].Poz<>0 Then
                Begin
                  MinimInt:=Controv.Auto[i].Poz;
                  j:=i;
                End;
            For i:=Min To Max Do
              If (Controv.Auto[i].Poz<MinimInt) And (Controv.Auto[i].Poz<>0) Then
                Begin
                  MinimInt:=Controv.Auto[i].Poz;
                  j:=i;
                End;
            If j<>0 Then
              SchimbaControvAuto(Controv,Min,j);
          End;
        1: //tip auto
          Begin
            j:=0;
            MinimStr:='';
            For i:=Min To Max Do
              If Controv.Auto[i].Tip<>'' Then
                Begin
                  MinimStr:=Controv.Auto[i].Tip;
                  j:=i;
                End;
            For i:=Min To Max Do
              If (Controv.Auto[i].Tip<MinimStr) And (Controv.Auto[i].Tip<>'') Then
                Begin
                  MinimStr:=Controv.Auto[i].Tip;
                  j:=i;
                End;
            If j<>0 Then
              SchimbaControvAuto(Controv,Min,j);
          End;
        2: //nr. inmatriculare
          Begin
            j:=0;
            MinimStr:='';
            For i:=Min To Max Do
              If Controv.Auto[i].nrInmatriculare<>'' Then
                Begin
                  MinimStr:=Controv.Auto[i].nrInmatriculare;
                  j:=i;
                End;
            For i:=Min To Max Do
              If (Controv.Auto[i].nrInmatriculare<MinimStr) And (Controv.Auto[i].nrInmatriculare<>'') Then
                Begin
                  MinimStr:=Controv.Auto[i].nrInmatriculare;
                  j:=i;
                End;
            If j<>0 Then
              SchimbaControvAuto(Controv,Min,j);
          End;
        3: //nr. identificare
          Begin
            j:=0;
            MinimStr:='';
            For i:=Min To Max Do
              If Controv.Auto[i].nrInmatriculare<>'' Then
                Begin
                  MinimStr:=Controv.Auto[i].nrInmatriculare;
                  j:=i;
                End;
            For i:=Min To Max Do
              If (Controv.Auto[i].nrInmatriculare<MinimStr) And (Controv.Auto[i].nrInmatriculare<>'') Then
                Begin
                  MinimStr:=Controv.Auto[i].nrInmatriculare;
                  j:=i;
                End;
            If j<>0 Then
              SchimbaControvAuto(Controv,Min,j);
          End;
        4: //masa maxima
          Begin
            j:=0;
            MinimInt:=0;
            For i:=Min To Max Do
              If Controv.Auto[i].MasaMaxima<>0 Then
                Begin
                  MinimInt:=Controv.Auto[i].MasaMaxima;
                  j:=i;
                End;
            For i:=Min To Max Do
              If (Controv.Auto[i].MasaMaxima<MinimInt) And (Controv.Auto[i].MasaMaxima<>0) Then
                Begin
                  MinimInt:=Controv.Auto[i].MasaMaxima;
                  j:=i;
                End;
            If j<>0 Then
              SchimbaControvAuto(Controv,Min,j);
          End;
        5: //axe
          Begin
            j:=0;
            MinimInt:=0;
            For i:=Min To Max Do
              If Controv.Auto[i].Axe<>0 Then
                Begin
                  MinimInt:=Controv.Auto[i].Axe;
                  j:=i;
                End;
            For i:=Min To Max Do
              If (Controv.Auto[i].Axe<MinimInt) And (Controv.Auto[i].Axe<>0) Then
                Begin
                  MinimInt:=Controv.Auto[i].Axe;
                  j:=i;
                End;
            If j<>0 Then
              SchimbaControvAuto(Controv,Min,j);
          End;
        6: //clasa poluare
          Begin
            j:=0;
            MinimStr:='';
            For i:=Min To Max Do
              If Controv.Auto[i].ClasaPoluare<>'' Then
                Begin
                  MinimStr:=Controv.Auto[i].ClasaPoluare;
                  j:=i;
                End;
            For i:=Min To Max Do
              If (Controv.Auto[i].ClasaPoluare<MinimStr) And (Controv.Auto[i].ClasaPoluare<>'') Then
                Begin
                  MinimStr:=Controv.Auto[i].ClasaPoluare;
                  j:=i;
                End;
            If j<>0 Then
              SchimbaControvAuto(Controv,Min,j);
          End;
        7: //axe
          Begin
            j:=0;
            MinimFlt:=0;
            For i:=Min To Max Do
              If Controv.Auto[i].Tarif<>0 Then
                Begin
                  MinimFlt:=Controv.Auto[i].Tarif;
                  j:=i;
                End;
            For i:=Min To Max Do
              If (Controv.Auto[i].Tarif<MinimFlt) And (Controv.Auto[i].Tarif<>0) Then
                Begin
                  MinimFlt:=Controv.Auto[i].Tarif;
                  j:=i;
                End;
            If j<>0 Then
              SchimbaControvAuto(Controv,Min,j);
          End;
      End;
    End;
Begin
  For i:=1 To 10 Do
    MinimControv(Controv[Index],i,10);//Index
End;

Procedure TControv_.Ordonare2;
Var i:Integer;
  Procedure MinimControv(Var Controv:TControv;Min,Max:Integer);
    Procedure SchimbaControvRata(Var Controv:TControv;i,j:Integer);
      Var Temp:TControv;
      Begin
        Temp.Rata[1]:=Controv.Rata[j];
        Controv.Rata[j]:=Controv.Rata[i];
        Controv.Rata[i]:=Temp.Rata[1];
      End;
    Var i,j:Integer;
        MinimStr:String;
        MinimInt:Integer;
        MinimFlt:Currency;
    Begin
      Case Criteriu Of
        0: //rata
          Begin
            j:=0;
            MinimInt:=0;
            For i:=Min To Max Do
              If Controv.Rata[i].Poz<>0 Then
                Begin
                  MinimInt:=Controv.Rata[i].Poz;
                  j:=i;
                End;
            For i:=Min To Max Do
              If (Controv.Rata[i].Poz<MinimInt) And (Controv.Rata[i].Poz<>0) Then
                Begin
                  MinimInt:=Controv.Rata[i].Poz;
                  j:=i;
                End;
            If j<>0 Then
              SchimbaControvRata(Controv,Min,j);
          End;
        1: //Taxa
          Begin
            j:=0;
            MinimFlt:=0;
            For i:=Min To Max Do
              If Controv.Rata[i].Taxa<>0 Then
                Begin
                  MinimFlt:=Controv.Rata[i].Taxa;
                  j:=i;
                End;
            For i:=Min To Max Do
              If (Controv.Rata[i].Taxa<MinimFlt) And (Controv.Rata[i].Taxa<>0) Then
                Begin
                  MinimFlt:=Controv.Rata[i].Taxa;
                  j:=i;
                End;
            If j<>0 Then
              SchimbaControvRata(Controv,Min,j);
          End;
        2: //Termen
          Begin
            j:=0;
            MinimStr:='';
            For i:=Min To Max Do
              If Controv.Rata[i].Termen<>'' Then
                Begin
                  MinimStr:=Controv.Rata[i].Termen;
                  j:=i;
                End;
            For i:=Min To Max Do
              If (Controv.Rata[i].Termen<MinimStr) And (Controv.Rata[i].Termen<>'') Then
                Begin
                  MinimStr:=Controv.Rata[i].Termen;
                  j:=i;
                End;
            If j<>0 Then
              SchimbaControvRata(Controv,Min,j);
          End;
        3: //valabilitate
          Begin
            j:=0;
            MinimStr:='';
            For i:=Min To Max Do
              If Controv.Rata[i].Valabilitate<>'' Then
                Begin
                  MinimStr:=Controv.Rata[i].Valabilitate;
                  j:=i;
                End;
            For i:=Min To Max Do
              If (Controv.Rata[i].Valabilitate<MinimStr) And (Controv.Rata[i].Valabilitate<>'') Then
                Begin
                  MinimStr:=Controv.Rata[i].Valabilitate;
                  j:=i;
                End;
            If j<>0 Then
              SchimbaControvRata(Controv,Min,j);
          End;
        4: //plata
          Begin
            j:=0;
            MinimStr:='';
            For i:=Min To Max Do
              If Controv.Rata[i].Plata<>'' Then
                Begin
                  MinimStr:=Controv.Rata[i].Plata;
                  j:=i;
                End;
            For i:=Min To Max Do
              If (Controv.Rata[i].Plata>MinimStr) And (Controv.Rata[i].Plata<>'') Then
                Begin
                  MinimStr:=Controv.Rata[i].Plata;
                  j:=i;
                End;
            If j<>0 Then
              SchimbaControvRata(Controv,Min,j);
          End;
        5: //numar factura
          Begin
            j:=0;
            MinimStr:='';
            For i:=Min To Max Do
              If Controv.Rata[i].nrFactura<>'' Then
                Begin
                  MinimStr:=Controv.Rata[i].nrFactura;
                  j:=i;
                End;
            For i:=Min To Max Do
              If (Controv.Rata[i].nrFactura<MinimStr) And (Controv.Rata[i].nrFactura<>'') Then
                Begin
                  MinimStr:=Controv.Rata[i].nrFactura;
                  j:=i;
                End;
            If j<>0 Then
              SchimbaControvRata(Controv,Min,j);
          End;
      End;
    End;
Begin
  For i:=1 To 4 Do
    MinimControv(Controv[Index],i,4);//Index
End;

Procedure TControv_.IncarcareBazaDate;
Var i,j1,j2:Integer;
    kkk:Extended;
Begin
  If Not Blocare Then
    Begin
      j1:=ListBox1.ItemIndex;
      If j1=-1 Then j1:=0;
      j2:=ListBox2.ItemIndex;
      If j2=-1 Then j2:=0;
      Blocare:=True;
      ListBox1.Clear;
      Blocare:=True;
      ListBox2.Clear;
      If Index<>0 Then
        Begin
          For i:=1 To 50 Do
            Begin
              If (//Controv[Index].Auto[i].Poz+
                  Controv[Index].Auto[i].MasaMaxima+
                  Controv[Index].Auto[i].Axe+
                  Controv[Index].Auto[i].Tarif<>0) Or
                 (Controv[Index].Auto[i].Tip+
                  Controv[Index].Auto[i].nrInmatriculare+
                  Controv[Index].Auto[i].nrIdentificare+
                  Controv[Index].Auto[i].ClasaPoluare<>'') Then
                 Begin
                   Controv[Index].Auto[i].Poz:=i;
                   Blocare:=True;
                   ListBox1.Items.Add(AddSpace(IntToStr(Controv[Index].Auto[i].Poz),3,True)+' '+
                                      AddSpace(MaxChar(Controv[Index].Auto[i].Tip,24,False),24,False)+' '+
                                      AddSpace(Controv[Index].Auto[i].nrInmatriculare,10,False)+' '+
                                      AddSpace(Controv[Index].Auto[i].nrIdentificare,19,False)+' '+
                                      AddSpace(Virgularizare(Controv[Index].Auto[i].MasaMaxima,Utilizareseparatormii1.Checked),8,True)+' '+
                                      AddSpace(Virgularizare(Controv[Index].Auto[i].Axe,Utilizareseparatormii1.Checked),6,True)+' '+
                                      AddSpace(Controv[Index].Auto[i].ClasaPoluare,8,True)+' '+
                                      AddSpace(Virgularizare3(Controv[Index].Auto[i].Tarif,Controv_.Utilizareseparatormii1.Checked),8,True));
                   Blocare:=False;
                 End;
            End;
          For i:=1 To 4 Do
            Begin
              Blocare:=True;
              ListBox2.Items.Add(AddSpace(IntToStr(Controv[Index].Rata[i].Poz),5,True)+' '+
                                 AddSpace(Virgularizare3(Controv[Index].Rata[i].Taxa,Controv_.Utilizareseparatormii1.Checked),15,True)+' '+
                                 AddSpace(ScriereData(Controv[Index].Rata[i].Termen,FormatData),15,True)+' '+
                                 //AddSpace(Controv[Index].Rata[i].Valabilitate,20,False)+' '+
                                 AddSpace(ScriereData(Extragere(Controv[Index].Rata[i].Valabilitate,Length(Controv[Index].Rata[i].Valabilitate)-8,True),FormatData)+' - '+
                                          ScriereData(Extragere(Controv[Index].Rata[i].Valabilitate,8,False),FormatData),29,True)+' '+
                                 AddSpace(Controv[Index].Rata[i].Plata,13,True)+'  '+
                                 AddSpace(Controv[Index].Rata[i].nrFactura,10,True));
              Blocare:=False;
            End;
          Blocare:=True;
          ListBox1.Items.Add('  0');
        End;
      ListBox1.ItemIndex:=j1;
      Blocare:=False;
      ListBox1Click(Self);
      ListBox2.ItemIndex:=j2;
      Blocare:=False;
      ListBox2Click(Self);
      Blocare:=False;
      If (Index>0) And (Index<101) Then
        Begin
          kkk:=0;
          For i:=1 To 50 Do
            kkk:=kkk+Controv[Index].Auto[i].Tarif;
          Edit12.Text:=FloatToStrF(kkk,ffFixed,16,2);
          Edit18.Text:=FloatToStrF(Controv[Index].Rata[1].Taxa+
                                   Controv[Index].Rata[2].Taxa+
                                   Controv[Index].Rata[3].Taxa+
                                   Controv[Index].Rata[4].Taxa,ffFixed,16,2);
        End
      Else
        Begin
          Edit12.Text:='0.00';
          Edit18.Text:='0.00';
        End;
    End;
  If AdresaFisier<>'' Then
    DataSalvare.Text:=ScriereData(FormatDateTime('yyyymmdd',FileDateToDateTime(FileAge(AdresaFisier))),FormatData)+' '+
                      FormatDateTime('hh:nn:ss',FileDateToDateTime(FileAge(AdresaFisier)));
End;

Procedure TControv_.AutoIntroducere(b:Boolean);
Var s,s1,s2,s3:String;
    t1,t2:String;
    r1,r2,r3:Integer;
    w1,w2,w3:Integer;
Begin
  If (Edit17.Text='') And (b) Then
    Begin
      s:=Controv[Index].Rata[ListBox2.ItemIndex+1].Termen;
      If IsDataCorecta(s) Then
        Begin
          s:=Controv[Index].Rata[ListBox2.ItemIndex+1].Termen;
          s1:=Extragere(s,4,True);
          s2:=Extragere(Extragere(s,4,False),2,True);
          s3:=Extragere(s,2,False);
          r1:=StrToInt(s1);
          r2:=StrToInt(s2);
          r3:=StrToInt(s3);
          t1:=s;
          w3:=r3-1;         //ziua
          w2:=r2+3;         //luna
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
          s1:=AddChar(IntToStr(w1),'0',4);
          s2:=AddChar(IntToStr(w2),'0',2);
          s3:=AddChar(IntToStr(w3),'0',2);
          t2:=s1+s2+s3;
          Controv[Index].Rata[ListBox2.ItemIndex+1].Valabilitate:=t1+'-'+t2;
        End;
    End;
End;

Function AutoIntroducereData(Data:String;i:Integer):String;
Var s,s1,s2,s3:String;
    t1,t2:String;
    r1,r2,r3:Integer;
    w1,w2,w3:Integer;
Begin
  s:=Data;
  If IsDataCorecta(s) Then
    Begin
      s:=Data;
      s1:=Extragere(s,4,True);
      s2:=Extragere(Extragere(s,4,False),2,True);
      s3:=Extragere(s,2,False);
      r1:=StrToInt(s1);
      r2:=StrToInt(s2);
      r3:=StrToInt(s3);
      t1:=s;
      w3:=r3-1;         //ziua
      w2:=r2+3;         //luna
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
      s1:=AddChar(IntToStr(w1),'0',4);
      s2:=AddChar(IntToStr(w2),'0',2);
      s3:=AddChar(IntToStr(w3),'0',2);
      t2:=s1+s2+s3;
      Result:=ScriereData(t1,FormatData)+' - '+ScriereData(t2,FormatData);
    End
  Else
    Result:='Eroare';
End;

Procedure TControv_.Sortare;
  Var i:Integer;
      s:String;
  Procedure MinimControv(Var Controv:TArrayControv;Min,Max:Integer);
    Var i,j:Integer;
        MinimStr:String;
    Procedure SchimbaControv(Var Controv:TArrayControv;i,j:Integer);
      Var Temp:TControv;
      Begin
        Temp:=Controv[j];
        Controv[j]:=Controv[i];
        Controv[i]:=Temp;
      End;
    Begin
      j:=0;
      MinimStr:='';
      For i:=Min To Max Do
        If Controv[i].nrContract<>'' Then
          Begin
            MinimStr:=Controv[i].nrContract;
            j:=i;
          End;
      For i:=Min To Max Do
        If (Controv[i].nrContract<MinimStr) And (Controv[i].nrContract<>'') Then
          Begin
            MinimStr:=Controv[i].nrContract;
            j:=i;
          End;
      If j<>0 Then
        SchimbaControv(Controv,Min,j);
    End;
Begin
  Index:=0;
  s:=Controv[ComboBox1.ItemIndex+1].nrContract;
  For i:=1 To 100 Do
    MinimControv(Controv,i,100);
  For i:=1 To 100 DO
    If Controv[i].nrContract=s Then
      Begin
        Index:=i;
        Break;
      End;
  If Index=0 Then
    Index:=1;
  IncarcareBazaDate;
End;

procedure TControv_.Ajutor1Click(Sender: TObject);
begin
  With Istoric_ Do
    Begin
      Ajutor.Checked:=True;
      //Versiune.Checked:=False;
      //Contract.Checked:=False;
      //AjutorClick(Sender);
      Memo1.Visible:=True;
      Memo2.Visible:=False;
      Memo3.Visible:=False;
      ShowModal;
    End;
end;

procedure TControv_.Versiune1Click(Sender: TObject);
begin
  With Istoric_ Do
    Begin
      //Ajutor.Checked:=False;
      Versiune.Checked:=True;
      //RadioButton3.Checked:=False;
      //VersiuneClick(Sender);
      Memo1.Visible:=False;
      Memo2.Visible:=True;
      Memo3.Visible:=False;
      ShowModal;
    End;
end;

procedure TControv_.Contract1Click(Sender: TObject);
begin
  With Istoric_ Do
    Begin
      //Ajutor.Checked:=False;
      //Versiune.Checked:=False;
      Contract.Checked:=True;
      //ContractClick(Sender);
      Memo1.Visible:=False;
      Memo2.Visible:=False;
      Memo3.Visible:=True;
      ShowModal;
    End;
end;

procedure TControv_.Dreptdeautor1Click(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

procedure TControv_.Iesire1Click(Sender: TObject);
begin
  Controv_.CloseQuery;
end;

procedure TControv_.Salvare1Click(Sender: TObject);
Var Fis:File Of TArrayControv;
begin
  If AdresaFisier='' Then
    SalvareCa1Click(Sender)
  Else
    Begin
      Sortare;
      AssignFile (Fis,AdresaFisier);
      ReWrite (Fis);
      Write(Fis,Controv);
      CloseFile(Fis);
      RefreshControv;
      Export_.SaveDialog1.FileName:='Controv - ['+Extragere(ExtractFileName(AdresaFisier),4,True)+']';
      DataSalvare.Text:=ScriereData(FormatDateTime('yyyymmdd',FileDateToDateTime(FileAge(AdresaFisier))),FormatData)+' '+
                        FormatDateTime('hh:nn:ss',FileDateToDateTime(FileAge(AdresaFisier)));
    End;
end;

procedure TControv_.Salvareca1Click(Sender: TObject);
begin
  If SaveDialog1.Execute Then
    Begin
      AdresaFisier:=SaveDialog1.FileName;
      Controv_.Caption:='ContROV - ['+AdresaFisier+']';
      Salvare1Click(Sender);
    End;
end;

procedure TControv_.Deschidere1Click(Sender: TObject);
Var Fis:File Of TArrayControv;
begin
  If OpenDialog1.Execute Then
    Begin
      AdresaFisier:=OpenDialog1.FileName;
      AssignFile (Fis,AdresaFisier);
      Reset(Fis);
      Read(Fis,Controv);
      Index:=1;
      RefreshControv;
      Controv_.Caption:='ContROV - ['+AdresaFisier+']';
      Export_.SaveDialog1.FileName:='Controv - ['+Extragere(ExtractFileName(AdresaFisier),4,True)+']';
      DataSalvare.Text:=ScriereData(FormatDateTime('yyyymmdd',FileDateToDateTime(FileAge(AdresaFisier))),FormatData)+' '+
                        FormatDateTime('hh:nn:ss',FileDateToDateTime(FileAge(AdresaFisier)));
    End;
end;

Procedure TControv_.RefreshControv;
Var i:Integer;
Begin
  If Not Blocare Then
    Begin
      Blocare:=True;
      //Index:=ComboBox1.ItemIndex+1;
      ComboBox1.Clear;
      For i:=1 To 100 Do
        Begin
          If Controv[i].nrContract<>'' Then
            Begin
              Blocare:=True;
              ComboBox1.Items.Add(Controv[i].nrContract);
            End;
        End;
      Blocare:=True;
      ComboBox1.ItemIndex:=Index-1;
      Blocare:=False;
      ComboBox1Change(Self);
      Blocare:=False;
    End;
End;

procedure TControv_.ComboBox1Change(Sender: TObject);
begin
  If Not Blocare Then
    Begin
      Index:=ComboBox1.ItemIndex+1;
      Blocare:=False;
      IncarcareBazaDate;
      Blocare:=False;
    End;
  Panel1.Enabled:=ComboBox1.ItemIndex<>-1;
  Panel5.Enabled:=ComboBox1.ItemIndex<>-1;
end;

procedure TControv_.ListBox1Click(Sender: TObject);
begin
  If Not Blocare Then
    Begin
      If Index<>0 Then
        Begin
          Blocare:=True;
          Edit3.Text:=Controv[Index].dataContract;
          Blocare:=True;
          Edit5.Text:=Controv[Index].Auto[ListBox1.ItemIndex+1].Tip;
          Blocare:=True;
          Edit6.Text:=Controv[Index].Auto[ListBox1.ItemIndex+1].nrInmatriculare;
          Blocare:=True;
          Edit7.Text:=Controv[Index].Auto[ListBox1.ItemIndex+1].nrIdentificare;
          Blocare:=True;
          Edit8.Text:=IntToStr(Controv[Index].Auto[ListBox1.ItemIndex+1].MasaMaxima);
          Blocare:=True;
          Edit9.Text:=IntToStr(Controv[Index].Auto[ListBox1.ItemIndex+1].Axe);
          Blocare:=True;
          Edit10.Text:=Controv[Index].Auto[ListBox1.ItemIndex+1].ClasaPoluare;
          Blocare:=True;
          Edit11.Text:=FloatToStr(Controv[Index].Auto[ListBox1.ItemIndex+1].Tarif);
          Blocare:=False;
        End
      Else
        Begin
          Blocare:=True;
          Edit3.Text:='';
          Blocare:=True;
          Edit5.Text:='';
          Blocare:=True;
          Edit6.Text:='';
          Blocare:=True;
          Edit7.Text:='';
          Blocare:=True;
          Edit8.Text:='';
          Blocare:=True;
          Edit9.Text:='';
          Blocare:=True;
          Edit10.Text:='';
          Blocare:=True;
          Edit11.Text:='';
          Blocare:=False;
        End;
      Edit3.Enabled:=Index<>0;
      Edit5.Enabled:=Index<>0;
      Edit6.Enabled:=Index<>0;
      Edit7.Enabled:=Index<>0;
      Edit8.Enabled:=Index<>0;
      Edit9.Enabled:=Index<>0;
      Edit10.Enabled:=Index<>0;
      Edit11.Enabled:=Index<>0;
    End;
end;

procedure TControv_.ListBox2Click(Sender: TObject);
begin
  If Not Blocare Then
    Begin
      If Index<>0 Then
        Begin
          Edit14.Text:=FloatToStr(Controv[Index].Rata[ListBox2.ItemIndex+1].Taxa);
          Edit15.Text:=Controv[Index].Rata[ListBox2.ItemIndex+1].Termen;
          If Controv[Index].Rata[ListBox2.ItemIndex+1].Plata='Platita' Then
            ComboBox2.ItemIndex:=0
          Else
            ComboBox2.ItemIndex:=1;
          Edit16.Text:=Controv[Index].Rata[ListBox2.ItemIndex+1].nrFactura;
          Edit17.Text:=Controv[Index].Rata[ListBox2.ItemIndex+1].Valabilitate;
        End
      Else
        Begin
          Edit14.Text:='';
          Edit15.Text:='';
          ComboBox2.ItemIndex:=-1;
          Edit16.Text:='';
          Edit17.Text:='';
        End;
      Edit14.Enabled:=Index<>0;
      Edit15.Enabled:=Index<>0;
      ComboBox2.Enabled:=Index<>0;
      Edit16.Enabled:=Index<>0;
      Edit17.Enabled:=Index<>0;
    End;
  Edit1Change(Sender);  
end;

procedure TControv_.AdaugareCR1Click(Sender: TObject);
Var i,j:Integer;
    s:String;
begin
  j:=1;
  For i:=1 To 100 Do
    Begin
      If Controv[i].nrContract='' Then
        Begin
          //ShowMessage(Controv[i].nrContract);
          j:=i;
          Break;
        End;
    End;
  If (InputQuery('Adaugare','Introdu numarul contractului',s)) And (s<>'') Then
    Begin
      For i:=1 To 100 Do
        Begin
          If Controv[i].nrContract=s Then
            j:=i;
        End;
      Controv[j].nrContract:=s;
      Index:=j;
      Blocare:=False;
      RefreshControv;
    End;
end;

procedure TControv_.Nou1Click(Sender: TObject);
begin
  If MessageDlg('Se va crea o baza de date vida.'#13+
                'Baza de date deschisa trebuie inchisa.'#13#13+
                'Se confirma inchiderea bazei de date curente?',mtConfirmation,[mbYes,mbNo],0)=mrYes Then
    Begin
      VidareControv;
      RefreshControv;
      AdresaFisier:='';
      Controv_.Caption:='ContROV - []';
      Export_.SaveDialog1.FileName:='ContROV - []';
      DataSalvare.Text:='necunoscuta';
    End;
end;

procedure TControv_.FormCreate(Sender: TObject);
begin
  VidareControv;
  Blocare:=False;
  RefreshControv;
  Edit1Change(Sender);
  Run41Time:=True;
end;

procedure TControv_.RadioButton1Click(Sender: TObject);
begin
  If Not RadioButton1.Checked Then RadioButton1.Checked:=True;
  Criteriu1:=0;
  Ordonare1(Controv,Criteriu1);
  RefreshControv;
end;

procedure TControv_.RadioButton2Click(Sender: TObject);
begin
  If Not RadioButton2.Checked Then RadioButton2.Checked:=True;
  Criteriu1:=1;
  Ordonare1(Controv,Criteriu1);
  RefreshControv;
end;

procedure TControv_.RadioButton3Click(Sender: TObject);
begin
  If Not RadioButton3.Checked Then RadioButton3.Checked:=True;
  Criteriu1:=2;
  Ordonare1(Controv,Criteriu1);
  RefreshControv;
end;

procedure TControv_.RadioButton4Click(Sender: TObject);
begin
  If Not RadioButton4.Checked Then RadioButton4.Checked:=True;
  Criteriu1:=3;
  Ordonare1(Controv,Criteriu1);
  RefreshControv;
end;

procedure TControv_.RadioButton5Click(Sender: TObject);
begin
  If Not RadioButton5.Checked Then RadioButton5.Checked:=True;
  Criteriu1:=4;
  Ordonare1(Controv,Criteriu1);
  RefreshControv;
end;

procedure TControv_.RadioButton6Click(Sender: TObject);
begin
  If Not RadioButton6.Checked Then RadioButton6.Checked:=True;
  Criteriu1:=0;
  Ordonare1(Controv,Criteriu1);
  RefreshControv;
end;

procedure TControv_.RadioButton7Click(Sender: TObject);
begin
  If Not RadioButton7.Checked Then RadioButton7.Checked:=True;
  Criteriu1:=6;
  Ordonare1(Controv,Criteriu1);
  RefreshControv;
end;

procedure TControv_.RadioButton8Click(Sender: TObject);
begin
  If Not RadioButton8.Checked Then RadioButton8.Checked:=True;
  Criteriu1:=7;
  Ordonare1(Controv,Criteriu1);
  RefreshControv;
end;

procedure TControv_.Edit5Change(Sender: TObject);
begin
  If Not Blocare Then
    Begin
      Blocare:=True;
      Controv[Index].Auto[ListBox1.ItemIndex+1].Tip:=Edit5.Text;
      Blocare:=False;
      IncarcareBazaDate;
    End;
end;

procedure TControv_.Edit6Change(Sender: TObject);
begin
  If Not Blocare Then
    Begin
      Blocare:=True;
      Controv[Index].Auto[ListBox1.ItemIndex+1].nrInmatriculare:=Edit6.Text;
      Blocare:=False;
      IncarcareBazaDate;
    End;
end;

procedure TControv_.Edit7Change(Sender: TObject);
begin
  If Not Blocare Then
    Begin
      Blocare:=True;
      Controv[Index].Auto[ListBox1.ItemIndex+1].nrIdentificare:=Edit7.Text;
      Blocare:=False;
      IncarcareBazaDate;
    End;
end;

procedure TControv_.Edit8Change(Sender: TObject);
begin
  If Not Blocare Then
    Begin
      Blocare:=True;
      If Edit8.Text<>'' Then
        Controv[Index].Auto[ListBox1.ItemIndex+1].MasaMaxima:=StrToInt(Edit8.Text);
      Blocare:=False;
      IncarcareBazaDate;
    End;
end;

procedure TControv_.Edit9Change(Sender: TObject);
begin
  If Not Blocare Then
    Begin
      Blocare:=True;
      If Edit9.Text<>'' Then
        Controv[Index].Auto[ListBox1.ItemIndex+1].Axe:=StrToInt(Edit9.Text);
      Blocare:=False;
      IncarcareBazaDate;
    End;
end;

procedure TControv_.Edit10Change(Sender: TObject);
begin
  If Not Blocare Then
    Begin
      Blocare:=True;
      Controv[Index].Auto[ListBox1.ItemIndex+1].ClasaPoluare:=Edit10.Text;
      Blocare:=False;
      IncarcareBazaDate;
    End;
end;

procedure TControv_.Edit11Change(Sender: TObject);
begin
  If Not Blocare Then
    Begin
      If Not LastIsPoint(Edit11.Text) Then
        Begin
          Blocare:=True;
          If Edit11.Text<>'' Then
            Controv[Index].Auto[ListBox1.ItemIndex+1].Tarif:=StrToFloat(Edit11.Text);
          Blocare:=False;
          IncarcareBazaDate;
        End;
    End;
end;

procedure TControv_.Edit14Change(Sender: TObject);
begin
  If Not Blocare Then
    Begin
      If Not LastIsPoint(Edit14.Text) Then
        Begin
          Blocare:=True;
          If Edit14.Text<>'' Then
            Controv[Index].Rata[ListBox2.ItemIndex+1].Taxa:=StrToFloat(Edit14.Text);
          Blocare:=False;
          IncarcareBazaDate;
        End;
    End;
end;

procedure TControv_.Edit15Change(Sender: TObject);
begin
  If Not Blocare Then
    Begin
      Blocare:=True;
      Controv[Index].Rata[ListBox2.ItemIndex+1].Termen:=Edit15.Text;
      If (Edit17.Text='') And Autointroducerevalabilitate1.Checked Then
        Begin
          AutoIntroducere(Autointroducerevalabilitate1.Checked);
        End;
      Blocare:=False;
      IncarcareBazaDate;
    End;
end;

procedure TControv_.ComboBox2Change(Sender: TObject);
begin
  If Not Blocare Then
    Begin
      Blocare:=True;
      If ComboBox2.ItemIndex=0 Then
        Controv[Index].Rata[ListBox2.ItemIndex+1].Plata:='Platita'
      Else
        Controv[Index].Rata[ListBox2.ItemIndex+1].Plata:='Neplatita';
      Blocare:=False;
      IncarcareBazaDate;
    End;
  //Edit1Change(Sender);  
end;

procedure TControv_.Edit16Change(Sender: TObject);
begin
  If Not Blocare Then
    Begin
      Blocare:=True;
      Controv[Index].Rata[ListBox2.ItemIndex+1].nrFactura:=Edit16.Text;
      Blocare:=False;
      IncarcareBazaDate;
    End;
end;

procedure TControv_.Edit17Change(Sender: TObject);
begin
  If Not Blocare Then
    Begin
      Blocare:=True;
      Controv[Index].Rata[ListBox2.ItemIndex+1].Valabilitate:=Edit17.Text;
      Blocare:=False;
      IncarcareBazaDate;
    End;
end;

procedure TControv_.Edit3Change(Sender: TObject);
begin
  If Not Blocare Then
    Begin
      Blocare:=True;
      Controv[Index].dataContract:=Edit3.Text; 
      Blocare:=False;
      //RefreshControv;
    End;
end;

procedure TControv_.Edit1Change(Sender: TObject);
begin
  Salvare1.Enabled:=Edit1.Text='123456';
  Salvareca1.Enabled:=Edit1.Text='123456';
  AdaugareCR1.Enabled:=Edit1.Text='123456';
  StergereCR1.Enabled:=Edit1.Text='123456';
  SpeedButton2.Enabled:=Edit1.Text='123456';
  Edit3.ReadOnly:=Not (Edit1.Text='123456');
  Edit5.ReadOnly:=Not (Edit1.Text='123456');
  Edit6.ReadOnly:=Not (Edit1.Text='123456');
  Edit7.ReadOnly:=Not (Edit1.Text='123456');
  Edit8.ReadOnly:=Not (Edit1.Text='123456');
  Edit9.ReadOnly:=Not (Edit1.Text='123456');
  Edit10.ReadOnly:=Not (Edit1.Text='123456');
  Edit11.ReadOnly:=Not (Edit1.Text='123456');
  Edit14.ReadOnly:=Not (Edit1.Text='123456');
  Edit15.ReadOnly:=Not (Edit1.Text='123456');
  ComboBox2.Enabled:=Edit1.Text='123456';
  Edit16.ReadOnly:=Not (Edit1.Text='123456');
  Edit17.ReadOnly:=Not (Edit1.Text='123456');
end;

procedure TControv_.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  If MessageDlg('Se inchide aplicatia?',mtInformation,[mbYes,mbNo],0)=mrYes Then
    Application.Terminate
  Else
    CanClose:=False;
end;

procedure TControv_.RadioButton9Click(Sender: TObject);
begin
  If Not RadioButton9.Checked Then RadioButton9.Checked:=True;
  Criteriu2:=0;
  Ordonare2(Controv,Criteriu2);
  RefreshControv;
end;

procedure TControv_.RadioButton10Click(Sender: TObject);
begin
  If Not RadioButton10.Checked Then RadioButton10.Checked:=True;
  Criteriu2:=1;
  Ordonare2(Controv,Criteriu2);
  RefreshControv;
end;

procedure TControv_.RadioButton11Click(Sender: TObject);
begin
  If Not RadioButton11.Checked Then RadioButton11.Checked:=True;
  Criteriu2:=2;
  Ordonare2(Controv,Criteriu2);
  RefreshControv;
end;

procedure TControv_.RadioButton12Click(Sender: TObject);
begin
  If Not RadioButton12.Checked Then RadioButton12.Checked:=True;
  Criteriu2:=3;
  Ordonare2(Controv,Criteriu2);
  RefreshControv;
end;

procedure TControv_.RadioButton13Click(Sender: TObject);
begin
  If Not RadioButton13.Checked Then RadioButton13.Checked:=True;
  Criteriu2:=4;
  Ordonare2(Controv,Criteriu2);
  RefreshControv;
end;

procedure TControv_.RadioButton14Click(Sender: TObject);
begin
  If Not RadioButton14.Checked Then RadioButton14.Checked:=True;
  Criteriu2:=5;
  Ordonare2(Controv,Criteriu2);
  RefreshControv;
end;

procedure TControv_.StergereCR1Click(Sender: TObject);
Var Temp:Integer;
begin
  If MessageDlg('Se sterge contractul nr. '+Controv[Index].nrContract+
                ' din '+ScriereData(Controv[Index].dataContract,FormatData)+'?',
                mtConfirmation,[mbYes,mbNo],0)=mrYes Then
    Begin
      Temp:=Index;
      VidareKontrov(Index);
      Sortare;
      Index:=Temp;
      If Index>ComboBox1.Items.Capacity-1 Then
        Index:=ComboBox1.Items.Capacity-1;
      RefreshControv;
    End;
end;

procedure TControv_.Export1Click(Sender: TObject);
begin
  Export_.ShowModal;
end;

procedure TControv_.Contractprecedent1Click(Sender: TObject);
begin
  If ComboBox1.ItemIndex>0 Then
    Begin
      ComboBox1.ItemIndex:=ComboBox1.ItemIndex-1;
      ComboBox1Change(Sender);
    End;
end;

procedure TControv_.Contracturmator1Click(Sender: TObject);
begin
  If ComboBox1.ItemIndex<ComboBox1.Items.Capacity-1 Then
    Begin
      ComboBox1.ItemIndex:=ComboBox1.ItemIndex+1;
      ComboBox1Change(Sender);
    End;
end;

procedure TControv_.Autoprecedent1Click(Sender: TObject);
begin
  If ListBox1.ItemIndex>0 Then
    Begin
      ListBox1.ItemIndex:=ListBox1.ItemIndex-1;
      ListBox1Click(Sender);
    End;
end;

procedure TControv_.Autourmator1Click(Sender: TObject);
begin
  If ListBox1.ItemIndex<ListBox1.Items.Capacity-1 Then
    Begin
      ListBox1.ItemIndex:=ListBox1.ItemIndex+1;
      ListBox1Click(Sender);
    End;
end;

procedure TControv_.Rataprecedenta1Click(Sender: TObject);
begin
  If ListBox2.ItemIndex>0 Then
    Begin
      ListBox2.ItemIndex:=ListBox2.ItemIndex-1;
      ListBox2Click(Sender);
    End;
end;

procedure TControv_.Rataurmatoare1Click(Sender: TObject);
begin
  If ListBox2.ItemIndex<ListBox2.Items.Capacity-1 Then
    Begin
      ListBox2.ItemIndex:=ListBox2.ItemIndex+1;
      ListBox2Click(Sender);
    End;
end;

procedure TControv_.aaaallzz1Click(Sender: TObject);
begin
  aaaallzz1.Checked:=True;
  FormatData:=0;
  IncarcareBazaDate;
end;

procedure TControv_.zzlllaaaa1Click(Sender: TObject);
begin
  zzlllaaaa1.Checked:=True;
  FormatData:=1;
  IncarcareBazaDate;
end;

procedure TControv_.zzllaaaa1Click(Sender: TObject);
begin
  zzllaaaa1.Checked:=True;
  FormatData:=2;
  IncarcareBazaDate;
end;

procedure TControv_.zzllaaaa2Click(Sender: TObject);
begin
  zzllaaaa2.Checked:=True;
  FormatData:=3;
  IncarcareBazaDate;
end;

procedure TControv_.zzllaaaa3Click(Sender: TObject);
begin
  zzllaaaa3.Checked:=True;
  FormatData:=4;
  IncarcareBazaDate;
end;

procedure TControv_.SpeedButton5Click(Sender: TObject);
begin
  PopupMenu1.Popup (Controv_.Left+105,Controv_.Top+55);
end;

procedure TControv_.Setari1Click(Sender: TObject);
begin
  PopupMenu1.Popup (Controv_.Left+83,Controv_.Top+41);
end;

procedure TControv_.Autointroducerevalabilitate1Click(Sender: TObject);
begin
  Autointroducerevalabilitate1.Checked:=Not Autointroducerevalabilitate1.Checked; 
end;

procedure TControv_.Utilizareseparatormii1Click(Sender: TObject);
begin
  Utilizareseparatormii1.Checked:=Not Utilizareseparatormii1.Checked;
  IncarcareBazaDate; 
end;

procedure TControv_.FormActivate(Sender: TObject);
begin
  If Run41Time Then
    Begin
      Run41Time:=False;
      Deschidere1Click(Sender);
    End;
end;

procedure TControv_.Cautare1Click(Sender: TObject);
begin
  FindDialog1.Execute; 
end;
    
procedure TControv_.FindDialog1Find(Sender: TObject);
begin
  MessageDlg('Nediponibil!',mtInformation,[mbOk],0);
end;

end.
