#!/usr/bin/ruby

require 'em-websocket'

EventMachine.run {
  EventMachine::WebSocket.run(:host => "0.0.0.0", :port => 5301) do |ws|
    ws.onopen { |handshake|
				      puts "WebSocket connection open"
		
				      # Access properties on the EventMachine::WebSocket::Handshake object, e.g.
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
