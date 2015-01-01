require 'inject2'

describe Array do

  context 'with a block' do

    it "can add numbers together" do
      # expect([1,2,3,4].inject { |memo, item| item + item }).to eq 10
      expect([1,2,3,4].inject2{ |memo, item| memo + item} ).to eq 10
    end

    it "can minus numbers" do
      # expect([5,1,2,3,4].inject { |memo, item| memo - item}).to eq -5
      expect([1,2,3,4].inject2 { |memo, item| memo - item} ).to eq -5
    end

    # it "can multiply numbers" do
    #   expect([1,2,3,4].inject { |memo, item| memo * item}).to eq 24
    # end
    
  end

end
