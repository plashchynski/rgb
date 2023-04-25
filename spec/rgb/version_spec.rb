require 'spec_helper'

describe RGB do
  describe 'VERSION' do
    it 'returns a version number' do
      expect(RGB::VERSION).not_to be_nil
    end
  end
end