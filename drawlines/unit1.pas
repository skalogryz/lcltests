unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs;

type

  { TForm1 }

  TForm1 = class(TForm)
    procedure FormPaint(Sender: TObject);
  private

  public
    procedure DrawToCanvas(dst: TCanvas);
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormPaint(Sender: TObject);
begin

end;

procedure TForm1.DrawToCanvas(dst: TCanvas);
begin
  dst.Pen.Color:=clBlue;
  dst.Line(10,10,11,10);
end;

end.

