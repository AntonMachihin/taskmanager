object FormLogin: TFormLogin
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #1042#1086#1081#1090#1080' '#1074' '#1089#1080#1089#1090#1077#1084#1091
  ClientHeight = 174
  ClientWidth = 281
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbName: TLabel
    Left = 24
    Top = 24
    Width = 43
    Height = 19
    Caption = #1051#1086#1075#1080#1085
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object lblPassword: TLabel
    Left = 24
    Top = 72
    Width = 49
    Height = 19
    Caption = #1055#1072#1088#1086#1083#1100
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object btnLogin: TButton
    Left = 40
    Top = 111
    Width = 89
    Height = 33
    Caption = #1042#1086#1081#1090#1080
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btnLoginClick
  end
  object btnCancel: TButton
    Left = 154
    Top = 111
    Width = 89
    Height = 33
    Caption = #1054#1090#1084#1077#1085#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnCancelClick
  end
  object edName: TEdit
    Left = 88
    Top = 21
    Width = 163
    Height = 27
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object edPassword: TEdit
    Left = 88
    Top = 69
    Width = 163
    Height = 27
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object MyConnection1: TMyConnection
    Database = 'zadanie'
    Username = 'dbuser'
    Server = 'localhost'
    Connected = True
    Left = 216
    EncryptedPassword = 'CEFFCDFFCCFF'
  end
  object MyQuery1: TMyQuery
    Connection = MyConnection1
    Left = 168
  end
end
