unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, FPCanvas;

type

  { TForm1 }

  TForm1 = class(TForm)
    procedure FormPaint(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }
type
  TTestInfo = record
    name : string;
  end;
const
  PenTest  : array [TFPPenMode] of TTestInfo = (
    (name: 'pmBlack'),
    (name: 'pmWhite'),
    (name: 'pmNop'),
    (name: 'pmNot'),
    (name: 'pmCopy'),
    (name: 'pmNotCopy'),
    (name: 'pmMergePenNot'),
    (name: 'pmMaskPenNot'),
    (name: 'pmMergeNotPen'),
    (name: 'pmMaskNotPen'),
    (name: 'pmMerge'),
    (name: 'pmNotMerge'),
    (name: 'pmMask'),
    (name: 'pmNotMask'),
    (name: 'pmXor'),
    (name: 'pmNotXor')
  );

const
  FirstColor  = clBlue;
  SecondColor = clGreen;

  InitY = 10;
  InitX = 10;

  TestVOfs = 20;


  RectW = 20;
  RectH = 20;


  TestW = 100;
  TestH = 80;

procedure TForm1.FormPaint(Sender: TObject);
var
  i : integer;
  x,y: integer;
  pm  : TPenMode;
begin
  Canvas.Brush.Style:=bsSolid;
  Canvas.Brush.Color:=clLtGray;
  Canvas.FillRect(ClientRect);
  y:=InitY;
  x:=Initx;

  Canvas.Pen.Width:=5;
  Canvas.Brush.Style:=bsClear;
  for pm:=Low(pm) to High(pm) do begin
    if y>ClientHeight - 40 then begin
      y:=10;
      x:=x+TestW;
    end;
    Canvas.TextOut(x,y, PenTest[pm].name);

    Canvas.Pen.Mode:=pmCopy;
    Canvas.Pen.Color:=FirstColor;
    Canvas.Rectangle( Bounds(x, y+TestVOfs, RectW, RectH));

    Canvas.Pen.Mode:=pm;
    Canvas.Pen.Color:=SecondColor;
    Canvas.Rectangle( Bounds(x+RectW div 2, y+TestVOfs+RectH div 2, RectW, RectH));

    y:=y+TestH;
  end;

end;

end.

