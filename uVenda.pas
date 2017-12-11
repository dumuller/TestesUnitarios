unit uVenda;

interface

uses
  System.Generics.Collections, System.SysUtils, uCalc;
type
  TItemVenda = class
  private
    FValor: Double;
    FCodigo: Integer;
    FQuantidade: Double;
  public
    property Valor: Double read FValor write FValor;
    property Codigo: Integer read FCodigo write FCodigo;
    property Quantidade: Double read FQuantidade write FQuantidade;
  end;

  TVenda = class
  private
    FItens: TObjectList<TItemVenda>;
    FNomeCliente: string;
    FCalc: TCalc;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Iniciar;
    procedure Finalizar;
    procedure VendeItem(const pCodigo: Integer; pQuantidade, pValor: Double);
    function TotalVenda(): Double;
    property NomeCliente: string read FNomeCliente write FNomeCliente;
    property Calc: TCalc read FCalc;
  end;

  TComissao = class
  private
    FCalc: TCalc;
  public
    property Calc: TCalc read FCalc;
    constructor Create;
    destructor Destroy; override;
    function CalculaComissao(pValorVenda, pPercentualComissao: Double): Double;
  end;

implementation

{ TVendaClass }

constructor TVenda.Create;
begin
  FItens := TObjectList<TItemVenda>.Create;
  FCalc := TCalc.Create;
end;

destructor TVenda.Destroy;
begin
  FItens.Free;
  FCalc.Free;
end;

procedure TVenda.Finalizar;
begin
  if FItens.Count < 1 then
    raise Exception.Create('É necessário ao menos um item lançado para finalizar a venda');
end;

procedure TVenda.Iniciar;
begin
   FNomeCliente := 'Nome do Cliente';
end;

function TVenda.TotalVenda(): Double;
var
  vItemVenda: TItemVenda;
begin
  Result := 0;
  for vItemVenda in FItens do
    Result := FCalc.Somar(Result, (FCalc.Multiplicar(vItemVenda.Quantidade, vItemVenda.Valor)));
end;

procedure TVenda.VendeItem(const pCodigo: Integer; pQuantidade, pValor: Double);
var
  Item: TItemVenda;
begin
  Item := TItemVenda.Create;
  Item.Codigo := pCodigo;
  Item.Quantidade := pQuantidade;
  Item.Valor := pValor;
  FItens.Add(Item);
end;

{ TComissao }

function TComissao.CalculaComissao(pValorVenda, pPercentualComissao: Double): Double;
begin
  Result := FCalc.Multiplicar(pValorVenda, (FCalc.Dividir(pPercentualComissao,100)));
end;

constructor TComissao.Create;
begin
  FCalc := TCalc.Create;
end;

destructor TComissao.Destroy;
begin
  FCalc.Free;
end;

end.

