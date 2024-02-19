program Controv;

uses
  Forms,
  _Controv_ in '_Controv_.pas' {Controv_},
  _About_ in '_About_.pas' {AboutBox},
  _Istoric_ in '_Istoric_.pas' {Istoric_},
  _Export_ in '_Export_.pas' {Export_},
  _Monitor_ in '_Monitor_.pas' {Monitor_};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TControv_, Controv_);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TIstoric_, Istoric_);
  Application.CreateForm(TExport_, Export_);
  Application.CreateForm(TMonitor_, Monitor_);
  Application.Run;
end.
