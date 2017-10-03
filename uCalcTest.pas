unit uCalcTest;

interface

uses
  DUnitX.TestFramework, uCalcClass;

type
  [TestFixture]
  [Category('Calculos')]
  TCalcTest = class(TObject)
  strict private
    eCalc: TCalcClass;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [TestCase('TesteSoma', '5,5,10')]
    [Category('Simples')]
    procedure Somar(pValor1, pValor2, pResult: Double);
    [TestCase('TesteSubtração', '5,5,0')]
    [Category('Simples')]
    procedure Subtrair(pValor1, pValor2, pResult: Double);
    [TestCase('TesteDivizão', '25,5,5')]
    [Category('Simples')]
    procedure Dividir(pValor1, pValor2, pResult: Double);
    [TestCase('TesteMultiplicação', '5,50,250')]
    [Category('Simples')]
    procedure Multiplicar(pValor1, pValor2, pResult: Double);
  end;

implementation

procedure TCalcTest.Dividir(pValor1, pValor2, pResult: Double);
var
  vResult: Double;
begin
  vResult := eCalc.Dividir(pValor1, pValor2);
  Assert.AreEqual(vResult, pResult);
end;

procedure TCalcTest.Multiplicar(pValor1, pValor2, pResult: Double);
var
  vResult: Double;
begin
  vResult := eCalc.Multiplicar(pValor1, pValor2);
  Assert.AreEqual(vResult, pResult);
end;

procedure TCalcTest.Setup;
begin
  eCalc := TCalcClass.Create;
end;

procedure TCalcTest.Somar(pValor1, pValor2, pResult: Double);
var
  vResult: Double;
begin
  vResult := eCalc.Somar(pValor1, pValor2);
  Assert.AreEqual(vResult, pResult);
end;

procedure TCalcTest.Subtrair(pValor1, pValor2, pResult: Double);
var
  vResult: Double;
begin
  vResult := eCalc.Subtrair(pValor1, pValor2);
  Assert.AreEqual(vResult, pResult);
end;

procedure TCalcTest.TearDown;
begin
  eCalc.Free;
end;

initialization
  TDUnitX.RegisterTestFixture(TCalcTest);

end.

