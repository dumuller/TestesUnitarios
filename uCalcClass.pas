unit uCalcClass;

interface

type
  TCalcClass = class
    public
    function Somar(pValor1, pValor2: Double): Double;
    function Subtrair(pValor1, pValor2: Double): Double;
    function Dividir(pValor1, pValor2: Double): Double;
    function Multiplicar(pValor1, pValor2: Double): Double;
  end;

implementation

{ TCalcClass }

function TCalcClass.Dividir(pValor1, pValor2: Double): Double;
begin
  Result := pValor1 / pValor2;
end;

function TCalcClass.Multiplicar(pValor1, pValor2: Double): Double;
begin
  Result := pValor1 * pValor2;
end;

function TCalcClass.Somar(pValor1, pValor2: Double): Double;
begin
  Result := pValor1 + pValor2;
end;

function TCalcClass.Subtrair(pValor1, pValor2: Double): Double;
begin
  Result := pValor1 - pValor2;
end;

end.
