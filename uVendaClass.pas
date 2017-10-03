unit uVendaClass;

interface

uses
  System.Generics.Collections, System.SysUtils;

type
  TItemVendaClass = class
  private
    FValor: Double;
    FCodigo: Integer;
    FQuantidade: Double;
  public
    property Valor: Double read FValor write FValor;
    property Codigo: Integer read FCodigo write FCodigo;
    property Quantidade: Double read FQuantidade write FQuantidade;
  end;

  TVendaClass = class
  private
    FItens: TObjectList<TItemVendaClass>;
  public
    constructor Create;
    destructor Destroy;
    procedure Iniciar;
    procedure Finalizar;
    procedure VendeItem(const pCodigo: Integer; pQuantidade, pValor: Double);
    function TotalItem(): Double;
    //property Itens: TObjectList<TItemVendaClass> read FItens write FItens;
  end;

implementation

{ TVendaClass }

constructor TVendaClass.Create;
begin
  FItens := TObjectList<TItemVendaClass>.Create;
end;

destructor TVendaClass.Destroy;
begin
  FItens.Free;
end;

procedure TVendaClass.Finalizar;
begin
  if FItens.Count < 1 then
    raise Exception.Create('É necessário ao menos um item lançado para finalizar venda');
end;

procedure TVendaClass.Iniciar;
begin

end;

function TVendaClass.TotalItem(): Double;
var
  I: Integer;
begin
  for I := 0 to FItens.Count - 1 do
    Result := Result + (FItens.Items[I].Quantidade * FItens.Items[I].Valor);
end;

procedure TVendaClass.VendeItem(const pCodigo: Integer; pQuantidade, pValor: Double);
var
  Item: TItemVendaClass;
begin
  Item := TItemVendaClass.Create;
  Item.Codigo := pCodigo;
  Item.Quantidade := pQuantidade;
  Item.Valor := pValor;
  FItens.Add(Item);
end;

end.

