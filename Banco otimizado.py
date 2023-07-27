import textwrap


def menu():
    menu = """\n
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ MENU ~~~~~~~~~~~~~~~~~~~~~~~~~~
    [d]\tDepositar
    [s]\tSacar
    [e]\tExtrato
    [nc]\tNova Conta
    [lc]\tListar Contas
    [nu]\tNovo Usuario
    [q]\tSair
    """
    return input(textwrap.dedent(menu))


def depositar(saldo, valor, extrato, /):
    if valor > 0:
        saldo += valor
        extrato += f"Deposito:\tR$ {valor:.2f}\n"
        print("\n Deposito Realizado com Sucesso")
    else:
        print("\n Insira um valor valido")
    
    return saldo, extrato


def sacar(*, saldo, valor, extrato, limite, numero_saques, limite_saque):
    excedeu_saldo = valor > saldo
    excedeu_limite = valor > limite
    excedeu_saques = numero_saques >= limite_saque

    if excedeu_saldo:
        print("\n Saldo Insuficiente")
    
    elif excedeu_limite:
        print("\n Valor desejado acima do limite de saque")

    elif excedeu_saques:
        print("\n Numero de Saques excedido")

    elif valor > 0:
        saldo -= valor
        extrato += f"Saque:\t\tR$ {valor:.2f}\n"
        numero_saques += 1
        print("\n Saque Realizado com Sucesso\n")

    else:
        print("\n Valor informado invalido\n")
    
    return saldo, extrato


def exibir_extrato(saldo, /, *, extrato):
    print("\n EXTRATO")
    print("Nao foram realizadas operacoes" if not extrato else extrato)
    print(f"\nSALDO:\t\tR$ {saldo:.2f}")



def criar_usuario(usuarios):
    cpf = input ("Informe seu cpf:")
    usuario = filtrar_usuario(cpf, usuarios)

    if usuario:
        print("\n Ja existe um usuario com esse cpf")
        return

    nome = input("Informe o nome complete:")
    data_nascimento = input("Informe a data de nascimento no formato dd-mm-aaaa:")
    endereco = input("Informe o endereco, na ordem, Rua, Numero, Bairro, Cidade/Sigla Estado")

    usuarios.append({"nome":nome, "data_nascimento": data_nascimento, "cpf": cpf, "endereco": endereco})

    print(" Usuario cadastrado com sucesso ")


def filtrar_usuario(cpf, usuarios):
    usuarios_filtrados = [usuario for usuario in usuarios if usuario["cpf"] == cpf]
    return usuarios_filtrados[0] if usuarios_filtrados else None


def criar_conta(agencia, numero_conta, usuarios):
    cpf = input("Informe seu CPF")
    usuario = filtrar_usuario(cpf, usuarios)

    if usuario:
        print("\n Conta Criado com Sucesso")
        return {"agencia": agencia, "numero_conta": numero_conta, "usuario": usuario}
    
        print("\n Usuario nao encontrado, fluxo encerrado")


def listar_contas(contas):
    for conta in contas:
        linha = f"""\
            Agencia:\t{conta["agencia"]}
            C/C:\t\t{conta["numero_conta"]}
            Titular:\t{conta["usuario"]['nome']}
            """
        print("=" * 100)
        print(textwrap.dedent(linha))
    


def main():
    LIMITE_SAQUES = 3
    AGENCIA = "0001"

    saldo = 0
    limite =500
    extrato = " "
    numero_saques = 0
    usuarios = []
    contas = []

    while True:
        opcao = menu()

        if opcao == "d":
            valor = float(input("Informe o valor do deposito: "))

            saldo, extrato = depositar(saldo, valor, extrato)

        elif opcao == "s":
            valor = float(input("Informe o valor do saque"))

            saldo, extrato = sacar(
                saldo=saldo,
                valor=valor,
                extrato=extrato,
                limite=limite,
                numero_saques=numero_saques,
                limite_saques=LIMITE_SAQUES,
            )

        elif opcao == "e":
            exibir_extrato(saldo, extrato=extrato)

        elif opcao == "nu":
            criar_usuario(usuarios)
        
        elif opcao == "nc":
            numero_conta = len(contas) + 1
            conta = criar_conta(AGENCIA, numero_conta, usuarios)

            if conta:
                contas.append(conta)

        elif opcao == "lc":
            listar_contas(contas)

        elif opcao == "q":
            break
        
        else:
            print("Operacao invalida, Selecione novamente a operacao desejada\n")


main()