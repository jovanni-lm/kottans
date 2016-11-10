# frozen_string_literal: true
require 'fiber'

class CustomEnumerator
  include Enumerable
  attr_accessor :fiber, :n, :list

  def initialize(n)
    @n = n
    @list = []

    @fiber = Fiber.new do
      (1..Float::INFINITY).enum_for(:each).each { |item| Fiber.yield(item**2) }
    end
  end

  def process
    n.times { @list << fiber.resume }
  end
end

enum = CustomEnumerator.new(60)
enum.process
puts enum.list
