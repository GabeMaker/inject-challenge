require 'inject2'

describe Array do

  context 'with a block' do

    it "can add numbers together" do
      # expect([1,2,3,4].inject { |memo, item| memo + item }).to eq 10
      expect([1,2,3,4].inject2{ |memo, item| memo + item} ).to eq 10
    end

    it "can minus numbers" do
      # expect([1,2,3,4].inject { |memo, item| memo - item}).to eq -8
      expect([1,2,3,4].inject2 { |memo, item| memo - item} ).to eq -8
    end

    it "can multiply numbers" do
      # expect([1,2,3,4].inject { |memo, item| memo * item}).to eq 24
      expect([1,2,3,4].inject2 { |memo, item| memo * item}).to eq 24
    end
    
  end

  context 'with a symbol' do

    it 'can add numbers' do
      # expect([1,2,3,4].inject(:+)).to eq 10
      expect([1,2,3,4].inject2(:+)).to eq 10

    end
    
    it 'can subtract numbers' do
      # expect([1,2,3,4,5].inject(:-)).to eq -13
      expect([1,2,3,4,5].inject2(:-)).to eq -13
    end

    it 'can multiply numbers in an array' do
      # expect([1,2,3,4,5].inject(:*)).to eq 120
      expect([1,2,3,4,5].inject2(:*)).to eq 120

    end
  end

  context 'with an argument and a block' do

    it 'can add with a starting point' do
      # expect([1,2,3,4,5].inject(5) { |memo, n| memo + n } ).to eq 20
      expect([1,2,3,4,5].inject2(5) { |memo, n| memo + n } ).to eq 20
    end
  
    it 'can subtract' do
      # expect([1,2,3,4,5].inject(5) { |memo, n| memo - n } ).to eq -10
      expect([1,2,3,4,5].inject2(5) { |memo, n| memo - n } ).to eq -10
    end

    it 'can multiply' do
      # expect([1,2,3,4,5].inject(5) { |memo, n| memo * n } ).to eq 600
      expect([1,2,3,4,5].inject2(5) { |memo, n| memo * n } ).to eq 600
    end

  end

  context 'with an argument and with a symbol' do

    it 'can add with a starting point and a symbol' do
      # expect( [1,2,3,4,5].inject(5,:+) ).to eq 20
      expect( [1,2,3,4,5].inject2(5,:+) ).to eq 20
    end

    it 'can subtract with a starting point and a symbol' do
      # expect( [1,2,3,4,5].inject(5,:-) ).to eq -10
      expect( [1,2,3,4,5].inject2(5,:-) ).to eq -10
    end

    it 'can multiply with a starting point and a symbol' do
      # expect( [1,2,3,4,5].inject(5,:*) ).to eq 600
      expect( [1,2,3,4,5].inject2(5,:*) ).to eq 600
      end    
  end

  context 'letter functionality from inject ruby docs' do

    it 'can find the longest word' do
      longest = %w{ abe gabe gabby }.inject2 do |memo, word|
        memo.length > word.length ? memo : word
      end
      expect(longest).to eq "gabby"
    end
  end

end
