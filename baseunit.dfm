object basesform: Tbasesform
  Left = 427
  Top = 323
  BorderStyle = bsDialog
  Caption = #1052#1077#1085#1077#1078#1077#1088' '#1073#1072#1079#1099' '#1076#1072#1085#1085#1099#1093
  ClientHeight = 288
  ClientWidth = 428
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object baselist: TListView
    Left = 0
    Top = 0
    Width = 428
    Height = 288
    Align = alClient
    Columns = <
      item
        Caption = #1050#1086#1076
        Width = 0
      end
      item
        AutoSize = True
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1073#1072#1079#1099
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 20
    Font.Name = 'Tahoma'
    Font.Style = []
    GridLines = True
    MultiSelect = True
    ReadOnly = True
    RowSelect = True
    ParentFont = False
    TabOrder = 0
    ViewStyle = vsReport
    OnDblClick = baselistDblClick
    OnKeyDown = baselistKeyDown
  end
end
