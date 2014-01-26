require 'spec_helper'

describe Cubestorm::Config do

  let(:config) { Cubestorm::Config }

  describe 'standard configuration' do

    let(:expected) { true }

    before do
      Cubestorm.config do |settings|
        settings.orthogonal = true
      end
    end

    it 'correctly applies the value to the desired setting' do
      expect(config.orthogonal).to eq(expected)
    end

  end

  describe 'access attempt to undefined setting' do

    let(:expected_error) { Cubestorm::Errors::SettingNotConfigured }

    before do
      Cubestorm::Config.orthogonal = nil
    end

    it 'raises a SettingNotConfigured error' do
      expect { config.orthogonal }.to raise_error(expected_error)
    end

  end

end
