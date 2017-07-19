object frmEventos: TfrmEventos
  Left = 0
  Top = 0
  Width = 758
  Height = 475
  TabOrder = 0
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 758
    Height = 475
    Align = alClient
    DataSource = dm_nfe.dsNFe_Log
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'DATA_HORA'
        Title.Caption = 'Data e Hora'
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_EVENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Caption = 'Evento'
        Width = 550
        Visible = True
      end>
  end
end
