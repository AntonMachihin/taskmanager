object formNewTask: TformNewTask
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1076#1072#1095#1091
  ClientHeight = 291
  ClientWidth = 616
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 15
    Width = 68
    Height = 19
    Caption = #1047#1072#1075#1086#1083#1086#1074#1086#1082
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 48
    Width = 90
    Height = 19
    Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 86
    Width = 121
    Height = 19
    Caption = #1044#1072#1090#1072' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 20
    Top = 131
    Width = 117
    Height = 19
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1079#1072#1076#1072#1095#1080
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object edZaglav: TEdit
    Left = 143
    Top = 12
    Width = 457
    Height = 27
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object cmbMaster: TComboBox
    Left = 143
    Top = 45
    Width = 457
    Height = 27
    Style = csDropDownList
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object dtVupol: TDateTimePicker
    Left = 143
    Top = 78
    Width = 457
    Height = 27
    Date = 44704.521235000000000000
    Time = 44704.521235000000000000
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object btnOK: TButton
    Left = 94
    Top = 232
    Width = 139
    Height = 42
    Caption = #1057#1086#1079#1076#1072#1090#1100' '#1079#1072#1076#1072#1095#1091
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 368
    Top = 232
    Width = 137
    Height = 42
    Caption = #1054#1090#1084#1077#1085#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = btnCancelClick
  end
  object memTask: TMemo
    Left = 143
    Top = 111
    Width = 457
    Height = 98
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object MyConnection1: TMyConnection
    Database = 'zadanie'
    Username = 'dbuser'
    Server = 'localhost'
    Connected = True
    Left = 400
    Top = 144
    EncryptedPassword = 'CEFFCDFFCCFF'
  end
  object MyQuery1: TMyQuery
    Connection = MyConnection1
    Left = 464
    Top = 144
  end
  object MyDataSource1: TMyDataSource
    DataSet = MyQuery1
    Left = 528
    Top = 144
  end
end
