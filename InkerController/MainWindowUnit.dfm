object MainWindow: TMainWindow
  Left = 0
  Top = 0
  Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1082#1088#1072#1089#1082#1086#1086#1090#1084#1077#1090#1095#1080#1082#1086#1084
  ClientHeight = 484
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox4: TGroupBox
    Left = 8
    Top = 71
    Width = 423
    Height = 170
    Caption = #1056#1072#1089#1095#1105#1090#1085#1099#1077' '#1076#1072#1085#1085#1099#1077' '
    TabOrder = 3
    object lblFrontSpeed: TLabel
      Left = 11
      Top = 16
      Width = 48
      Height = 13
      Caption = #1057#1082#1086#1088#1086#1089#1090#1100
    end
    object lblRearSpeed: TLabel
      Left = 11
      Top = 35
      Width = 48
      Height = 13
      Caption = #1057#1082#1086#1088#1086#1089#1090#1100
    end
    object lblAvgSpeed: TLabel
      Left = 11
      Top = 54
      Width = 48
      Height = 13
      Caption = #1057#1082#1086#1088#1086#1089#1090#1100
    end
    object lblDelay1: TLabel
      Left = 11
      Top = 73
      Width = 110
      Height = 13
      Caption = #1047#1072#1076#1077#1088#1078#1082#1072' 1-'#1075#1086' '#1082#1088'-'#1082#1072':'
    end
    object lblDelay2: TLabel
      Left = 11
      Top = 92
      Width = 110
      Height = 13
      Caption = #1047#1072#1076#1077#1088#1078#1082#1072' 2-'#1075#1086' '#1082#1088'-'#1082#1072':'
    end
    object lblDelay3: TLabel
      Left = 11
      Top = 111
      Width = 110
      Height = 13
      Caption = #1047#1072#1076#1077#1088#1078#1082#1072' 3-'#1075#1086' '#1082#1088'-'#1082#1072':'
    end
    object lblDelay4: TLabel
      Left = 11
      Top = 130
      Width = 110
      Height = 13
      Caption = #1047#1072#1076#1077#1088#1078#1082#1072' 4-'#1075#1086' '#1082#1088'-'#1082#1072':'
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 7
    Width = 137
    Height = 58
    Caption = #1060#1086#1090#1086#1076#1072#1090#1095#1080#1082#1080' '
    TabOrder = 0
    object Indicator1: TIndicator
      Left = 11
      Top = 17
      Width = 17
      Height = 25
      Brush.Color = clGray
      Shape = stCircle
    end
    object Indicator2: TIndicator
      Left = 34
      Top = 17
      Width = 17
      Height = 25
      Brush.Color = clGray
      Shape = stCircle
    end
    object Indicator3: TIndicator
      Left = 57
      Top = 17
      Width = 17
      Height = 25
      Brush.Color = clGray
      Shape = stCircle
    end
    object Indicator4: TIndicator
      Left = 80
      Top = 17
      Width = 17
      Height = 25
      Brush.Color = clGray
      Shape = stCircle
    end
  end
  object GroupBox2: TGroupBox
    Left = 151
    Top = 7
    Width = 137
    Height = 58
    Caption = #1057#1088#1072#1073#1086#1090#1082#1080' '#1076#1077#1092#1077#1082#1090#1086#1074
    TabOrder = 1
    object Indicator5: TIndicator
      Left = 24
      Top = 17
      Width = 17
      Height = 25
      Brush.Color = clGray
      Shape = stCircle
    end
    object Indicator6: TIndicator
      Left = 47
      Top = 17
      Width = 17
      Height = 25
      Brush.Color = clGray
      Shape = stCircle
    end
    object Indicator7: TIndicator
      Left = 72
      Top = 17
      Width = 17
      Height = 25
      Brush.Color = clGray
      Shape = stCircle
    end
    object Indicator8: TIndicator
      Left = 95
      Top = 17
      Width = 17
      Height = 25
      Brush.Color = clGray
      Shape = stCircle
    end
  end
  object GroupBox3: TGroupBox
    Left = 294
    Top = 7
    Width = 137
    Height = 58
    Caption = #1042#1099#1093#1086#1076' '#1085#1072' '#1082#1088'-'#1082#1080
    TabOrder = 2
    object Indicator10: TIndicator
      Left = 42
      Top = 17
      Width = 17
      Height = 25
      Brush.Color = clGray
      Shape = stCircle
    end
    object Indicator11: TIndicator
      Left = 65
      Top = 17
      Width = 17
      Height = 25
      Brush.Color = clGray
      Shape = stCircle
    end
    object Indicator12: TIndicator
      Left = 88
      Top = 17
      Width = 17
      Height = 25
      Brush.Color = clGray
      Shape = stCircle
    end
    object Indicator9: TIndicator
      Left = 19
      Top = 17
      Width = 17
      Height = 25
      Brush.Color = clGray
      Shape = stCircle
    end
  end
  object GroupBox5: TGroupBox
    Left = 8
    Top = 247
    Width = 423
    Height = 194
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '
    TabOrder = 4
    object lblBoardAdress: TLabel
      Left = 11
      Top = 22
      Width = 70
      Height = 13
      Caption = #1040#1076#1088#1077#1089' '#1087#1083#1072#1090#1099':'
    end
    object lblDistanceDetectors1: TLabel
      Left = 11
      Top = 41
      Width = 220
      Height = 13
      Caption = #1044#1080#1089#1090#1072#1085#1094#1080#1103' '#1084#1077#1078#1076#1091' 1-'#1084' '#1080' 2-'#1084' '#1092#1086#1090#1086#1076#1072#1090#1095#1080#1082#1086#1084':'
    end
    object lblDistanceDetectors2: TLabel
      Left = 11
      Top = 60
      Width = 220
      Height = 13
      Caption = #1044#1080#1089#1090#1072#1085#1094#1080#1103' '#1084#1077#1078#1076#1091' 2-'#1084' '#1080' 3-'#1084' '#1092#1086#1090#1086#1076#1072#1090#1095#1080#1082#1086#1084':'
    end
    object lblDistanceDetectors3: TLabel
      Left = 11
      Top = 79
      Width = 220
      Height = 13
      Caption = #1044#1080#1089#1090#1072#1085#1094#1080#1103' '#1084#1077#1078#1076#1091' 3-'#1084' '#1080' 4-'#1084' '#1092#1086#1090#1086#1076#1072#1090#1095#1080#1082#1086#1084':'
    end
    object lblInkerDistance1: TLabel
      Left = 11
      Top = 98
      Width = 194
      Height = 13
      Caption = #1056#1072#1089#1089#1090#1086#1103#1085#1080#1077' '#1076#1086' 1-'#1075#1086' '#1082#1088#1072#1089#1082#1086#1086#1090#1084#1077#1090#1095#1080#1082#1072':'
    end
    object lblInkerDistance2: TLabel
      Left = 11
      Top = 117
      Width = 194
      Height = 13
      Caption = #1056#1072#1089#1089#1090#1086#1103#1085#1080#1077' '#1076#1086' 2-'#1075#1086' '#1082#1088#1072#1089#1082#1086#1086#1090#1084#1077#1090#1095#1080#1082#1072':'
    end
    object lblInkerDistance3: TLabel
      Left = 11
      Top = 136
      Width = 194
      Height = 13
      Caption = #1056#1072#1089#1089#1090#1086#1103#1085#1080#1077' '#1076#1086' 3-'#1075#1086' '#1082#1088#1072#1089#1082#1086#1086#1090#1084#1077#1090#1095#1080#1082#1072':'
    end
    object lblInkerDistance4: TLabel
      Left = 11
      Top = 155
      Width = 194
      Height = 13
      Caption = #1056#1072#1089#1089#1090#1086#1103#1085#1080#1077' '#1076#1086' 4-'#1075#1086' '#1082#1088#1072#1089#1082#1086#1086#1090#1084#1077#1090#1095#1080#1082#1072':'
    end
  end
end
