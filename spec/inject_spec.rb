require 'inject_new'

describe Array do
  
  context 'with a block' do

    it 'can add numbers' do
      expect([1,2,3,4,5].inject { |memo, element| memo + element} ).to eq 15
      expect([1,2,3,4,5].inject_new { |memo, element| memo + element} ).to eq 15

    end

    it 'can subtract numbers' do
      expect([1,2,3,4,5].inject { |memo, n| memo - n } ).to eq -13
      expect([1,2,3,4,5].inject_new { |memo, n| memo - n } ).to eq -13
    end

    it 'can multiply numbers' do
      expect([1,2,3,4,5].inject { |memo, n| memo * n } ).to eq 120
    end 
  end

  context 'with a symbol' do

    it 'can add numbers' do
      expect([1,2,3,4,5].inject(:+)).to eq 15
    end
    
    it 'can add subtract numbers' do
      expect([1,2,3,4,5].inject(:-)).to eq -13
    end

    it 'can multiply numbers in an array' do
      expect([1,2,3,4,5].inject(:*)).to eq 120
    end
  end

  context 'with an argument and a block' do

    it 'can add with a starting point' do
      expect([1,2,3,4,5].inject(5) { |memo, n| memo + n } ).to eq 20
      expect([3,4,7,9].inject(2) { |memo, n| memo + n } ).to eq 25
    end
  end

  context 'with a symbol argument' do

    it 'can add with a starting point and a symbol' do
      expect( [1,3,5].inject(5,:+) ).to eq 14
    end
  end

  context 'a' do

    it 'can find the longest word' do
      longest = %w{ abe gabe gabby }.inject do |memo, word|
        memo.length > word.length ? memo : word
      end
      expect(longest).to eq "gabby"
    end
  end
end


# find the longest word
# longest = %w{ cat sheep bear }.inject do |memo, word|
   # memo.length > word.length ? memo : word
   # if the "memo.length > word.length" is true, then return memo, if false - return word
# end
# longest                                        #=> "sheep"
