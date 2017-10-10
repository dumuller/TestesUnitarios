unit uTributacao;

interface

type
  TTributacao = class
  public
    function CalculoValorIcms(pAliquota, pValorBase: Double): Double;
    function CalculoValorIpi(pAliquota, pValorProduto, pFrete, pSeguro, pAcessorias: Double): Double;
  end;

  TIcmsSubstituicao = class
  public
    function CalculoValorSubstituicaoIcms(pAliquotaInterna, pAliquotaInterEstadual, pValorBase, pMva, vDesconto, pIpi: Double): Double;
  end;

implementation

{ TIcmsClass }

function TTributacao.CalculoValorIcms(pAliquota, pValorBase: Double): Double;
begin
  Result := pValorBase * (pAliquota / 100);
end;

{ TIcmsSubstituicaoClass }

function TIcmsSubstituicao.CalculoValorSubstituicaoIcms(pAliquotaInterna, pAliquotaInterEstadual, pValorBase, pMva, vDesconto, pIpi: Double): Double;
var
  vValorIcms, vBaseIcmsSt: Double;
begin
  vValorIcms := (pValorBase - vDesconto) * (pAliquotaInterna / 100);
  vBaseIcmsSt := ((pValorBase + pIpi) - vDesconto) * (1 + (pMva / 100));
  Result := (vBaseIcmsSt * (pAliquotaInterEstadual / 100)) - vValorIcms;
end;

function TTributacao.CalculoValorIpi(pAliquota, pValorProduto, pFrete, pSeguro, pAcessorias: Double): Double;
begin
  Result := (pValorProduto + pFrete + pSeguro + pAcessorias) * (pAliquota / 100);
end;

end.

