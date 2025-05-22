require 'socket' # biblioteca para rede

endereco = 'localhost'
porta = 6000

cliente = UDPSocket.new
Thread.new do
  loop do
    begin
      mensagem, _ = cliente.recvfrom(1024)
      puts "\nAlguém disse: #{mensagem}"
      print "Sua mensagem: "
    rescue
      break
    end
  end
end

puts "Bem-vindo!!! Digite sua mensagem abaixo:"
loop do
  print "Sua mensagem: "
  mensagem = gets.chomp
  cliente.send(mensagem, 0, endereco, porta)
end
