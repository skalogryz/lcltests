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
  DrawToCanvas(Canvas);
end;

procedure TForm1.DrawToCanvas(dst: TCanvas);
var
  y : integer;
  i : integer;
const
  w: array [0..1] of integer = (1, 10);
  yofs: array [0..1] of integer = (10, 50);
begin
  for i:=low(yofs) to high(yofs) do begin
    y:=yofs[i];
    dst.Pen.Color:=clBlue;
    dst.Pen.Width:=w[i];
    dst.Pen.EndCap:=pecFlat;
    dst.Line(10,y,11,y);

    dst.Line(20,y,20,y+1);

    dst.MoveTo(30, y);
    dst.LineTo(40, y);

    dst.MoveTo(50, y);
    dst.LineTo(50, y+10);

    dst.MoveTo(60, y);
    dst.LineTo(60+10, y+10);
  end;

//  dst.Line(10,10,11,11);
end;

end.

