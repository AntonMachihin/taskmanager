object formOper: TformOper
  Left = 0
  Top = 0
  Caption = #1052#1086#1080' '#1079#1072#1076#1072#1095#1080
  ClientHeight = 516
  ClientWidth = 748
  Color = clBtnFace
  Constraints.MinHeight = 300
  Constraints.MinWidth = 600
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 71
    Width = 597
    Height = 19
    Caption = 
      #1044#1083#1103' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1103' '#1079#1072#1076#1072#1095#1080' '#1085#1072#1078#1084#1080#1090#1077' '#1085#1072' '#1103#1095#1077#1081#1082#1091' '#1080#1079' '#1089#1090#1088#1086#1082#1080', '#1089#1086#1086#1090#1074#1077#1090#1089#1090 +
      #1074#1091#1102#1097#1077#1081' '#1101#1090#1086#1081' '#1079#1072#1076#1072#1095#1077
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 24
    Top = 112
    Width = 705
    Height = 385
    DataSource = MyDataSource1
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -16
    TitleFont.Name = 'Times New Roman'
    TitleFont.Style = [fsBold]
    OnCellClick = DBGrid1CellClick
    OnDrawDataCell = DBGrid1DrawDataCell
  end
  object btnAddTask: TButton
    Left = 159
    Top = 16
    Width = 129
    Height = 36
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1076#1072#1095#1091
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Visible = False
    OnClick = btnAddTaskClick
  end
  object btnFilter: TButton
    Left = 294
    Top = 16
    Width = 129
    Height = 35
    Caption = #1060#1080#1083#1100#1090#1088
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnFilterClick
  end
  object btnExport: TButton
    Left = 429
    Top = 16
    Width = 129
    Height = 36
    Caption = #1069#1082#1089#1087#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnExportClick
  end
  object btnRefresh: TButton
    Left = 24
    Top = 16
    Width = 129
    Height = 36
    Caption = #1054#1073#1085#1086#1074#1080#1090#1100
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = btnRefreshClick
  end
  object MyConnection1: TMyConnection
    Database = 'zadanie'
    Username = 'dbuser'
    Server = 'localhost'
    Left = 544
    Top = 424
    EncryptedPassword = 'CEFFCDFFCCFF'
  end
  object MyQuery1: TMyQuery
    Connection = MyConnection1
    Left = 600
    Top = 424
  end
  object MyDataSource1: TMyDataSource
    DataSet = MyQuery1
    Left = 656
    Top = 424
  end
end
