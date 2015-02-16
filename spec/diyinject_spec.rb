require 'diyinject'

describe Array do

  describe "Array#diy_inject" do

    context "without an 'initial' argument" do

      describe "addition and related operations" do

        it "can sum some numbers" do
          expect([1,2,3,4].diy_inject { |sum, n| sum + n }).to eq 10
        end

        it "can sum other numbers" do
          expect([5,6,7,8].diy_inject { |sum, n| sum + n }).to eq 26
        end

        it "can concatenate strings" do
          str_array = %w(hello my name is gabe)
          expect(str_array.diy_inject {|sum, n| sum + n }).to eq "hellomynameisgabe"
        end

        it "can subtract numbers from each other, starting with the first element in an array" do
          expect([1,2,3,4].diy_inject { |total, n| total - n }).to eq -8
        end

      end

      describe "multipication and related operations" do

        it "can multiply numbers" do
          expect([1,2,3,4].diy_inject { |product, n| product * n }).to eq 24
        end

        it "can multiply an array of numbers not starting with 1" do
          expect([5,8,10,12].diy_inject { |product, n| product * n }).to eq 4800 
        end

        it "returns 0 if the array includes 0" do
          expect([591,0,32,1].diy_inject { |product, n| product * n }).to eq 0
        end

        it "can handle negative numbers correctly" do
          expect([-1,-2,-3,4].diy_inject { |product, n| product * n }).to eq -24
        end

        it 'can handle exponents correcly' do
          expect([2,3,4].diy_inject   { |product, n| product ** n }).to eq 4096
        end

      end

      describe "using symbols" do

        it "can perform addition without a block by passing :+" do
          expect([5,6,7,8].diy_inject(:+)).to eq 26
        end

        it "can perform multipication without a block by passing :*" do
          expect([1,2,3,4].diy_inject(:*)).to eq 24
        end

        it "can perform - operations" do
          expect([100,1,2,3].diy_inject(:-)).to eq 94
        end

        it "can perform / operations" do
          expect([100,2,2,5].diy_inject(:/)).to eq 5
        end
          
        it "can perform ** operations" do
          expect([2,3,4].diy_inject(:**)).to eq 4096
        end

        it "can perform % operations" do
          expect([100, 51, 25, 13].diy_inject(:%)).to eq 11
        end

      end

    end

    context 'with an argument' do

      describe 'addition and related operations' do

        it 'can sum some numbers including a number passed in the argument' do
          expect([1,2,3,4].diy_inject(2) { |sum, n| sum + n }).to eq 12
        end

      end

      describe "multipication and related operations" do

        it 'can multiply the product of some numbers by the argument' do
          expect([2,3,4,5].diy_inject(2) { |product, n| product * n }).to eq 240
        end

        it 'should return 0 when the argument is 0' do
          expect([1,2,3,4,5].diy_inject(0)  { |product, n| product * n }).to eq 0
        end

      end

      describe "using symbols" do

        it "can perform addition without a block by passing :+" do
          expect([1,2,3,4].diy_inject(1, :+)).to eq 11
        end

        it "can add by passing :+ (with different initial argument)" do
          expect([1,2,3,4].diy_inject(2, :+)).to eq 12
        end

        it "can multiply without a block by passing :*" do
          expect([1,2,3,4].diy_inject(2, :*)).to eq 48
        end

        it "can do - operations" do
          expect([1,2,3,4].diy_inject(100, :-)).to eq 90
        end

        it "can do / operations" do
          expect([2,2,5,1].diy_inject(100,:/)).to eq 5
        end
          
        it "can do ** operations" do
          expect([1,2,3].diy_inject(2,:**)).to eq 64
        end

        it "can do % operations" do
          expect([51, 25, 13].diy_inject(100, :%)).to eq 11
        end
        
      end
    end
  end
end