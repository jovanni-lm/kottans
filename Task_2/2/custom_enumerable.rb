
module CustomEnumerable
  include Enumerable

  def custom_select
    result = []
    each { |obj| yield(obj) && result << obj }
    result
  end

  def custom_reduce(storage)
    each do |element|
      storage = yield(storage, element)
    end
    storage
  end

  def maxmin
    [enum_for(:each).peek, enum_for(:reverse_each).peek]
  end
end
