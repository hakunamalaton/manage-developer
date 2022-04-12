require 'rails_helper'

RSpec.describe Developer, type: :model do
  context 'validation test' do 
    it 'ensures email presence' do
      developer = Developer.new().save   
      expect(developer).to eq(false)
    end
  end
end
