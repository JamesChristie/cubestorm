require 'spec_helper'

describe Cubestorm::Config do

  let(:config) { Cubestorm::Config }

  before do
    Cubestorm::Config.option :test_option, default: false
  end

  describe 'standard configuration' do

    let(:expected) { true }

    before do
      Cubestorm.config do |settings|
        settings.test_option = true
      end
    end

    it 'correctly applies the value to the desired setting' do
      expect(config.test_option).to eq(expected)
    end

  end

  describe 'access attempt to undefined setting' do

    let(:expected_error) { Cubestorm::Errors::SettingNotConfigured }

    before do
      Cubestorm::Config.test_option = nil
    end

    it 'raises a SettingNotConfigured error' do
      expect { config.test_option }.to raise_error(expected_error)
    end

  end

  describe 'defaulting a changed setting' do

    before do
      Cubestorm::Config.test_option = 'schwa'
      Cubestorm::Config.default_test_option!
    end

    it 'defaults the setting' do
      expect(config.test_option).to eq(false)
    end

  end

end
