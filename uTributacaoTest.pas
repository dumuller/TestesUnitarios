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
    [TestCase('Cálculo ICMS', '100,17,17')]
    procedure CalculoValorIcms(pValorBase, pAliquota, pResult: Double);
    [TestCase('Cálculo IPI', '10,100,20,0,10,13')]
    procedure CalculoValorIpi(pAliquota, pValorProduto, pFrete, pSeguro, pAcessorias, pResult: Double);
    [TestCase('Calculo ST','12,18,9600,39,0')]
    procedure CalculoValorIcmsSt(pAliquotaInterna, pAliquotaInterEstadual, pValorBase, pMva, vDesconto: Double);
  end;

implementation

procedure TTributacaoTest.CalculoValorIcms(pValorBase, pAliquota, pResult: Double);
var
  vResult: Double;
begin
  {vResult := fTributacao.CalculoValorIcms(pAliquota, pValorBase);
  Assert.AreEqual(pResult, vResult);}
end;

procedure TTributacaoTest.CalculoValorIcmsSt(pAliquotaInterna, pAliquotaInterEstadual,
pValorBase, pMva, vDesconto: Double);
var
  vResult, vEsperado: Double;
begin
 vEsperado := 1350;
  vResult := fIcmsSt.CalculoValorSubstituicaoIcms(pAliquotaInterna, pAliquotaInterEstadual, pValorBase,
  pMva, vDesconto, 400);
  Assert.AreEqual(vEsperado, vResult);
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

