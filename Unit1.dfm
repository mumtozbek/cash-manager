object mainform: Tmainform
  Left = 267
  Top = 243
  Caption = #1056#1072#1089#1095#1077#1090' 1.0 [iMumtoz]'
  ClientHeight = 494
  ClientWidth = 803
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PrintScale = poPrintToFit
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object main: TPageControl
    Left = 0
    Top = 0
    Width = 803
    Height = 494
    ActivePage = documents
    Align = alClient
    TabOrder = 0
    TabPosition = tpBottom
    object documents: TTabSheet
      Caption = #1054#1087#1077#1088#1072#1094#1080#1080
      ImageIndex = 1
      object docpages: TPageControl
        Left = 0
        Top = 0
        Width = 795
        Height = 468
        ActivePage = cashpages
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Style = tsButtons
        TabOrder = 0
        object cashpages: TTabSheet
          Caption = #1050#1072#1089#1089#1072'-'#1087#1088#1080#1093#1086#1076
          ImageIndex = 3
          object Panel2: TPanel
            Left = 0
            Top = 0
            Width = 787
            Height = 35
            Align = alTop
            BevelInner = bvRaised
            BevelOuter = bvNone
            TabOrder = 0
            object Label3: TLabel
              Left = 13
              Top = 6
              Width = 16
              Height = 23
              Caption = #1089':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -19
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label4: TLabel
              Left = 215
              Top = 6
              Width = 28
              Height = 23
              Caption = #1087#1086':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -19
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object cdate1: TDateTimePicker
              Left = 40
              Top = 8
              Width = 170
              Height = 21
              Date = 40413.000000000000000000
              Time = 40413.000000000000000000
              TabOrder = 0
              OnKeyDown = cdate1KeyDown
            end
            object cdate2: TDateTimePicker
              Left = 251
              Top = 8
              Width = 170
              Height = 21
              Date = 40413.608579097220000000
              Time = 40413.608579097220000000
              TabOrder = 1
              OnKeyDown = cdate2KeyDown
            end
            object showinc: TButton
              Left = 427
              Top = 8
              Width = 75
              Height = 21
              Caption = #1055#1086#1082#1072#1079#1072#1090#1100
              TabOrder = 2
              OnClick = showincClick
            end
          end
          object cashinlist: TListView
            Left = 0
            Top = 35
            Width = 787
            Height = 402
            Align = alClient
            Columns = <
              item
                Caption = #1050#1086#1076
                Width = 0
              end
              item
                Caption = #1044#1072#1090#1072
                Width = 100
              end
              item
                Caption = #1050#1086#1076#1050#1083#1080#1077#1085#1090#1072
                Width = 0
              end
              item
                AutoSize = True
                Caption = #1050#1083#1080#1077#1085#1090
              end
              item
                Alignment = taRightJustify
                AutoSize = True
                Caption = #1057#1091#1084#1084#1072
              end
              item
                AutoSize = True
                Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
              end
              item
                Alignment = taRightJustify
                AutoSize = True
                Caption = #1050#1091#1088#1089
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
            TabOrder = 1
            ViewStyle = vsReport
            OnDblClick = cashinlistDblClick
            OnKeyDown = cashinlistKeyDown
          end
        end
        object cashopages: TTabSheet
          Caption = #1050#1072#1089#1089#1072'-'#1088#1072#1089#1093#1086#1076
          ImageIndex = 3
          object cashoutlist: TListView
            Left = 0
            Top = 35
            Width = 787
            Height = 402
            Align = alClient
            Columns = <
              item
                Caption = #1053#1086#1084#1077#1088
                Width = 0
              end
              item
                Caption = #1044#1072#1090#1072
                Width = 100
              end
              item
                Caption = #1050#1086#1076
                Width = 0
              end
              item
                AutoSize = True
                Caption = #1050#1083#1080#1077#1085#1090
              end
              item
                Alignment = taRightJustify
                AutoSize = True
                Caption = #1057#1091#1084#1084#1072
              end
              item
                AutoSize = True
                Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
              end
              item
                Alignment = taRightJustify
                AutoSize = True
                Caption = #1050#1091#1088#1089
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
            OnDblClick = cashoutlistDblClick
            OnKeyDown = cashoutlistKeyDown
          end
          object Panel3: TPanel
            Left = 0
            Top = 0
            Width = 787
            Height = 35
            Align = alTop
            BevelInner = bvRaised
            BevelOuter = bvNone
            TabOrder = 1
            object Label5: TLabel
              Left = 13
              Top = 6
              Width = 16
              Height = 23
              Caption = #1089':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -19
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label6: TLabel
              Left = 215
              Top = 6
              Width = 28
              Height = 23
              Caption = #1087#1086':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -19
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object odate1: TDateTimePicker
              Left = 40
              Top = 8
              Width = 170
              Height = 21
              Date = 40413.000000000000000000
              Time = 40413.000000000000000000
              TabOrder = 0
              OnKeyDown = odate1KeyDown
            end
            object odate2: TDateTimePicker
              Left = 251
              Top = 8
              Width = 170
              Height = 21
              Date = 40413.608579097220000000
              Time = 40413.608579097220000000
              TabOrder = 1
              OnKeyDown = odate2KeyDown
            end
            object showout: TButton
              Left = 427
              Top = 8
              Width = 75
              Height = 21
              Caption = #1055#1086#1082#1072#1079#1072#1090#1100
              TabOrder = 2
              OnClick = showoutClick
            end
          end
        end
      end
    end
    object infobases: TTabSheet
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      object infopages: TPageControl
        Left = 0
        Top = 0
        Width = 795
        Height = 468
        ActivePage = clientspages
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Style = tsButtons
        TabOrder = 0
        object clientspages: TTabSheet
          Caption = #1050#1083#1080#1077#1085#1090#1099
          object clientlist: TListView
            Left = 0
            Top = 0
            Width = 787
            Height = 437
            Align = alClient
            Columns = <
              item
                Caption = #1050#1086#1076
                Width = 70
              end
              item
                AutoSize = True
                Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              end
              item
                Alignment = taRightJustify
                AutoSize = True
                Caption = #1055#1088#1086#1094#1077#1085#1090
              end
              item
                Alignment = taRightJustify
                AutoSize = True
                Caption = #1053#1072#1095#1072#1083#1085#1072#1103' '#1057#1072#1083#1100#1076#1086
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
            OnDblClick = clientlistDblClick
            OnKeyDown = clientlistKeyDown
          end
        end
      end
    end
    object results: TTabSheet
      Caption = #1054#1090#1095#1105#1090#1099
      ImageIndex = 2
      object respages: TPageControl
        Left = 0
        Top = 0
        Width = 795
        Height = 468
        ActivePage = res1
        Align = alClient
        Style = tsButtons
        TabOrder = 0
        object res1: TTabSheet
          Caption = #1057#1072#1083#1100#1076#1086' '#1087#1086' '#1082#1083#1080#1077#1085#1090#1072#1084
          object res1list: TListView
            Left = 0
            Top = 35
            Width = 787
            Height = 402
            Align = alClient
            Columns = <
              item
                AutoSize = True
              end
              item
                Alignment = taRightJustify
                AutoSize = True
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
            ShowColumnHeaders = False
            TabOrder = 0
            ViewStyle = vsReport
          end
          object Panel6: TPanel
            Left = 0
            Top = 0
            Width = 787
            Height = 35
            Align = alTop
            BevelInner = bvRaised
            BevelOuter = bvNone
            TabOrder = 1
            object Label10: TLabel
              Left = 13
              Top = 5
              Width = 70
              Height = 23
              Caption = #1050#1083#1080#1077#1085#1090':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -19
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object rcname: TComboBox
              Left = 85
              Top = 8
              Width = 332
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
              OnChange = rcnameChange
            end
            object rccode: TComboBox
              Left = 423
              Top = 8
              Width = 52
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 1
              Visible = False
            end
            object rdate: TDateTimePicker
              Left = 423
              Top = 8
              Width = 170
              Height = 21
              Date = 40414.000000000000000000
              Time = 40414.000000000000000000
              TabOrder = 2
              OnKeyDown = rdateKeyDown
            end
            object showres1: TButton
              Left = 599
              Top = 8
              Width = 75
              Height = 21
              Caption = #1055#1086#1082#1072#1079#1072#1090#1100
              TabOrder = 3
              OnClick = showres1Click
            end
          end
        end
        object TabSheet2: TTabSheet
          Caption = #1054#1087#1077#1088#1072#1094#1080#1080' '#1087#1086' '#1082#1083#1080#1077#1085#1090#1072#1084
          ImageIndex = 3
          object Panel9: TPanel
            Left = 0
            Top = 0
            Width = 787
            Height = 35
            Align = alTop
            BevelInner = bvRaised
            BevelOuter = bvNone
            TabOrder = 0
            object Label14: TLabel
              Left = 13
              Top = 5
              Width = 70
              Height = 23
              Caption = #1050#1083#1080#1077#1085#1090':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -19
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label16: TLabel
              Left = 433
              Top = 6
              Width = 16
              Height = 23
              Caption = #1089':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -19
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label17: TLabel
              Left = 568
              Top = 6
              Width = 28
              Height = 23
              Caption = #1087#1086':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -19
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object res4cname: TComboBox
              Left = 85
              Top = 8
              Width = 332
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
              OnChange = res4cnameChange
            end
            object res4ccode: TComboBox
              Left = 455
              Top = 8
              Width = 52
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 1
              Visible = False
            end
            object res4date2: TDateTimePicker
              Left = 600
              Top = 8
              Width = 97
              Height = 21
              Date = 40414.000000000000000000
              Time = 40414.000000000000000000
              TabOrder = 2
              OnKeyDown = rdateKeyDown
            end
            object showres4: TButton
              Left = 703
              Top = 8
              Width = 75
              Height = 21
              Caption = #1055#1086#1082#1072#1079#1072#1090#1100
              TabOrder = 3
              OnClick = showres4Click
            end
            object res4date1: TDateTimePicker
              Left = 455
              Top = 8
              Width = 97
              Height = 21
              Date = 40414.000000000000000000
              Time = 40414.000000000000000000
              TabOrder = 4
              OnKeyDown = rdateKeyDown
            end
          end
          object res4list: TListView
            Left = 0
            Top = 35
            Width = 787
            Height = 402
            Align = alClient
            Columns = <
              item
                AutoSize = True
                Caption = #1044#1072#1090#1072
              end
              item
                AutoSize = True
                Caption = #1054#1087#1077#1088#1072#1094#1080#1103
              end
              item
                Alignment = taRightJustify
                AutoSize = True
                Caption = #1057#1091#1084#1084#1072
              end
              item
                Alignment = taRightJustify
                AutoSize = True
                Caption = '%%'
              end
              item
                Alignment = taRightJustify
                AutoSize = True
                Caption = #1055#1088#1080#1073#1099#1083
              end
              item
                Alignment = taRightJustify
                AutoSize = True
                Caption = #1064#1072#1087#1082#1072
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
            TabOrder = 1
            ViewStyle = vsReport
          end
        end
        object TabSheet1: TTabSheet
          Caption = #1041#1072#1083#1072#1085#1089
          ImageIndex = 2
          object Panel10: TPanel
            Left = 0
            Top = 0
            Width = 787
            Height = 35
            Align = alTop
            BevelInner = bvRaised
            BevelOuter = bvNone
            TabOrder = 0
            object Label15: TLabel
              Left = 13
              Top = 5
              Width = 49
              Height = 23
              Caption = #1044#1072#1090#1072':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -19
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object rcdate2: TDateTimePicker
              Left = 79
              Top = 8
              Width = 170
              Height = 21
              Date = 40414.000000000000000000
              Time = 40414.000000000000000000
              TabOrder = 0
              OnKeyDown = rdateKeyDown
            end
            object Button3: TButton
              Left = 255
              Top = 8
              Width = 75
              Height = 21
              Caption = #1055#1086#1082#1072#1079#1072#1090#1100
              TabOrder = 1
              OnClick = Button3Click
            end
          end
          object res3list: TListView
            Left = 0
            Top = 35
            Width = 787
            Height = 402
            Align = alClient
            Columns = <
              item
                AutoSize = True
                Caption = #1050#1083#1080#1077#1085#1090
              end
              item
                Alignment = taRightJustify
                AutoSize = True
                Caption = #1057#1072#1083#1100#1076#1086
              end
              item
                AutoSize = True
                Caption = #1044#1086#1083#1075
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
            TabOrder = 1
            ViewStyle = vsReport
          end
        end
      end
    end
  end
  object manifest: TXPManifest
    Left = 680
    Top = 472
  end
  object query: TQuery
    Left = 648
    Top = 472
  end
  object update: TUpdateSQL
    Left = 616
    Top = 472
  end
end
