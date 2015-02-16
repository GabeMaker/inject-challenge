class Array

  def diy_inject(initial=:no_initial_given, symbol="no_symbol_given")

    return self.diy_inject { |x,y| x + y} if initial == :+
    return self.diy_inject { |x,y| x * y} if initial == :*
    return self.diy_inject { |x,y| x - y} if initial == :-
    return self.diy_inject { |x,y| x / y} if initial == :/
    return self.diy_inject { |x,y| x ** y} if initial == :**
    return self.diy_inject { |x,y| x % y} if initial == :%

    if symbol != "no_symbol_given"
      return self.diy_inject(initial) { |x,y| x + y} if symbol == :+
      return self.diy_inject(initial) { |x,y| x * y} if symbol == :*
      return self.diy_inject(initial) { |x,y| x - y} if symbol == :-
      return self.diy_inject(initial) { |x,y| x / y} if symbol == :/
      return self.diy_inject(initial) { |x,y| x ** y} if symbol == :**
      return self.diy_inject(initial) { |x,y| x % y} if symbol == :%
    end

    if initial != :no_initial_given
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

arr.inject(1,)