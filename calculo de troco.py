valorHamburguer = float(input())
quantidadeHamburguer = int(input())
valorBebida = float(input())
quantidadeBebida = int(input())
valorPago = float(input())
valortotalhamburguer = 0
valortotalbebida = 0
precopedido = 0
troco = 0


if valorHamburguer > 0 and quantidadeHamburguer > 0:
  valortotalhamburguer = valorHamburguer*quantidadeHamburguer

elif valorBebida > 0 and quantidadeBebida > 0:
  valortotalbebida = valorBebida*quantidadeBebida

else:
  print ("Insira um valor valido.")
  
precopedido = valortotalhamburguer + valortotalbebida
troco = valorPago - precopedido


print (f"O preço final do pedido é R$ {precopedido:.2f}. Seu troco é R$ {troco:.2f}.")