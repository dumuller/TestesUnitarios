unit uTributacaoTest;

interface

uses
  DUnitX.TestFramework, uTributacao;

type
  [TestFixture]
  TTributacaoTest = class(TObject)
  strict private
    fTributacao: TTributacao;
    fIcmsSt: TIcmsSubstituicao;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [TestCase('Teste Cálculo ICMS', '100,17,17')]
    procedure CalculoValorIcms(pValorBase, pAliquota, pResult: Double);
    [TestCase('Teste Cálculo IPI', '10,100,20,0,10,13')]
    procedure CalculoValorIpi(pAliquota, pValorProduto, pFrete, pSeguro, pAcessorias, pResult: Double);
    [TestCase('Teste Cálculo ST', '12,18,9600,39,0, 1350')]
    procedure CalculoValorIcmsSt(pAliquotaInterna, pAliquotaInterEstadual, pValorBase, pMva, pDesconto, pResult: Double);
  end;

implementation

procedure TTributacaoTest.CalculoValorIcms(pValorBase, pAliquota, pResult: Double);
var
  vResult: Double;
begin
  vResult := fTributacao.CalculoValorIcms(pAliquota, pValorBase);
  Assert.AreEqual(pResult, vResult);
end;

procedure TTributacaoTest.CalculoValorIcmsSt(pAliquotaInterna, pAliquotaInterEstadual, pValorBase, pMva, pDesconto, pResult: Double);
var
  vResult: Double;
begin
  vResult := fIcmsSt.CalculoValorSubstituicaoIcms(pAliquotaInterna, pAliquotaInterEstadual, pValorBase, pMva, pDesconto, 400);
  Assert.AreEqual(pResult, vResult);
end;

procedure TTributacaoTest.CalculoValorIpi(pAliquota, pValorProduto, pFrete, pSeguro, pAcessorias, pResult: Double);
var
  vResult: Double;
begin
  vResult := fTributacao.CalculoValorIpi(pAliquota, pValorProduto, pFrete, pSeguro, pAcessorias);
  Assert.AreEqual(pResult, vResult);
end;

procedure TTributacaoTest.Setup;
begin
  fTributacao := TTributacao.Create;
  fIcmsSt := TIcmsSubstituicao.Create;
end;

procedure TTributacaoTest.TearDown;
begin
  fTributacao.Free;
  fIcmsSt.Free;
end;

initialization
  TDUnitX.RegisterTestFixture(TTributacaoTest);
end.

