object loginform: Tloginform
  Left = 453
  Top = 431
  BorderStyle = bsDialog
  Caption = #1042#1093#1086#1076' '#1074' '#1089#1080#1089#1090#1077#1084#1091
  ClientHeight = 92
  ClientWidth = 341
  Color = clBtnFace
  ParentFont = True
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  Position = poDesigned
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 114
    Height = 19
    Caption = #1041#1072#1079#1072' '#1076#1072#1085#1085#1099#1093':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 33
    Width = 67
    Height = 19
    Caption = #1055#1072#1088#1086#1083#1100':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object code: TComboBox
    Left = 281
    Top = 8
    Width = 53
    Height = 21
    Style = csDropDownList
    TabOrder = 1
    Visible = False
  end
  object bbase: TComboBox
    Left = 137
    Top = 8
    Width = 197
    Height = 21
    Style = csDropDownList
    TabOrder = 0
    OnChange = bbaseChange
  end
  object pass: TEdit
    Left = 137
    Top = 35
    Width = 197
    Height = 21
    PasswordChar = '*'
    TabOrder = 2
  end
  object OKBtn: TButton
    Left = 137
    Top = 62
    Width = 97
    Height = 25
    Caption = #1042#1086#1081#1090#1080
    Default = True
    ModalResult = 1
    TabOrder = 3
    OnClick = OKBtnClick
  end
  object CancelBtn: TButton
    Left = 240
    Top = 62
    Width = 94
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 4
    OnClick = CancelBtnClick
  end
  object createbtn: TButton
    Left = 8
    Top = 62
    Width = 123
    Height = 25
    Caption = #1052#1077#1085#1077#1078#1077#1088' '#1073#1072#1079#1099
    Default = True
    ModalResult = 1
    TabOrder = 5
    OnClick = createbtnClick
  end
end
