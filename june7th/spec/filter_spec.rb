require 'filter.rb'

array = [60,10,45,60,1500]
example_output = [60,40,45,60,1000]

lower = [20]
upper = [1500]
no_change = [500]

three_in_a_row = [20, 1500, 500]

describe Filter do 
    it "applies the default filter to the example array" do 
        f = Filter.new
        expect(f.bandpass(lower)).to eq([40])
        expect(f.bandpass(upper)).to eq([1000])
        expect(f.bandpass(no_change)).to eq([500])
        expect(f.bandpass(three_in_a_row)).to eq([40, 1000, 500])

    end 

    it "applies the filter with user stated limits" do
        f = Filter.new
        expect(f.bandpass(lower, 1100, 50)).to eq([50])
        expect(f.bandpass(upper, 1100, 50)).to eq([1100])
        expect(f.bandpass(no_change, 1100, 50)).to eq([500])
        expect(f.bandpass(three_in_a_row, 1100, 50)).to eq([50, 1100, 500])
    end 

    context "edge cases" do 
    
        
        it "throws error for non integer values" do 
            expect{subject.bandpass([-1])}.to raise_error("non positive integer value present")
            expect{subject.bandpass(["this is a string"])}.to raise_error("non positive integer value present")
            expect{subject.bandpass([0])}.to raise_error("non positive integer value present")
        end 
    end 
end 