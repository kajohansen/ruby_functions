#!/usr/bin/ruby

require 'em-websocket'

<<<<<<< HEAD
EventMachine.run {
  EventMachine::WebSocket.run(:host => "0.0.0.0", :port => 5301) do |ws|
    ws.onopen { |handshake|
				      puts "WebSocket connection open"
		
				      # Access properties on the EventMachine::WebSocket::Handshake object, e.g.
=======
EM.run {
  EM::WebSocket.run(:host => "0.0.0.0", :port => 5301) do |ws|
    ws.onopen { |handshake|
				      puts "WebSocket connection open"
							puts "WebSocket opened #{{
		           :path => handshake.path,
		           :query => handshake.query,
		           :origin => handshake.origin,
		          }}"	

				      # Access properties on the EM::WebSocket::Handshake object, e.g.
>>>>>>> 0b2939e4be9f1251ac51b960127637a98f662705
				      # path, query_string, origin, headers
		
				      # Publish message to the client
				      ws.send "Hello Client, you connected to #{handshake.path}"
				    }

    ws.onclose { puts "Connection closed" }

    ws.onmessage { |msg|
				      puts "Recieved message: #{msg}"
				      ws.send "Pong: #{msg}"
				    }
  end
}
