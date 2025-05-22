require 'socket' # biblioteca para rede
require 'set'    # biblioteca para usar Set

endereco = 'localhost'
porta = 6000

servidor = UDPSocket.new
servidor.bind(endereco, porta)

puts "Servidor de chat UDP ouvindo em #{endereco}:#{porta}..."
puts "Pressione CTRL+C para parar"

clientes = Set.new
loop do
  mensagem, endereco_cliente = servidor.recvfrom(1024)
  clientes.add(endereco_cliente)
  puts "Cliente #{endereco_cliente[1]} disse: #{mensagem}"

  clientes.each do |cliente|
    unless cliente == endereco_cliente
      servidor.send("Cliente #{endereco_cliente[1]} disse: #{mensagem}", 0, cliente[3], cliente[1])
    end
  end
end
