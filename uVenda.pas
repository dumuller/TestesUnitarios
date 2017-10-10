unit uVenda;

interface

uses
  System.Generics.Collections, System.SysUtils;

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
  public
    constructor Create;
    destructor Destroy;
    procedure Iniciar;
    procedure Finalizar;
    procedure VendeItem(const pCodigo: Integer; pQuantidade, pValor: Double);
    function TotalItem(): Double;
  end;

  TComissao = class
  public
    function CalculaComissao(pValorVenda, pPercentualComissao: Double): Double;
  end;

implementation

{ TVendaClass }

constructor TVenda.Create;
begin
  FItens := TObjectList<TItemVenda>.Create;
end;

destructor TVenda.Destroy;
begin
  FItens.Free;
end;

procedure TVenda.Finalizar;
begin
  if FItens.Count < 1 then
    raise Exception.Create('É necessário ao menos um item lançado para finalizar venda');
end;

procedure TVenda.Iniciar;
begin

end;

function TVenda.TotalItem(): Double;
var
  I: Integer;
  vItemVenda: TItemVenda;
begin
  for vItemVenda in FItens do
    Result := Result + (vItemVenda.Quantidade * vItemVenda.Valor);
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
  Result := pValorVenda * (pPercentualComissao / 100);
end;

end.

