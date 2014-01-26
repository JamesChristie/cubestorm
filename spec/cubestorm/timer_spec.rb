require 'spec_helper'

describe Cubestorm::Timer do

  let(:timer) { Cubestorm::Timer.new }

  describe 'limit assignment' do

    let(:default) { Cubestorm::Config.frame_limit_default_value }

    before do
      Cubestorm::Config.frame_limit = number
    end

    context 'a positive number' do

      let(:number) { 30 }

      it 'is equal to the given number' do
        expect(timer.frame_limit).to eq(number)
      end

    end

    context 'a negative number' do

      let(:number) { -28 }

      it 'is defaulted' do
        expect(timer.frame_limit).to eq(default)
      end

    end

    context 'zero' do

      let(:number) { 0 }

      it 'is defaulted' do
        expect(timer.frame_limit).to eq(default)
      end

    end

  end

  describe '#framerate' do

    it 'calculates the framerate'

  end

end
