class EncryptionEngine

	def initialize
		@key = 13
	end

	def encrypt(message)
		array_message = []
		message.each_byte do |s|
			if (s>=65 && s<=90 && s+@key>90) || (s>=97 && s<=122 && s+@key>122)
				array_message << (s+@key-26)
			else
				if s==32
					array_message << (s)
				else
					array_message << (s+@key)
				end
			end
		end
		array_message.map{|c| c.chr}.join
	end

	def decrypt(message)
		array_message = []
		message.each_byte do |s|
			if (s>=65 && s<=90 && s-@key<65) || (s>=97 && s<=122 && s-@key<97)
				array_message << (s-@key+26)
			else
				if s==32
					array_message << (s)
				else
					array_message << (s-@key)
				end
			end
		end
		array_message.map{|c| c.chr}.join
	end
end


# do your encryption here
#puts array_message
message ="Thiàé is a secrez"
engine = EncryptionEngine.new

puts 'Encrypted message: '+ engine.encrypt(message)
puts 'Decrypted message: '+ engine.decrypt(engine.encrypt(message))