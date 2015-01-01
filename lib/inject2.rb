class Array

  def inject2 (symbol, &block)
    # refactoring opportunity lines 5-11: control-flow
    if symbol == :+
      block = Proc.new { |memo, item| memo + item}
    elsif symbol == :-
      block = Proc.new { |memo, item| memo - item}
    elsif symbol == :*
      block = Proc.new { |memo, item| memo * item}
    end
      
    memo = self.shift
    self.each do |item|
      memo = block.call(memo, item)
    end
    memo
  end

end