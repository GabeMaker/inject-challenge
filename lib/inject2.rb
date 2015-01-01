class Array
  
# { |mem, n| mem + n} - the block we are working with

  def inject2 (symbol, &block)
    if symbol == :+
      block = Proc.new { |memo, item| memo + item}
    end
    memo = self.shift
    self.each do |item|
      memo = block.call(memo, item)
    end
    memo
  end

end