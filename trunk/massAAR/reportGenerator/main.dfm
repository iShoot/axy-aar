object mainForm: TmainForm
  Left = 0
  Top = 0
  Caption = 'massAAR Report Generator'
  ClientHeight = 300
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    635
    300)
  PixelsPerInch = 96
  TextHeight = 13
  object generatorReport: TButton
    Left = 8
    Top = 8
    Width = 177
    Height = 25
    Caption = 'Select and Generate Report'
    TabOrder = 0
    OnClick = generatorReportClick
  end
  object logProgress: TMemo
    Left = 8
    Top = 39
    Width = 619
    Height = 253
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
  end
  object aarFileSelect: TOpenDialog
    Filter = 'Mass Raw AAR|*.raw_aar'
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Left = 400
    Top = 16
  end
end
