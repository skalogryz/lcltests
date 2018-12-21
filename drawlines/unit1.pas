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
  x : integer;
const
  w    : array [0..2] of integer = (1,  10, 1);
  yofs : array [0..2] of integer = (10, 50, 50);
  clr  : array [0..2] of TColor  = (clblue, clblue, clLime);
  draw : array [0..2] of boolean = (true, true, true);
begin
  for i:=low(yofs) to high(yofs) do begin
    if not draw[i] then continue;
    x:=10;
    y:=yofs[i];
    dst.Brush.Style:=bsClear;
    dst.Pen.Color:=clr[i];
    dst.Pen.Width:=w[i];
    dst.Pen.EndCap:=pecFlat;
    dst.Pen.JoinStyle:=pjsMiter;
    dst.Line(x,y,x+1,y);
    inc(x,20);

    dst.Line(x,y,x,y+1);
    inc(x,20);

    dst.Line(x,y,x+1,y+1);
    inc(x,20);

    dst.MoveTo(x, y);
    dst.LineTo(x+10, y);
    inc(x,20);

    dst.MoveTo(x, y);
    dst.LineTo(x, y+10);
    inc(x,20);

    dst.MoveTo(x, y);
    dst.LineTo(x+10, y+10);
    inc(x,20);

    dst.Rectangle(x, y, x+10, y+10);

  end;

//  dst.Line(10,10,11,11);
end;

end.

