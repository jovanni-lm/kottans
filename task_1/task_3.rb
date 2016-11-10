
# frozen_string_literal: true
class Todo
  attr_reader :name, :status

  def initialize(name)
    @name = name
    @status = :todo
  end

  def done!
    @status = :done
  end

  def cancel!
    @status = :cancel
  end
end

class TodoList
  def initialize
    @list = []
  end

  def add(todo)
    @list << Todo.new(todo)
  end

  def done!(todo_index)
    @list[todo_index]&.done!
  end

  def cancel!(todo_index)
    @list[todo_index]&.cancel!
  end

  def list
    @list.each_with_index do |todo, index|
      puts "#{index}: #{todo.name} - #{todo.status}"
    end
  end
end

todo = TodoList.new
puts "type new Todo name or 'update'"

loop do
  input = gets.chomp
  if input == 'update'
    puts 'type a sequence number of Todo element:'
    element_index = gets.chomp
    puts 'done or cancel?'
    status = gets.chomp
    if %w(done cancel).include? status
      todo.send("#{status}!", element_index.to_i)
    else
      puts 'wrong status'
    end
  else
    todo.add(input)
  end

  todo.list
end
