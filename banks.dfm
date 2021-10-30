object banksform: Tbanksform
  Left = 373
  Top = 418
  BorderStyle = bsDialog
  Caption = #1041#1072#1085#1082#1086#1074#1089#1082#1072#1103' '#1086#1087#1077#1088#1072#1094#1080#1103
  ClientHeight = 200
  ClientWidth = 595
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
  object Label3: TLabel
    Left = 18
    Top = 62
    Width = 96
    Height = 21
    Caption = #1057#1091#1084#1084#1072'/%%:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 18
    Top = 89
    Width = 103
    Height = 21
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
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
  object Label1: TLabel
    Left = 18
    Top = 116
    Width = 58
    Height = 21
    Caption = #1060#1080#1088#1084#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 18
    Top = 143
    Width = 96
    Height = 21
    Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object summ: TEdit
    Left = 146
    Top = 62
    Width = 312
    Height = 21
    TabOrder = 0
    Text = '0'
    OnChange = summChange
    OnKeyDown = summKeyDown
    OnKeyPress = summKeyPress
  end
  object note: TEdit
    Left = 146
    Top = 89
    Width = 441
    Height = 21
    TabOrder = 1
    OnKeyDown = noteKeyDown
  end
  object save: TButton
    Left = 304
    Top = 170
    Width = 283
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object cancel: TButton
    Left = 18
    Top = 170
    Width = 283
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 3
    OnClick = cancelClick
  end
  object date: TDateTimePicker
    Left = 146
    Top = 8
    Width = 170
    Height = 21
    Date = 40413.608579097220000000
    Time = 40413.608579097220000000
    TabOrder = 4
    OnKeyDown = dateKeyDown
  end
  object ccode: TComboBox
    Left = 536
    Top = 35
    Width = 51
    Height = 21
    Style = csDropDownList
    ItemHeight = 0
    TabOrder = 6
    Visible = False
  end
  object fcode: TComboBox
    Left = 536
    Top = 116
    Width = 51
    Height = 21
    Style = csDropDownList
    ItemHeight = 0
    TabOrder = 8
  end
  object perc: TEdit
    Left = 464
    Top = 62
    Width = 123
    Height = 21
    MaxLength = 3
    OEMConvert = True
    TabOrder = 10
    Text = '100'
    OnChange = percChange
    OnKeyDown = percKeyDown
    OnKeyPress = summKeyPress
  end
  object rcode: TComboBox
    Left = 536
    Top = 143
    Width = 51
    Height = 21
    Style = csDropDownList
    ItemHeight = 0
    TabOrder = 11
    Visible = False
  end
  object cname: TComboBox
    Left = 146
    Top = 35
    Width = 441
    Height = 21
    Style = csDropDownList
    ItemHeight = 0
    TabOrder = 5
    OnChange = cnameChange
    OnKeyDown = cnameKeyDown
  end
  object fname: TComboBox
    Left = 146
    Top = 116
    Width = 441
    Height = 21
    Style = csDropDownList
    ItemHeight = 0
    TabOrder = 7
    OnChange = fnameChange
    OnKeyDown = fnameKeyDown
  end
  object rname: TComboBox
    Left = 146
    Top = 143
    Width = 441
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 9
    OnChange = rnameChange
    OnKeyDown = rnameKeyDown
    Items.Strings = (
      #1055#1088#1080#1093#1086#1076
      #1056#1072#1089#1093#1086#1076)
  end
end
