unit uVendaTest;

interface

uses
  DUnitX.TestFramework, uVenda;

type
  [TestFixture]
  TVendaTest = class(TObject)
  private
    fVenda: TVenda;
    fComissao: TComissao;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure FinalizarVendaSemItensLancados;

    [Test]
    procedure VendeItem();

    [Test]
    procedure CalculaComissao;
  end;

implementation

{ TVendaTest }

procedure TVendaTest.CalculaComissao;
var
vResult: Double;
begin
  vResult := fComissao.CalculaComissao(100, 3);
  Assert.IsTrue(vResult = 3);
end;

procedure TVendaTest.FinalizarVendaSemItensLancados;
begin
  Assert.WillRaiseWithMessage(
    procedure
    begin
      fVenda.Iniciar;
      fVenda.Finalizar;
    end, nil, 'É necessário ao menos um item lançado para finalizar venda');
end;

procedure TVendaTest.Setup;
begin
  fVenda := TVenda.Create;
  fComissao := TComissao.Create;
end;

procedure TVendaTest.TearDown;
begin
  fVenda.Free;
  fComissao.Free;
end;

procedure TVendaTest.VendeItem;
var
  vTotal: Double;
begin
  fVenda.VendeItem(1, 10, 10);
  vTotal := fVenda.TotalVenda();
  Assert.IsTrue(vTotal = 100);
end;

initialization
  TDUnitX.RegisterTestFixture(TVendaTest);

end.

