object formFilterOper: TformFilterOper
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #1060#1080#1083#1100#1090#1088
  ClientHeight = 291
  ClientWidth = 429
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
  object Label3: TLabel
    Left = 16
    Top = 66
    Width = 97
    Height = 19
    Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 16
    Top = 112
    Width = 18
    Height = 19
    Caption = #1086#1090':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 216
    Top = 112
    Width = 19
    Height = 19
    Caption = #1076#1086':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 16
    Top = 152
    Width = 115
    Height = 19
    Caption = #1044#1072#1090#1072' '#1079#1072#1074#1077#1088#1096#1077#1085#1080#1103
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 19
    Top = 200
    Width = 15
    Height = 19
    Caption = #1086#1090
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 216
    Top = 200
    Width = 19
    Height = 19
    Caption = #1076#1086':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 16
    Top = 24
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
  object dtSozFrom: TDateTimePicker
    Left = 57
    Top = 104
    Width = 128
    Height = 27
    Date = 44701.521235000000000000
    Time = 44701.521235000000000000
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Visible = False
  end
  object cmbDateNazn: TComboBox
    Left = 176
    Top = 66
    Width = 107
    Height = 27
    Style = csDropDownList
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ItemIndex = 0
    ParentFont = False
    TabOrder = 1
    Text = #1051#1102#1073#1072#1103
    OnChange = cmbDateNaznChange
    Items.Strings = (
      #1051#1102#1073#1072#1103
      #1042#1099#1073#1088#1072#1090#1100)
  end
  object dtSozTo: TDateTimePicker
    Left = 272
    Top = 104
    Width = 129
    Height = 27
    Date = 44705.850406585650000000
    Time = 44705.850406585650000000
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Visible = False
  end
  object cmbDateOkon: TComboBox
    Left = 176
    Top = 151
    Width = 145
    Height = 27
    Style = csDropDownList
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ItemIndex = 0
    ParentFont = False
    TabOrder = 3
    Text = #1051#1102#1073#1072#1103
    OnChange = cmbDateOkonChange
    Items.Strings = (
      #1051#1102#1073#1072#1103
      #1042#1099#1073#1088#1072#1090#1100)
  end
  object dtEndFrom: TDateTimePicker
    Left = 56
    Top = 192
    Width = 129
    Height = 27
    Date = 44705.855077222220000000
    Time = 44705.855077222220000000
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Visible = False
  end
  object dtEndTo: TDateTimePicker
    Left = 272
    Top = 192
    Width = 129
    Height = 27
    Date = 44705.855375509260000000
    Time = 44705.855375509260000000
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    Visible = False
  end
  object edMaster: TEdit
    Left = 144
    Top = 21
    Width = 257
    Height = 27
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object btnApply: TButton
    Left = 56
    Top = 232
    Width = 97
    Height = 33
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = btnApplyClick
  end
  object btnClear: TButton
    Left = 248
    Top = 232
    Width = 97
    Height = 33
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = btnClearClick
  end
end
