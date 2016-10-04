require 'openssl'

key = "6f2d303f5a325f4744427d35342c515a66384f7864702e5a316b43377b322d70485236717d264a25472c446844763a734d357b4761562945462a442e4d533837"
data = "amount=100&currency=EUR"

# hex to string
puts [key].pack('H*')

puts OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), [key].pack('H*'), data)
