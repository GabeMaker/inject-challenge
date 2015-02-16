class Array

  def diy_inject(initial=nil, symbol="no_symbol_given")

    if initial.class == Symbol
      return self.diy_inject {|x,y| x.send(initial,y)}
    end

    if symbol != "no_symbol_given"
      return self.diy_inject(initial) { |x,y| x + y} if symbol == :+
      return self.diy_inject(initial) { |x,y| x * y} if symbol == :*
      return self.diy_inject(initial) { |x,y| x - y} if symbol == :-
      return self.diy_inject(initial) { |x,y| x / y} if symbol == :/
      return self.diy_inject(initial) { |x,y| x ** y} if symbol == :**
      return self.diy_inject(initial) { |x,y| x % y} if symbol == :%
    end

    if initial != nil
      self.unshift(initial)
    end
  
    memo = self[0]
    self.each_with_index do |item, index|
      if index == 0
        next
      end
      memo = yield memo, item
    end 
    memo
  end

end