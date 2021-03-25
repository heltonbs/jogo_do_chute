def nomeDoJogo
    puts
    puts "\t\t░░░░░██╗░█████╗░░██████╗░░█████╗░  ██████╗░░█████╗░  ░█████╗░██╗░░██╗██╗░░░██╗████████╗███████╗██╗"
    puts "\t\t░░░░░██║██╔══██╗██╔════╝░██╔══██╗  ██╔══██╗██╔══██╗  ██╔══██╗██║░░██║██║░░░██║╚══██╔══╝██╔════╝██║"
    puts "\t\t░░░░░██║██║░░██║██║░░██╗░██║░░██║  ██║░░██║██║░░██║  ██║░░╚═╝███████║██║░░░██║░░░██║░░░█████╗░░██║"
    puts "\t\t██╗░░██║██║░░██║██║░░╚██╗██║░░██║  ██║░░██║██║░░██║  ██║░░██╗██╔══██║██║░░░██║░░░██║░░░██╔══╝░░╚═╝"
    puts "\t\t╚█████╔╝╚█████╔╝╚██████╔╝╚█████╔╝  ██████╔╝╚█████╔╝  ╚█████╔╝██║░░██║╚██████╔╝░░░██║░░░███████╗██╗"
    puts "\t\t░╚════╝░░╚════╝░░╚═════╝░░╚════╝░  ╚═════╝░░╚════╝░  ░╚════╝░╚═╝░░╚═╝░╚═════╝░░░░╚═╝░░░╚══════╝╚═╝"
    puts
end

def da_boas_vindas
    nomeDoJogo
    puts "Nome do jogador?"
    nome = gets.strip
    puts "\n"
    puts "Iniciando jogo para #{nome}. Escolha a dificuldade do jogo?"
    nome
end

def sorteia_numero_secreto(dificuldade)
    case dificuldade
    when 1
        maximo = 30
    when 2
        maximo = 60
    when 3
        maximo = 100
    when 4
        maximo = 150
    else
        maximo = 200
    end

    puts "Escolhendo um número secreto entre 1 e #{maximo}"
    sorteado = rand(maximo + 1)
    puts "Número secreto escolhido. Agora tente acertar nosso número secreto?"
    sorteado
end    

def pede_um_numero(chutes, tentativa, limite_de_tentativa)
    puts "\n"
    puts "Tentativa #{tentativa} de #{limite_de_tentativa}. Chutes até agora: #{chutes}."
    puts "Entre com um número:"
    chute = gets.strip
    chute.to_i
end

def verifica_se_acertou(numero_secreto, chute)
    acertou = numero_secreto == chute
    if acertou
        ganhou
        return true
    end
    maior = numero_secreto > chute
    if maior
        puts "Você ERROU! O número secreto é MAIOR."
    else
        puts "Você ERROU! O número secreto é MENOR."
    end
    false
end

def pede_dificuldade
    puts "[1] Muito Fácil | [2] Fácil | [3] Médio | [4] Difícil | [5] Muito Difícil"
    dificuldade = gets.to_i
end

def joga(nome, dificuldade)
    numero_secreto = sorteia_numero_secreto(dificuldade)
    pontos_ate_agora = 1000
    limite_de_tentativa = 5
    
    chutes = []
    
    for tentativa in 1..limite_de_tentativa
        chute = pede_um_numero chutes, tentativa, limite_de_tentativa
        chutes << chute
        pontos_a_perder = ((chute - numero_secreto).abs / 2.0)
    
        pontos_ate_agora -= pontos_a_perder
        break if verifica_se_acertou numero_secreto, chute
    end
    
    puts "Sua pontuação final foi de #{pontos_ate_agora}."    
end

def nao_quer_jogar?
    puts "\nDeseja jogar novamente? ([S]im / [N]ão)"
    quero_jogar = gets.strip
    nao_quero_jogar = quero_jogar.upcase == "N"
end

def limpar
    system('cls')
end

def ganhou
    puts
    puts "\t\t\t\t░██████╗░░█████╗░███╗░░██╗██╗░░██╗░█████╗░██╗░░░██╗██╗██╗██╗"
    puts "\t\t\t\t██╔════╝░██╔══██╗████╗░██║██║░░██║██╔══██╗██║░░░██║██║██║██║"
    puts "\t\t\t\t██║░░██╗░███████║██╔██╗██║███████║██║░░██║██║░░░██║██║██║██║"
    puts "\t\t\t\t██║░░╚██╗██╔══██║██║╚████║██╔══██║██║░░██║██║░░░██║╚═╝╚═╝╚═╝"
    puts "\t\t\t\t╚██████╔╝██║░░██║██║░╚███║██║░░██║╚█████╔╝╚██████╔╝██╗██╗██╗"
    puts "\t\t\t\t░╚═════╝░╚═╝░░╚═╝╚═╝░░╚══╝╚═╝░░╚═╝░╚════╝░░╚═════╝░╚═╝╚═╝╚═╝"
end

limpar
nome = da_boas_vindas
dificuldade = pede_dificuldade

loop do
    joga nome, dificuldade
    if nao_quer_jogar?
        break
    else
        limpar
        nomeDoJogo
    end
end