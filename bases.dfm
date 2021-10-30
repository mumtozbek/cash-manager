object baseform: Tbaseform
  Left = 320
  Top = 418
  Caption = #1041#1072#1079#1099' '#1076#1072#1085#1085#1099#1093
  ClientHeight = 147
  ClientWidth = 586
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 8
    Top = 8
    Width = 81
    Height = 21
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 62
    Width = 117
    Height = 21
    Caption = #1053#1086#1074#1099#1081' '#1087#1072#1088#1086#1083#1100':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 8
    Top = 89
    Width = 148
    Height = 21
    Caption = #1055#1086#1074#1090#1086#1088#1080#1090#1077' '#1087#1072#1088#1086#1083#1100':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 35
    Width = 134
    Height = 21
    Caption = #1058#1077#1082#1091#1097#1080#1081' '#1087#1072#1088#1086#1083#1100':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object bname: TEdit
    Left = 162
    Top = 8
    Width = 415
    Height = 21
    TabOrder = 0
    OnKeyDown = bnameKeyDown
  end
  object save: TButton
    Left = 294
    Top = 116
    Width = 283
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = saveClick
  end
  object cancel: TButton
    Left = 8
    Top = 116
    Width = 283
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = cancelClick
  end
  object pass1: TEdit
    Left = 162
    Top = 62
    Width = 415
    Height = 21
    PasswordChar = '*'
    TabOrder = 3
    OnKeyDown = pass1KeyDown
    OnKeyPress = pass1KeyPress
  end
  object pass2: TEdit
    Left = 162
    Top = 89
    Width = 415
    Height = 21
    PasswordChar = '*'
    TabOrder = 4
    OnKeyDown = pass2KeyDown
    OnKeyPress = pass1KeyPress
  end
  object pass: TEdit
    Left = 162
    Top = 35
    Width = 415
    Height = 21
    Enabled = False
    PasswordChar = '*'
    TabOrder = 5
    OnKeyDown = pass1KeyDown
    OnKeyPress = pass1KeyPress
  end
end
