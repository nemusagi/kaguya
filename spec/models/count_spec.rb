require 'rails_helper'

RSpec.describe Count, type: :model do
  before do
 @count = FactoryBot.build(:count)
  end
  describe 'カウンター新規作成' do
    context '新規作成できる場合' do
      it "カウントが新規作成できる" do
        expect(@count).to be_valid
      end
    end
  end
end