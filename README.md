# Meu Primeiro Chat UDP em Ruby

Estas são as anotações UDP na linguagem Ruby, sendo minha primeira experiência com a linguagem.

---

## Objetivo do Projeto

Criar um chat onde clientes enviam mensagens para o servidor, que repassa essas mensagens para os demais clientes conectados via UDP.

---

## Dificuldades e Aprendizados

### 1. Biblioteca Socket

Para usar recursos de rede, é preciso importar a biblioteca socket:

```ruby
require 'socket'
Sem isso, o código não reconhece `UDPSocket` e não funciona.

---

### 2. Variáveis Devem Estar Definidas

No começo, o código tentava usar variáveis que não existiam, tipo `endereco_servidor`, então troquei para as variáveis que já tinham sido definidas com:

```ruby
endereco = 'localhost'
porta = 6000
```
E usei essas para enviar mensagens.

---

### 3. Cuidado com Vírgulas Erradas

Uma linha tinha duas vírgulas na atribuição:

```ruby
mensagem,, endereco_cliente = servidor.recvfrom(1024)
```
Isso causava erro, então deixei só uma vírgula, que é o correto:
```ruby
mensagem, endereco_cliente = servidor.recvfrom(1024)
```
---

### 4. Importar `Set` para Guardar Clientes

Para armazenar clientes de forma única, usei um `Set`. Mas é preciso importá-lo antes:

```ruby
require 'set'
clientes = Set.new
```
---

### 5. Índices do Endereço de Cliente

O método `recvfrom` retorna um array para o endereço do cliente:
```ruby
endereco_cliente # exemplo: ["127.0.0.1", 12345, "localhost", "127.0.0.1"]
```
O IP está na posição 0 e a porta na posição 1. Usei essas posições para enviar mensagens.
---

### 6. Thread e Loop no Cliente

Para conseguir enviar e receber mensagens ao mesmo tempo, usei uma `Thread` para receber sempre que mensagens chegarem, enquanto no loop principal o usuário pode digitar e enviar mensagens.

---

## Coisas Que Vou Lembrar para Próximos Projetos

- Sempre importar as bibliotecas necessárias.
- Verificar as variáveis usadas para não usar nada indefinido.
- Entender o que as funções retornam, principalmente quando retornam vários valores.
- Testar todo código com `puts` para entender o que acontece.
- Usar comentários para facilitar a leitura.

---

## Conclusão

Foi difícil no começo, mas consegui entender algumas coisa do Ruby
```
alguns sites sobre Ruby:

    Geckoboard Blog - Artigos que exploram a construção de um stack de rede em Ruby, com foco em sockets e datagramas.(https://medium.com/geckoboard-under-the-hood/how-to-build-a-network-stack-in-ruby-f73aeb1b661b)

    Ruby Socket Programming Tutorial - Um tutorial que ensina a criar servidores e clientes usando sockets em Ruby.(https://www.tutorialspoint.com/ruby/ruby_socket_programming.htm)

    The UDPSocket in ruby - Uma discussão no Stack Overflow sobre o uso de UDPSocket. (https://stackoverflow.com/questions/10238804/the-udpsocket-in-ruby)

    Documentation - Ruby: Documentação oficial sobre Ruby, incluindo gems e projetos hospedados no GitHub. (https://www.ruby-lang.org/en/documentation/)

    