object frmeInutiliza: TfrmeInutiliza
  Left = 0
  Top = 0
  Width = 640
  Height = 328
  TabOrder = 0
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 640
    Height = 257
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 9
      Top = 40
      Width = 68
      Height = 13
      Caption = 'N'#250'mero da NF'
      FocusControl = dbedtNuNf
    end
    object Label2: TLabel
      Left = 104
      Top = 40
      Width = 60
      Height = 13
      Caption = 'Ano da Nota'
      FocusControl = dbedtAno
    end
    object Label3: TLabel
      Left = 170
      Top = 40
      Width = 34
      Height = 13
      Caption = 'Modelo'
      FocusControl = dbedtModelo
    end
    object Label4: TLabel
      Left = 210
      Top = 40
      Width = 24
      Height = 13
      Caption = 'S'#233'rie'
      FocusControl = dbedtSerie
    end
    object Label5: TLabel
      Left = 9
      Top = 83
      Width = 127
      Height = 13
      Caption = 'Justificativa da Inutliza'#231#227'o'
    end
    object Label6: TLabel
      Left = 9
      Top = 2
      Width = 25
      Height = 13
      Caption = 'CNPJ'
    end
    object dbedtNuNf: TDBEdit
      Left = 9
      Top = 56
      Width = 89
      Height = 21
      Hint = 'N'#250'mero da nota para inutiliza'#231#227'o'
      DataField = 'NU_NF'
      DataSource = dsInutilizaTmp
      MaxLength = 9
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object dbedtAno: TDBEdit
      Left = 104
      Top = 56
      Width = 60
      Height = 21
      DataField = 'ANO'
      DataSource = dsInutilizaTmp
      MaxLength = 4
      TabOrder = 1
    end
    object dbedtModelo: TDBEdit
      Left = 170
      Top = 56
      Width = 34
      Height = 21
      DataField = 'MODELO'
      DataSource = dsInutilizaTmp
      MaxLength = 2
      TabOrder = 2
    end
    object dbedtSerie: TDBEdit
      Left = 210
      Top = 56
      Width = 48
      Height = 21
      DataField = 'SERIE'
      DataSource = dsInutilizaTmp
      MaxLength = 3
      TabOrder = 3
    end
    object dbmmJustifica: TDBMemo
      Left = 9
      Top = 102
      Width = 249
      Height = 99
      DataField = 'JUSTIFICATIVA'
      DataSource = dsInutilizaTmp
      MaxLength = 255
      TabOrder = 4
      OnChange = dbmmJustificaChange
    end
    object GroupBox1: TGroupBox
      Left = 264
      Top = 1
      Width = 375
      Height = 255
      Align = alRight
      Caption = ' Nota para inutiliza'#231#227'o '
      TabOrder = 5
      object DBGrid1: TDBGrid
        Left = 2
        Top = 15
        Width = 371
        Height = 238
        Align = alClient
        DataSource = dsInutilizaTmp
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NU_NF'
            Title.Caption = 'Nota '
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SERIE'
            Title.Caption = 'S'#233'rie'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ANO'
            Title.Caption = 'Ano'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MODELO'
            Title.Caption = 'Modelo'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'JUSTIFICATIVA'
            Title.Caption = 'Justificativa'
            Width = 141
            Visible = True
          end>
      end
    end
    object Panel2: TPanel
      Left = 9
      Top = 208
      Width = 249
      Height = 42
      BevelKind = bkFlat
      BevelOuter = bvNone
      TabOrder = 6
      object btnIncluir: TSpeedButton
        Left = 3
        Top = 3
        Width = 32
        Height = 32
        Cursor = crHandPoint
        Hint = 'Incluir'
        Enabled = False
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF015603FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF015603015603FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0156030258
          04FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF025804056A0B025704FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF025A040D7919025904FF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF025A041C9932036307FF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF005001005001FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF01590428B0
          470D7818015303FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF01560305
          6209005001FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF0158042FBD541FA139025704FF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FF015503037909056209005001FF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF01550328AD4735CA5F0D7618015303FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF00510122A03C037909056209005001FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF01530316892742E27627AF4505
          620A015503FF00FFFF00FFFF00FFFF00FFFF00FF0050011F9C37068F0F037909
          056209005101FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0A6E
          133BD1683CD76A27B144096D11036006015603015202005102005101004F011C
          9934089612058E0D037208086A0F005001FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF0154031C983341DC7238D3642DBF4F18952C0A74130A7D130A7B
          140F831B16952807790E0A961406900E058E0D0379090C7417005001FF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF01550328AC463CD86A36D05F2DC452
          27BC4822B63E1CAF3518A92D13A3270F9D1F0B9617079010058C0D058F0D047D
          0A178C2A015503FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF01540321
          A13B35CC5F35D05E2CC44F25BB431FB43B1CAD3316A62A12A0220D991B099313
          068E0E058C0D06910D047A0A015503FF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FF01540311812023AA402CC14E2CC64F25BD441FB43919AB2F14
          A4260F9D1F0C9717079111058F0D138323015302FF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0156030153030F7E1C1692291A9F
          2F1BA5311AAA3118AA2D119F220E9A1C0A96150D7818005001FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          015603015403015303015503025C0513982315A728109F1F076A0E005001FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF025703108B1D16A72B035F07
          005202FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0259040E
          841B025B05015303FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FF015703015603015603FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF015603015603FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = btnIncluirClick
      end
      object btnCancelar: TSpeedButton
        Left = 37
        Top = 3
        Width = 32
        Height = 32
        Cursor = crHandPoint
        Hint = 'Cancelar'
        Flat = True
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FF00006E00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FF00006E00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF00006E0018EB0008CA00006EFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF00006E0002DA0004E300006EFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF00006E001EEB0019EB0018EB0007C900006EFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF00006E0001D70008EB0008EB0006E80000
          6EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E0014D9001EEB0019EB00
          19EB0008C800006EFF00FFFF00FFFF00FFFF00FF00006E0002D60008EB0006EB
          0008EB0000CC00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000
          6E0014D7001FEB001AEB0019EB0009CC00006EFF00FFFF00FF00006E0004E000
          09EB0008EB0008EB0000C800006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF00006E0014D60020EB001BEB001BEB000ED600006E0000
          6E0004E20007EB0006EB0009EB0000C900006EFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E0016D70021EB001DEB
          001CEB000EDF0008E80008EB0006EB0008EB0001D900006EFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
          006E0016D60021EB0019EB0012EB000FEB000BEB000AEB0002D700006EFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF00006E0019DE001AEB0016EB0013EB0011EB0008D700
          006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E0020E7001FEB001BEB0018
          EB0017EB0011D700006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E032AE70128EB
          0023EB0021EB0020EB001FEB0021EB0013D600006EFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E04
          28DC0831EB042CEB022CEB001AD90019D90026EB0021EB0021EB0014D700006E
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FF00006E092FE00C37EB0A32EB0A36EB0121D700006E00006E001AD60028EB00
          23EB0023EB0014D600006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF00006E0E36E0113EEB0E38EB0E3AEB0220CC00006EFF00FFFF00
          FF00006E0015CC0129EB0024EB0024EB0016D700006EFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF00006E143FE61543EB133EEB1340EB031FC800006E
          FF00FFFF00FFFF00FFFF00FF00006E0014C8022BEB0024EB0025EB0019DB0000
          6EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E1947E81947EB1846EB06
          23C900006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E0015C9022CEB
          012AEB001BDB00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000
          6E1842E20A28C900006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FF00006E0018CD0020D900006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF00006E00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF00006E00006EFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        ParentShowHint = False
        ShowHint = True
        OnClick = btnCancelarClick
      end
      object btnItulizar: TSpeedButton
        Left = 211
        Top = 3
        Width = 32
        Height = 32
        Cursor = crHandPoint
        Hint = 'Inulizar Numera'#231#227'o'
        Enabled = False
        Flat = True
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF811E00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF811E00811E00FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          811E00811E00811E00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF811E00913F0C811E00811E00FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF811E0092410D92410D81
          1E00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FF811E0093410E9A4E16954111811E00FF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF811E009E521FAA6834AC6B3A9C491F811E00FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF811E00AB6839BB8658
          C18F64BD875E99441E811E00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FF811E00BA7F57CEA481D3AD8ED8B79AC69375811E00FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF811E00B77754E0C5ACE5CFBBEAD9C9F0E3D8C1
          896D811E00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF811E00C18A6CF2E6
          DCF7F0EAFBF8F6FCF8F6F3E2D7B26B48811E00FF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF811E00CB9C83FCF7F3FAF0E7F7E9DAF4E1CFF2DAC2D9AB8A811E00FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF811E00D1A187F7E6D7F3DECAF2D8BFEFD0B2811E00
          811E00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF811E00D8AD96F6E3D3F3DCC6F0D5BBEECEAFE3
          BA968E2E0AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF811E00EFD3B7EDCB
          ABEAC4A0E7BD95E5B68ADCA474811E00FF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF811E00E7BB91E5B487E2AC7BE0A572DD9F67DA985D811E00FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF811E00DEA36DDC9D64D9965AD78F50D48947
          D1823E811E00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF811E00D08447D3
          8744D0803BCE7932CC742CCB7228811E00FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FF811E00811E00811E00811E00811E00811E00811E00811E00FF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        ParentShowHint = False
        ShowHint = True
        OnClick = btnItulizarClick
      end
    end
    object edtCnpj: TDBEdit
      Left = 9
      Top = 16
      Width = 155
      Height = 21
      Hint = 'N'#250'mero da nota para inutiliza'#231#227'o'
      DataField = 'Cnpj'
      DataSource = dsInutilizaTmp
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
    end
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 257
    Width = 640
    Height = 15
    Align = alTop
    TabOrder = 1
  end
  object pnlButton: TPanel
    Left = 0
    Top = 278
    Width = 640
    Height = 50
    Align = alBottom
    TabOrder = 2
    Visible = False
    object btnsair: TSpeedButton
      Left = 592
      Top = 5
      Width = 43
      Height = 41
      Cursor = crHandPoint
      Hint = 'Inulizar Numera'#231#227'o'
      Glyph.Data = {
        360C0000424D360C000000000000360000002800000020000000200000000100
        180000000000000C000001000000010000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000090F14365A78426F934B7CA469A6DA0000000000005C5C5C
        5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5D5C5A5D5B595C5A5A5A5A5A5A5A5B5A5A
        5B5A5A5B5A5A5B5A5A5B5A5A5B5A5A5B5A5A5B5A5A5B5A5A5B5A5A5A5C595757
        6570536E834E7B9F4C7FAA4C7FA94B7EA85081A867A4D8000000000000000000
        000000000000000000000000000000000000386CA1706B666D6B696D6B6A6D6B
        6A6D6B6A6D6B6A6D6B6A6D6B6A6D6B6A6D6B6A6D6B6A6D6B6A6D6A686F68644A
        86B54C83AE4D82AC4D81AA4D81AA4C80A95786AC66A3D6000000000000000000
        0000000000000000000000000000000000003C6B9C6D67616A67656967666967
        666967666967666967666967666967666967666967666967666A67656C645F4B
        85B44E83AE4E82AC4E82AC4E82AC4C80AB5B8BB164A1D3000000000000000000
        0000000000000000000000000000000000003D6B9C6B66606866646766656766
        6567666567666567666567666567666567666567666567666567666469635D4B
        86B64E83AF4E83AE4E83AE4E83AE4C81AD628FB3629FD2000000000000000000
        0000000000000000000000000000000000003F6D9D6A635E6764626664636664
        6366646366646366646366646366646366646366646366646366646269615B4D
        87B74F84B04F84AF4F84AF4F84AF4D82AD6694B8619DCF000000000000000000
        0000000000000000000000000000000000003F6E9E67615B6462606462616462
        6164626164626164626164626164626164626164626164626164615F665E594E
        8AB95087B25086B15086B15086B14D84AF6C99BA609CCE000000000000000000
        000000000000000000000000000000000000416EA1655F5A62615F6261606261
        6062616062616062616062616062616062616062616062616062605F645D574F
        8BBC5188B55187B35187B35187B34E85B1729CBF5E9ACC000000000000000000
        000000000000000000008E4D007B40000000466CA5655D59615F5D615F5E615F
        5E615F5E615F5E615F5E615F5E615F5E615F5E615F5E615F5E615E5C635B5550
        8CBD5289B65288B45288B45288B44F86B378A1C35C98CA000000000000000000
        000000000000000000008B4B00C885007036496AA8655A57605C5B5F5D5C5F5D
        5C5F5D5C5F5D5C5F5D5C5F5D5C5F5D5C5F5D5C5F5D5C5F5D5C5F5C5A60585352
        8EBF538AB85389B65389B65389B64D82AD7CA5C65B96C8000000000000000000
        00000000000000000000884800E5A600C27D157E6867535860595B5D5B5B5D5B
        5B5D5B5B5D5B5B5D5B5B5D5B5B5D5B5B5D5B5B5D5B5B5D5B5B5D5A595E565153
        90C1548CB9548BB7548BB7548BB7497BA282AACA5A95C5000000000000008B4B
        008A4900884700874600834200DCA100DCA000C07E1F764B6453575E58595B5A
        595B5A595B5A595B5A595B5A595B5A595B5A595B5A595B5A595B59575C554F54
        91C3558DBB558CB9568BB8578AB745709687ADCD5892C4000000000000008948
        39E8BE00DAA100D9A100D8A000D39C00D39C00D79F00BE801F754A6151555B56
        5759585759585759585759585759585759585759585759585759575559524C56
        93C4568EBC568DBA588BB73AA8DF23B8F78EB1CF5791C1000000000000008745
        52E5C300CF9A00CF9B00CF9B00CD9A00CD9A00CF9B00D39F00BC811C794D5D52
        5659555658565658565658565658565658565658565658565658555458504B57
        95C75790BE588FBB5A8CB827B8F55482AE92B4D25590BE000000000000008744
        6DE6CD00C89700C89800C99900C99900C99A00C99906CEA128DFB60093475D50
        53575454565554565554565554565554565554565554565554565452564F4958
        96C95891C05990BD5C8DBA27BAF74F7BA497B8D7558EBD000000000000008744
        87E9D800C39700C39800C39800C49800C59900C69A60E1C700B78119774B594F
        53555353545353545353545353545353545353545353545353545251534D4859
        97CA5992C15A91BE5C8EBC27B9F74A72999DBDD9538CBB000000000000008946
        9DF0E64EE9D451E9D44DE7D194E6D700C0975EDDC600B47F1A75475B4A4F554F
        5153515153515153515153515153515153515153515153515153504F524A455B
        99CD5A93C35A92C15C90BF3BA9E121B7F6A0BFD9528ABA000000000000008C4B
        00894600874400864200823B82E3D658DAC400AF7D19734659474C544D4F514F
        4F514F4F514F4F514F4F514F4F514F4F514F4F514F4F514F4F514E4D5048435C
        9BCE5B95C45B94C25C94C15C92BF588FBEA5C3DD5089B7000000000000000000
        00000000000000000000894479E3D800AC7C16846A574548514C4D4F4E4E4F4E
        4E4F4E4E4F4E4E4F4E4E4F4E4E4F4E4E4F4E4E4F4E4E4F4E4E4F4D4C4E46415C
        9DD15B96C65B95C45B95C45A94C35691C2A9C6E14F87B6000000000000000000
        000000000000000000008C4A00AC85007E3A4F77B25046454D4B4B4D4C4C4D4C
        4C4D4C4C4D4C4C4D4C4C4D4C4C4D4C4C4D4C4C4D4C4C4D4C4C4D4B4A4B443F5E
        9ED35C97C85C96C65C96C65B95C65693C4ADCAE34D85B3000000000000000000
        000000000000000000008E4D008B470000004C7AB14E45424C49484C4A4A4C4A
        4A4C4A4A4C4A4A4C4A4A4C4A4A4C4A4A4C4A4A4C4A4A4C4A4A4C49484A423D5F
        9FD45D98C95D97C75D97C75C96C75793C5B2CFE64C84B1000000000000000000
        0000000000000000000000000000000000004B7DAF4B44404A48474A49494A49
        494A49494A49494A49494A49494A49494A49494A49494A49494A484748413C60
        A1D75E9BCB5E99C95E99C95D98C95895C7B6D2E84A82B0000000000000000000
        000000000000000000000000000000000000497FAE48423D4846454847474847
        47484747484747484747484747484747484747484747484747484545463E3961
        A3D85F9CCC5F9ACA5F9ACA5E99CA5996C8BBD5EB4981AD000000000000000000
        0000000000000000000000000000000000004A7FAE463F3B4644434645454645
        45464545464545464545464545464545464545464545464545464343433C3762
        A4DA609CCE609BCC609BCC5F9ACC5997CAC0D9ED477EAB000000000000000000
        0000000000000000000000000000000000004980AD453E394542414543424543
        4245434245434245434245434245434245434245434245434244414040393460
        A2DB5E9BD05F9BCE619CCE5F9BCE5A98CCC5DCF0467DAA000000000000000000
        0000000000000000000000000000000000004980AC413730423B36423C37423C
        37423C37423C37423C37423C37423C37423C37423C37423C37413A353B322ABC
        DCF77AAED95B9ACD5F9CCE5F9CCE5A9ACDC9DFF2457CA7000000000000000000
        000000000000000000000000000000000000487CA54A82AE4B83B04B83B14B83
        B14B83B14B83B14B83B14B83B14B83B14B83B14B83B14B83B14A82AF447CA980
        A9CBB9D3EAA7C9E56CA4D35B9ACF5999CFCDE2F3437AA6000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000B9D1E6C2DBEE9AC2E25A9AD0CFE3F54177A3000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000A3B9CBBFD6EBBDD6EDD3E7F74076A2000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000B4C9DDCEE3F63E759F000000}
      ParentShowHint = False
      ShowHint = True
    end
    object SpeedButton2: TSpeedButton
      Left = 9
      Top = 5
      Width = 176
      Height = 41
      Cursor = crHandPoint
      Hint = 'Inulizar Numera'#231#227'o'
      Caption = 'Rela'#231#227'o de Nota Inutilizadas'
      Enabled = False
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FF92635DA46769A46769A46769A46769A46769A46769A46769A46769A467
        69A46769A46769A46769A46769A46769A46769A46769A46769A46769FF00FFFF
        00FFFF00FFFF00FFFF00FF93655EFFDCB7FFDAB5FED9B1FED8AFFED7ABFED5A7
        FED4A5FED3A3FED0A0FECF9FFECE9DFECE9AFECC98FECB96FECB96FECB96FECB
        969F6F60FF00FFFF00FFFF00FFFF00FFFF00FF93655FFEDEBCFEDDB8FFDAB5FE
        D9B2FED8AFFED7ABFED5AAFED4A6FED3A4FED0A0FECF9EFECF9DFECE9CFECE99
        FECC97FECB96FECB969F6F60FF00FFFF00FFFF00FFFF00FFFF00FF93655FFFE1
        C1FEE0BDFEDDBAFEDCB6FEDAB2FED8B0FED8ADFED5AAFED4A7FED3A4FED1A300
        8100FECF9DFFCE9CFECE99FECC98FECC979F6F60FF00FFFF00FFFF00FFFF00FF
        FF00FF93655FFFE3C5FEE1C1FFE0BDFFDEBBFEDCB7FEDAB4FED9B1FFD8ADFED5
        ABFED4A9008100008100008100FED09EFECF9DFECC99FECC989F6F60FF00FFFF
        00FFFF00FFFF00FFFF00FF936560FFE5CAFEE3C6D58127D58127D58127D58127
        D58127D58127FED8AF008100327725648E43008100548437FECF9EFECE9CFECE
        9A9F6F60FF00FFFF00FFFF00FFFF00FFFF00FF956660FFE7CEFFE5CBFFE5C7FE
        E2C4FEE0C0FEE0BCFFDDBAFEDCB6FFDAB2008100F6D3A7FFD5AAAFB174008100
        008100F8CE9CFECF9D9F6F60FF00FFFF00FFFF00FFFF00FFFF00FF986963FFEA
        D3FEE9CFFFE6CCFEE5C9FEE3C4FEE1C1FEE0BDFFDEBBFEDCB6FEDAB4FED9B1FE
        D7ADFED5ABEECE9E008100008100FFD09F9F6F60FF00FFFF00FFFF00FFFF00FF
        FF00FF9E6E64FFEBD8FEEBD4FEE9D0FEE6CEFEE5CAFEE3C6FFE1C2FEE0BFFFDE
        BCFEDCB7FEDAB5FED9B1FED7AFFED7ABFED4A9FFD4A5FED1A39F6F60FF00FFFF
        00FFFF00FFFF00FFFF00FFA37266FEEEDCFFEDD8FEEAD4FEE9D1FFE7CEFEE6CB
        FFE3C6FEE2C4FEE1C0FEDEBCFFDDB8008100FED9B2FED9AFFED7ABFED5A9FED4
        A69F6F60FF00FFFF00FFFF00FFFF00FFFF00FFA77568FFF0E0FEEEDDFEEDD9FF
        EBD5FFE9D1FFE7CFFEE6CBFFE3C7FEE3C4FEE1C1008100008100008100FFDAB2
        FED8B0FED8ADFED5AA9F6F62FF00FFFF00FFFF00FFFF00FFFF00FFAC7969FFF2
        E5FFF2E2D58127D58127D58127D58127D58127D58127FFE5C9008100327A2964
        934C00810054893EFEDAB5FED9B1FED7ADA07063FF00FFFF00FFFF00FFFF00FF
        FF00FFB17E6BFFF4E9FFF2E6FFF0E2FEEFE0FFEEDCFFEBD8FFEAD4FEE9D1FEE7
        CC008100F6E0C0FEE2C2AFBA84008100008100F8D9B1FED9B1A07264FF00FFFF
        00FFFF00FFFF00FFFF00FFB6816CFFF7EDFFF4EAFFF3E7FFF2E2FEEFE0FFEEDC
        FFEDD9FFEBD5FEEAD1FFE7CFFEE6CAFFE3C7FFE2C2EED9B5008100008100FEDC
        B69D7065FF00FFFF00FFFF00FFFF00FFFF00FFBB846EFFF8EFFEF7EEFEF6EBFF
        F3E7FEF2E5FFF0E1FFEEDEFFEDD9FEEBD7FEEAD3FEE9CFFEE6CCFFE5C7FEE3C5
        FEE1C1FEE0BDFEDDBB896A63FF00FFFF00FFFF00FFFF00FFFF00FFC0896FFFFA
        F3FFF8F2FFF7EEFFF6EAFFF4E7FEF3E6FFF2E1FFEFDEFFEDDAFFEDD7FFEAD400
        8100FEE7CCFEE5C9FFE3C6FFE1C2FEE1BF806762FF00FFFF00FFFF00FFFF00FF
        FF00FFC58C70FFFCF7FEFAF4FFF8F2FFF7EFFFF6EDFFF4E9FFF3E6FFF0E3FFF0
        DEFEEEDC008100008100008100FFE7CEFFE6CBFEE3C7FFE2C2846964FF00FFFF
        00FFFF00FFFF00FFFF00FFCB9173FFFCFAFFFBF8D58127D58127D58127D58127
        D58127D58127FEF2E3008100327D2E649956008100548F47FFE7CFFFE6CBFFE5
        C7986859FF00FFFF00FFFF00FFFF00FFFF00FFCF9674FFFEFCFFFEFBFFFBF8FF
        FAF6FEFAF3FFF8F0FFF6EEFFF4EBFEF3E7008100F7EEDAFFEFDEAFC497008100
        008100F8E6CBFFE7CBA5686BFF00FFFF00FFFF00FFFF00FFFF00FFD49875FFFE
        FFFFFEFCFFFEFAFFFBF8FFFBF6FFFAF3FFF8F2FFF8EFFFF6EBFFF4E9FFF3E5FF
        F2E2FFEFE0EFE6CF008100008100FEE9D0846964FF00FFFF00FFFF00FFFF00FF
        FF00FFD49875FFFFFFFFFFFFFFFEFEFFFEFBFFFCFAFFFBF7FFFBF4FFF8F2FFF7
        EFFFF6EBFEF4E9FFF3E6FEF2E3FFF0E0FFEFDDFEEDD9FEEBD5846964FF00FFFF
        00FFFF00FFFF00FFFF00FFD49875FFFFFFFFFFFFFFFFFFFFFFFEFFFEFBFEFEFB
        FFFBF8FFFBF4FFF8F3FEF8F0FFF7EEFFF4EAFFF4E7FEF2E5FEF0E1FEEFDDFFED
        DA846964FF00FFFF00FFFF00FFFF00FFFF00FFCF8E68CF8E68CF8E68CF8E68CF
        8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68
        CF8E68CF8E68CF8E68846964FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      ParentShowHint = False
      ShowHint = True
    end
  end
  object cdsInutilizaTmp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 368
    Top = 56
    object cdsInutilizaTmpNU_NF: TFMTBCDField
      FieldName = 'NU_NF'
      Required = True
      DisplayFormat = '000000000'
      Precision = 18
      Size = 0
    end
    object cdsInutilizaTmpANO: TIntegerField
      FieldName = 'ANO'
    end
    object cdsInutilizaTmpMODELO: TStringField
      FieldName = 'MODELO'
      Size = 5
    end
    object cdsInutilizaTmpSERIE: TSmallintField
      FieldName = 'SERIE'
      DisplayFormat = '000'
    end
    object cdsInutilizaTmpJUSTIFICATIVA: TStringField
      FieldName = 'JUSTIFICATIVA'
      Size = 255
    end
    object cdsInutilizaTmpCnpj: TStringField
      FieldName = 'Cnpj'
      EditMask = '!##\.###\.###\/####\-##;0; '
      Size = 14
    end
  end
  object dsInutilizaTmp: TDataSource
    DataSet = cdsInutilizaTmp
    OnStateChange = dsInutilizaTmpStateChange
    Left = 426
    Top = 88
  end
end
