object formRedTask: TformRedTask
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1079#1072#1076#1072#1095#1080
  ClientHeight = 501
  ClientWidth = 669
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 16
    Top = 21
    Width = 74
    Height = 19
    Caption = #1050#1086#1076' '#1079#1072#1076#1072#1095#1080
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 16
    Top = 154
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
  object Label3: TLabel
    Left = 16
    Top = 118
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
  object lbDes: TLabel
    Left = 16
    Top = 86
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
  object Label1: TLabel
    Left = 16
    Top = 54
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
  object Label6: TLabel
    Left = 16
    Top = 258
    Width = 94
    Height = 19
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 16
    Top = 361
    Width = 104
    Height = 19
    Caption = #1058#1077#1082#1091#1097#1080#1081' '#1089#1090#1072#1090#1091#1089
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object memTask: TMemo
    Left = 160
    Top = 151
    Width = 490
    Height = 90
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object edID: TEdit
    Left = 160
    Top = 18
    Width = 121
    Height = 27
    Enabled = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object btnCancel: TButton
    Left = 520
    Top = 448
    Width = 130
    Height = 34
    Caption = #1054#1090#1084#1077#1085#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnCancelClick
  end
  object btnOK: TButton
    Left = 344
    Top = 399
    Width = 202
    Height = 34
    Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1077
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnOKClick
  end
  object edZaglav: TEdit
    Left = 160
    Top = 51
    Width = 490
    Height = 27
    Enabled = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object edMaster: TEdit
    Left = 160
    Top = 85
    Width = 490
    Height = 27
    Enabled = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object dtVupol: TDateTimePicker
    Left = 160
    Top = 118
    Width = 490
    Height = 27
    Date = 44704.521235000000000000
    Time = 44704.521235000000000000
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object memComment: TMemo
    Left = 160
    Top = 255
    Width = 490
    Height = 89
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object btnResend: TButton
    Left = 120
    Top = 399
    Width = 177
    Height = 34
    Caption = #1053#1072#1087#1088#1072#1074#1080#1090#1100' '#1079#1072#1085#1086#1074#1086
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = btnResendClick
  end
  object edStatus: TEdit
    Left = 160
    Top = 358
    Width = 490
    Height = 27
    Enabled = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
  end
  object btnAccept: TButton
    Left = 8
    Top = 399
    Width = 177
    Height = 33
    Caption = #1055#1088#1080#1085#1103#1090#1100' '#1074' '#1088#1072#1073#1086#1090#1091
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    OnClick = btnAcceptClick
  end
  object btnReject: TButton
    Left = 208
    Top = 400
    Width = 218
    Height = 33
    Caption = #1054#1090#1082#1083#1086#1085#1080#1090#1100' '#1089' '#1082#1086#1084#1084#1077#1085#1090#1072#1088#1080#1077#1084
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
    OnClick = btnRejectClick
  end
  object btnComplete: TButton
    Left = 448
    Top = 400
    Width = 202
    Height = 33
    Caption = #1057#1086#1086#1073#1097#1080#1090#1100' '#1086' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1080
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 12
    OnClick = btnCompleteClick
  end
  object MyDataSource1: TMyDataSource
    DataSet = MyQuery1
    Left = 616
    Top = 16
  end
  object MyQuery1: TMyQuery
    Connection = MyConnection1
    Left = 568
    Top = 16
  end
  object MyConnection1: TMyConnection
    Database = 'zadanie'
    Username = 'dbuser'
    Server = 'localhost'
    Connected = True
    Left = 512
    Top = 16
    EncryptedPassword = 'CEFFCDFFCCFF'
  end
end
