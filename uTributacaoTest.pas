unit uTributacaoTest;

interface

uses
  DUnitX.TestFramework, uTributacaoClass;

type
  [TestFixture]
  TTributacaoTest = class(TObject)
  strict private
    eIcmsClass: TIcmsClass;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [TestCase('Cálculo ICMS', '100,17,17')]
    procedure CalculoValorIcms(pValorBase, pAliquota, pResult: Double);
  end;

implementation

procedure TTributacaoTest.CalculoValorIcms(pValorBase, pAliquota, pResult: Double);
var
  vResult: Double;
begin
  vResult := eIcmsClass.CalculoValorIcms(pAliquota,pValorBase);
  Assert.AreEqual(pResult, vResult);
end;

procedure TTributacaoTest.Setup;
begin
   eIcmsClass := TIcmsClass.Create;
end;

procedure TTributacaoTest.TearDown;
begin
  eIcmsClass.Free;
end;

initialization
  TDUnitX.RegisterTestFixture(TTributacaoTest);

end.

