
# frozen_string_literal: true
def calculator
  a = input_values('type A:')
  b = input_values('type B:')
  operator = input_operator

  puts "Result: #{a.send(operator, b)}"
end

def input_values(msg)
  puts msg
  until (value = gets.chomp) == value.to_i.to_s || value == value.to_f.to_s
    puts 'Illegal value'
  end
  value.to_f
end

def input_operator
  puts 'select one of operations: +, -, *, /'
  until ['+', '-', '*', '/'].include? operator = gets.chomp
    puts 'Illegal value'
  end
  operator
end

calculator
