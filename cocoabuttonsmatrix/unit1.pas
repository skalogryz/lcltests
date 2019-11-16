unit Unit1;

{$mode objfpc}{$H+}
{$modeswitch objectivec2}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls
  ,CocoaAll,CocoaInt;

type

  { TForm1 }

  TForm1 = class(TForm)
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormShow(Sender: TObject);
type
  bezeldata = record
    name : string;
    showtitle : boolean;
  end;
const
  bezels: array [1..14] of bezeldata = (
    (name: 'NSRoundedBezelStyle';           showtitle: true),
    (name: 'NSRegularSquareBezelStyle';     showtitle: true),
    (name: 'NSThickSquareBezelStyle';       showtitle: true),
    (name: 'NSThickerSquareBezelStyle';     showtitle: true),
    (name: 'NSDisclosureBezelStyle';        showtitle: false),
    (name: 'NSShadowlessSquareBezelStyle';  showtitle: true),
    (name: 'NSCircularBezelStyle';          showtitle: false),
    (name: 'NSTexturedSquareBezelStyle';    showtitle: true),
    (name: 'NSHelpButtonBezelStyle';        showtitle: false),
    (name: 'NSSmallSquareBezelStyle';       showtitle: true),
    (name: 'NSTexturedRoundedBezelStyle';   showtitle: true),
    (name: 'NSRoundRectBezelStyle';         showtitle: true),
    (name: 'NSRecessedBezelStyle';          showtitle: true),
    (name: 'NSRoundedDisclosureBezelStyle'; showtitle: false)
 );
const
  types : array [0..7] of string =
  (
    'NSMomentaryPushButton',
    'NSPushOnPushOffButton',
    'NSToggleButton',
    'NSSwitchButton',
    'NSRadioButton',
    'NSMomentaryChangeButton',
    'NSOnOffButton',
    'NSMomentaryPushInButton'
  );

var
  tp: integer;
  b : integer;
  t : TToggleBox;
  y : integer;
  x : integer;
  l : TLabel;
begin
  x := 10;
  for tp:=low(types) to high(types) do begin
    y := 10;
    l := TLabel.Create(self);
    l.Parent := self;
    l.Top := y;
    l.Left := x+10;
    l.Caption := types[tp];
    inc(y, 20);

    for b:=low(bezels) to High(bezels) do begin
      t := TToggleBox.Create(self);
      t.Parent := self;
      t.BoundsRect:=Bounds(x,y, 80, t.Height);
      t.HandleNeeded;
      if bezels[b].showtitle then
        t.Caption := 'Test'
      else
        t.Caption := '';

      NSbutton(t.Handle).setButtonType(tp);
      NSbutton(t.Handle).setBezelStyle(b);

      l := TLabel.Create(self);
      l.Parent := self;
      l.Caption:= bezels[b].name;
      l.Left := t.Left+t.Width+20;
      l.Top := y;

      inc(y, t.Height+10);
    end;
    inc(x, 320);
  end;
end;

end.

