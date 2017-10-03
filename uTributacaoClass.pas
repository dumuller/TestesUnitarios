unit uTributacaoClass;

interface

type
  TIcmsClass = class
  public
    function CalculoValorIcms(pAliquota, pValorBase: Double): Double;
  end;

  TIcmsSubstituicaoClass = class
  public
    function CalculoValorSubstituicaoIcms(pAliquota, pValorBase: Double): Double;
  end;

implementation

{ TIcmsClass }

function TIcmsClass.CalculoValorIcms(pAliquota, pValorBase: Double): Double;
begin
  Result := pValorBase * (pAliquota / 100);
end;

{ TIcmsSubstituicaoClass }

function TIcmsSubstituicaoClass.CalculoValorSubstituicaoIcms(pAliquota,
  pValorBase: Double): Double;
begin
  //
end;

end.

