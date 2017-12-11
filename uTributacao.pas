unit uTributacao;

interface

uses
  uCalc;

type
  TTributacao = class
  private
    fCalc: TCalc;
  public
    constructor Create;
    destructor Destroy; override;
    function CalculoValorIcms(pAliquota, pValorBase: Double): Double;
    function CalculoValorIpi(pAliquota, pValorProduto, pFrete, pSeguro, pAcessorias: Double): Double;
    property Calc: TCalc read fCalc;
  end;

  TIcmsSubstituicao = class
  private
    fCalc: TCalc;
  public
    property Calc: TCalc read fCalc;
    function CalculoValorSubstituicaoIcms(pAliquotaInterna, pAliquotaInterEstadual, pValorBase, pMva, vDesconto, pIpi: Double): Double;
  end;

implementation

{ TIcmsClass }

function TTributacao.CalculoValorIcms(pAliquota, pValorBase: Double): Double;
begin
  Result := fCalc.Multiplicar(pValorBase, (fCalc.Dividir(pAliquota, 100)));
end;

{ TIcmsSubstituicaoClass }

function TIcmsSubstituicao.CalculoValorSubstituicaoIcms(pAliquotaInterna, pAliquotaInterEstadual, pValorBase, pMva, vDesconto, pIpi: Double): Double;
var
  vValorIcms, vBaseIcmsSt: Double;
begin
  vValorIcms := fCalc.Multiplicar(fCalc.Subtrair(pValorBase, vDesconto), fCalc.Dividir(pAliquotaInterna, 100));
  vBaseIcmsSt := fCalc.Multiplicar(fCalc.Subtrair(fCalc.Somar(pValorBase, pIpi), vDesconto), fCalc.Somar(1, fCalc.Dividir(pMva, 100)));
  Result := fCalc.Subtrair(fCalc.Multiplicar(vBaseIcmsSt, fCalc.Dividir(pAliquotaInterEstadual, 100)), vValorIcms);
end;

function TTributacao.CalculoValorIpi(pAliquota, pValorProduto, pFrete, pSeguro, pAcessorias: Double): Double;
begin
  Result := fCalc.Multiplicar((pValorProduto + pFrete + pSeguro + pAcessorias), fCalc.Dividir(pAliquota,  100));
end;

constructor TTributacao.Create;
begin
  fCalc := TCalc.Create;
end;

destructor TTributacao.Destroy;
begin
  fCalc.Free;
end;

end.

