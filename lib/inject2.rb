class Array

  def inject2 (argument=nil, arg2=nil, &block)

    if arg2 != nil

      if arg2 == :+
        block = Proc.new { |memo, item| memo + item}
      elsif arg2 == :-
        block = Proc.new { |memo, item| memo - item}
      elsif arg2 == :*
        block = Proc.new { |memo, item| memo * item}
      end

      memo = argument
      self.each do |item|
        memo = block.call(memo, item)
      end
      return memo
    end

    # # methods need to accept Float objects
    # # it doesn't look like we need to convert back though:
    # # arr.inject(2.5) {|m,n| m*n} => 15.0 (float, despite being whole number)

    if argument.is_a? (Fixnum) or argument.is_a? (Float) # why did:   || argument.is_a? (Float)    not work here?
      memo = argument
      self.each do |item|
        memo = block.call(memo, item)
      end
      return memo
    end 

    # refactoring opportunity next 7 lines: control-flow
    if argument == :+
      block = Proc.new { |memo, item| memo + item}
    elsif argument == :-
      block = Proc.new { |memo, item| memo - item}
    elsif argument == :*
      block = Proc.new { |memo, item| memo * item}
    end
  
    memo = self.shift
    self.each do |item|
      memo = block.call(memo, item)
    end
    memo
  end

end