unit uCalcTest;

interface

uses
  DUnitX.TestFramework, uCalc;

type
  [TestFixture]
  TCalcTest = class(TObject)
  strict private
    fCalc: TCalc;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [TestCase('TesteSoma', '5,5,10')]
    procedure Somar(pValor1, pValor2, pResult: Double);
    [TestCase('TesteSubtração', '5,5,0')]
    procedure Subtrair(pValor1, pValor2, pResult: Double);
    [TestCase('TesteDivizão', '25,5,5')]
    procedure Dividir(pValor1, pValor2, pResult: Double);
    [TestCase('TesteMultiplicação', '5,50,250')]
    procedure Multiplicar(pValor1, pValor2, pResult: Double);
  end;

implementation

procedure TCalcTest.Dividir(pValor1, pValor2, pResult: Double);
var
  vResult: Double;
begin
  vResult := fCalc.Dividir(pValor1, pValor2);
  Assert.AreEqual(vResult, pResult);
end;

procedure TCalcTest.Multiplicar(pValor1, pValor2, pResult: Double);
var
  vResult: Double;
begin
  vResult := fCalc.Multiplicar(pValor1, pValor2);
  Assert.AreEqual(vResult, pResult);
end;

procedure TCalcTest.Setup;
begin
  fCalc := TCalc.Create;
end;

procedure TCalcTest.Somar(pValor1, pValor2, pResult: Double);
var
  vResult: Double;
begin
  vResult := fCalc.Somar(pValor1, pValor2);
  Assert.AreEqual(vResult, pResult);
end;

procedure TCalcTest.Subtrair(pValor1, pValor2, pResult: Double);
var
  vResult: Double;
begin
  vResult := fCalc.Subtrair(pValor1, pValor2);
  Assert.AreEqual(vResult, pResult);
end;

procedure TCalcTest.TearDown;
begin
 fCalc.Free;
end;

initialization
  TDUnitX.RegisterTestFixture(TCalcTest);
end.

