object frmCCE: TfrmCCE
  Left = 0
  Top = 0
  Width = 673
  Height = 385
  TabOrder = 0
  object Label1: TLabel
    Left = 11
    Top = 10
    Width = 65
    Height = 13
    Caption = 'UF do Evento'
  end
  object Label2: TLabel
    Left = 478
    Top = 59
    Width = 121
    Height = 13
    Caption = 'CNPJ do autor do Evento'
    Visible = False
  end
  object Label3: TLabel
    Left = 13
    Top = 59
    Width = 224
    Height = 13
    Caption = 'Chave de Acesso da NF-e vinculada ao Evento'
  end
  object Label4: TLabel
    Left = 105
    Top = 12
    Width = 98
    Height = 13
    Caption = 'Descri'#231#227'o do Evento'
  end
  object cmbUF: TComboBox
    Left = 11
    Top = 29
    Width = 65
    Height = 21
    Cursor = crHandPoint
    Style = csDropDownList
    TabOrder = 0
    OnEnter = cmbUFEnter
  end
  object edtDOC: TEdit
    Left = 478
    Top = 78
    Width = 150
    Height = 21
    Hint = 'Informe o CNPJ ou CPF do autor do evento.'
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    Visible = False
    OnExit = edtDOCExit
    OnKeyPress = edtDOCKeyPress
  end
  object edtChave: TEdit
    Left = 11
    Top = 78
    Width = 417
    Height = 21
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 3
    OnExit = edtChaveExit
    OnKeyPress = edtDOCKeyPress
  end
  object edtDesc: TEdit
    Left = 105
    Top = 29
    Width = 121
    Height = 21
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvNone
    ReadOnly = True
    TabOrder = 2
    Text = 'Carta de Corre'#231#227'o'
  end
  object GroupBox1: TGroupBox
    Left = 11
    Top = 108
    Width = 652
    Height = 129
    Caption = 'Corre'#231#227'o a ser considerada '
    TabOrder = 4
    object mmCorrecao: TMemo
      Left = 2
      Top = 15
      Width = 648
      Height = 112
      Align = alClient
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvNone
      MaxLength = 1000
      TabOrder = 0
      OnChange = mmCorrecaoChange
    end
  end
  object GroupBox2: TGroupBox
    Left = 11
    Top = 244
    Width = 652
    Height = 92
    Caption = 'Condi'#231#245'es de uso da Carta de Corre'#231#227'o'
    TabOrder = 5
    object mmCodUso: TMemo
      Left = 2
      Top = 15
      Width = 648
      Height = 75
      Align = alClient
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvNone
      Lines.Strings = (
        
          'A Carta de Corre'#231#227'o '#233' disciplinada pelo '#167' 1'#186'-A do art. 7'#186' do Con' +
          'v'#234'nio S/N, de 15 de dezembro de 1970 e pode ser utilizada para '
        
          'regulariza'#231#227'o de erro ocorrido na emiss'#227'o de documento fiscal, d' +
          'esde que o erro n'#227'o esteja relacionado com: I - as vari'#225'veis que' +
          ' '
        
          'determinam o valor do imposto tais como: base de c'#225'lculo, al'#237'quo' +
          'ta, diferen'#231'a de pre'#231'o, quantidade, valor da opera'#231#227'o ou da '
        
          'presta'#231#227'o; II - a corre'#231#227'o de dados cadastrais que implique muda' +
          'n'#231'a do remetente ou do destinat'#225'rio; III - a data de emiss'#227'o ou ' +
          'de '
        'sa'#237'da.')
      MaxLength = 1000
      ReadOnly = True
      TabOrder = 0
    end
  end
  object pnlBtn: TPanel
    Left = 0
    Top = 344
    Width = 673
    Height = 41
    Align = alBottom
    TabOrder = 6
    object btnTransCCe: TBitBtn
      Left = 24
      Top = 8
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = '&Enviar'
      TabOrder = 0
      OnClick = btnTransCCeClick
    end
    object btnCancelar: TBitBtn
      Left = 105
      Top = 8
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
end
