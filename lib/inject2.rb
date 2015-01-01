class Array

  def inject2 (argument=nil, &block)
    # refactoring opportunity next 7 lines: control-flow
    if argument == :+
      block = Proc.new { |memo, item| memo + item}
    elsif argument == :-
      block = Proc.new { |memo, item| memo - item}
    elsif argument == :*
      block = Proc.new { |memo, item| memo * item}
    end
      
    # if argument is integer


    memo = self.shift
    self.each do |item|
      memo = block.call(memo, item)
    end
    memo
  end

end