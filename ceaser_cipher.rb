def ceaser_cipher(input_string, shift_factor)
  input_string = input_string.strip
  char_codes_of_input = input_string.bytes

  shifted_chars = char_codes_of_input.map do |ascii_number|
    if ascii_number.between? 97, 122
      ascii_number = ascii_number + shift_factor
      ascii_number = ((ascii_number - 97) % 26) + 97

    elsif ascii_number.between? 65, 90
      ascii_number = ascii_number + shift_factor
      ascii_number = ((ascii_number - 65) % 26) + 65
    end

  ascii_number.chr
  end

  shifted_chars.join
end


puts "enter a short sentence you'd like to encrypt"
input_string = gets.chomp.to_s
puts "enter a shift factor"
shift_factor = gets.chomp.to_i

ceaser_cipher(input_string, shift_factor)
