unit uCalc;

interface

type
  TCalc = class
    public
    function Somar(pValor1, pValor2: Double): Double;
    function Subtrair(pValor1, pValor2: Double): Double;
    function Dividir(pValor1, pValor2: Double): Double;
    function Multiplicar(pValor1, pValor2: Double): Double;
  end;

implementation

{ TCalcClass }

function TCalc.Dividir(pValor1, pValor2: Double): Double;
begin
  Result := pValor1 / pValor2;
end;

function TCalc.Multiplicar(pValor1, pValor2: Double): Double;
begin
  Result := pValor1 * pValor2;
end;

function TCalc.Somar(pValor1, pValor2: Double): Double;
begin
  Result := pValor1 + pValor2;
end;

function TCalc.Subtrair(pValor1, pValor2: Double): Double;
begin
  Result := pValor1 - pValor2;
end;

end.
