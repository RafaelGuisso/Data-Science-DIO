#Sistema bancario
menu = """

[d] Deposito
[s] Saque
[e] Extrato
[q] Sair

"""

saldo = 465
deposito = 0
saque = 0
i = 3
extrato = ("As operacoes realizadas ate o momento foram:\n\n")

while True:
    opcao = input(menu)

    if opcao == "d":
        valor = float(input("Informe o valor do Deposito:"))

        if valor > 0:
            saldo = saldo + valor
            extrato = extrato + (f" Deposito de R$ {valor:.2f}\n")
            print ("Deposito Realizado com sucesso\n")
        else:
            print ("Digite um valor valido\n")

    if opcao == "s":
        valor = float(input("Informe o valor do Saque:"))
        
        if valor > 500:
            print ("Valor de saque desejado acima do limite permitido\n")
        elif valor < 0:
            print ("Digite um valor valido\n")
        elif valor > saldo:
            print ("Voce nao possui saldo para realizar essa operacao\n")
        else:
            if i > 0:
                saldo = saldo - valor
                extrato = extrato + (f" Saque de R$ {valor:.2f}\n")
                i = i - 1
                print (f"Saque realizado com Sucesso. Voce ainda pode realizar {i} saques hoje.\n")
            else:
                print ("Voce atingiu o limite de saques diarios\n")
    
    if opcao == "e":
        if i == 3 and saldo == 465:
            print (f"""
                   ================= EXTRATO ================
        Voce ainda nao realizou nenhuma movimentacao hoje. Saldo atual de R$ {saldo:.2f}
                   ==========================================
\n""")
        else:
            print (f"{extrato}\nSaldo atual de R$ {saldo:.2f}\n")
    
    if opcao == "q":
         print ("Encerrando Operacao")
         break



