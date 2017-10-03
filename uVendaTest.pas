unit uVendaTest;

interface

uses
  DUnitX.TestFramework, uVendaClass;

type
  [TestFixture]
  [Category('Venda')]
  TVendaTest = class(TObject)
  private
    eVenda: TVendaClass;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    [Category('Rápido')]
    procedure FinalizarVendaSemItensLancados;
    [Test]
    procedure VendeItem();
  end;

implementation

{ TVendaTest }

procedure TVendaTest.FinalizarVendaSemItensLancados;
begin
  Assert.WillRaiseWithMessage(
    procedure
    begin
      eVenda.Iniciar;
      eVenda.Finalizar;
    end, nil, 'É necessário ao menos um item lançado para finalizar venda');
end;

procedure TVendaTest.Setup;
begin
  eVenda := TVendaClass.Create;
end;

procedure TVendaTest.TearDown;
begin
  eVenda.Free;
end;

procedure TVendaTest.VendeItem;
var
  vTotal: Double;
begin
  eVenda.VendeItem(1, 10, 10);
  vTotal := eVenda.TotalItem();
  Assert.IsTrue(vTotal = 100);
end;

initialization
  TDUnitX.RegisterTestFixture(TVendaTest);

end.

