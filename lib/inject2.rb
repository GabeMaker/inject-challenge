class Array
  
# { |mem, n| mem + n} - the block we are working with

  def inject2 &block
    memo = self.shift
    self.each do |item|
      memo = block.call(memo, item)
    end
    memo
  end

end