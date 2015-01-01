class Array
  def inject2
    @mem = 0
    self.each do |x|
      @mem = x + @mem
    end
    @mem
  end
end