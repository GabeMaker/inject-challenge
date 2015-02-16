class Array

  def diy_inject(initial=nil, symbol=nil)

    return self.diy_inject {|x,y| x.send(initial,y )} if initial.class == Symbol
    return self.diy_inject(initial) {|x,y| x.send(symbol, y)} if symbol.class == Symbol

    self.unshift(initial) if initial != nil
    memo = self[0]
    
    self.each_with_index do |item, index|
      next if index == 0
      memo = yield memo, item
    end
    memo
  end

end