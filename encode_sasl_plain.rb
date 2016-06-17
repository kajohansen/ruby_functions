#!/usr/bin/ruby
require "base64"

if ( ARGV.length < 1 )
	puts("Usage: encode_sasl_plain.pl <username> <password>")
  exit 0
end

print Base64.encode64(ARGV[0] + "\0" + ARGV[0] + "\0" + ARGV[1])

exit 0