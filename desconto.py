def main():
    n = int(input())
 
    total = 0
 
    for i in range(1, n + 1):
        pedido = input().split(" ")
        nome = pedido[0]
        valor = float(pedido[1])
        total += valor
    
    desconto = input()
    if desconto == "10%":
      total = total*0.9
    
    elif desconto == "20%":
      total = total*0.8

    print (f"Valor total: {total:.2f}")
    
 
 
  #TODO: Criar as condições para aplicar o cupom de desconto (10% ou 20%).
 
 
if __name__ == "__main__":
    main()