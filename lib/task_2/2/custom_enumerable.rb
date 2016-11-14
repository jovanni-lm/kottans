
# frozen_string_literal: true
# Custom analogs of Enumerable methods
module CustomEnumerable
  def custom_select
    [].tap { |result| each { |obj| result << obj if yield(obj) } }
  end

  def first
    each do |element|
      return element
    end
  end

  def custom_reduce(storage = nil, op = nil, &block)
    raise ArgumentError, 'arguments can not be empty' if storage.nil? && op.nil? && block.nil?
    raise ArgumentError, 'provide operation symbol or a block' if op && block

    if op.nil? && block.nil?
      op = storage
      storage = nil
    end

    block = op.nil? ? block : ->(acc, value) { acc.send(op, value) }

    if storage.nil?
      ignore = true
      storage = first
    end

    each { |el| storage = block.call(storage, el) unless ignore && el == first }
    storage
  end

  def maxmin
    min = custom_reduce do |storage, element|
      storage > element ? element : storage
    end

    max = custom_reduce do |storage, element|
      storage < element ? element : storage
    end

    [max, min]
  end
end
