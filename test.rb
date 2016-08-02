def valid_number?(number)
      number.match /^\d{10}$/
end

p valid_number?("012345678")