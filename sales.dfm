object salesform: Tsalesform
  Left = 373
  Top = 310
  BorderStyle = bsDialog
  Caption = #1056#1072#1089#1093#1086#1076' '#1090#1086#1074#1072#1088#1072
  ClientHeight = 451
  ClientWidth = 597
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 597
    Height = 93
    Align = alTop
    TabOrder = 0
    object Label4: TLabel
      Left = 18
      Top = 62
      Width = 109
      Height = 21
      Caption = #1053#1072#1082#1083'/'#1055#1088#1080#1084#1077#1095':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 18
      Top = 8
      Width = 44
      Height = 21
      Caption = #1044#1072#1090#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 18
      Top = 35
      Width = 62
      Height = 21
      Caption = #1050#1083#1080#1077#1085#1090':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object note: TEdit
      Left = 146
      Top = 62
      Width = 441
      Height = 21
      TabOrder = 0
      OnKeyDown = noteKeyDown
    end
    object date: TDateTimePicker
      Left = 146
      Top = 8
      Width = 170
      Height = 21
      Date = 40413.608579097220000000
      Time = 40413.608579097220000000
      TabOrder = 1
      OnKeyDown = dateKeyDown
    end
    object ccode: TComboBox
      Left = 536
      Top = 35
      Width = 51
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 3
      Visible = False
    end
    object cname: TComboBox
      Left = 146
      Top = 35
      Width = 441
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      OnChange = cnameChange
      OnKeyDown = cnameKeyDown
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 93
    Width = 597
    Height = 267
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object goodslist: TListView
      Left = 0
      Top = 0
      Width = 597
      Height = 267
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      Columns = <
        item
          Caption = #1050#1086#1076
          Width = 0
        end
        item
          Caption = #1050#1086#1076#1047#1072#1074#1086#1076#1072
          Width = 0
        end
        item
          AutoSize = True
          Caption = #1047#1072#1074#1086#1076
        end
        item
          Caption = #1050#1086#1076#1058#1086#1074#1072#1088#1072
          Width = 0
        end
        item
          AutoSize = True
          Caption = #1058#1086#1074#1072#1088
        end
        item
          Alignment = taRightJustify
          AutoSize = True
          Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
        end
        item
          Alignment = taRightJustify
          AutoSize = True
          Caption = #1057#1082#1080#1076#1082#1072
        end
        item
          Alignment = taRightJustify
          AutoSize = True
          Caption = #1062#1077#1085#1072
        end
        item
          Alignment = taRightJustify
          Caption = #1057#1091#1084#1084#1072
          Width = 0
        end
        item
          Alignment = taRightJustify
          Caption = 'dprice'
          Width = 0
        end
        item
          Alignment = taRightJustify
          Caption = 'dcap'
          Width = 0
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
      OnDblClick = goodslistDblClick
      OnKeyDown = goodslistKeyDown
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 360
    Width = 597
    Height = 91
    Align = alBottom
    TabOrder = 2
    object Label3: TLabel
      Left = 18
      Top = 33
      Width = 110
      Height = 21
      Caption = #1054#1073#1097#1072#1103' '#1089#1091#1084#1084#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 17
      Top = 6
      Width = 58
      Height = 21
      Caption = #1056#1072#1089#1093#1086#1076':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object save: TButton
      Left = 307
      Top = 60
      Width = 283
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object cancel: TButton
      Left = 18
      Top = 60
      Width = 283
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = cancelClick
    end
    object cap: TEdit
      Left = 149
      Top = 6
      Width = 438
      Height = 21
      ReadOnly = True
      TabOrder = 2
      Text = '0'
    end
    object summ: TEdit
      Left = 149
      Top = 33
      Width = 438
      Height = 21
      ReadOnly = True
      TabOrder = 3
      Text = '0'
    end
  end
end
