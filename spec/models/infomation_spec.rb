require 'rails_helper'

RSpec.describe Infomation, type: :model do
  describe '#create' do
    context 'can save' do
      it 'is valid with refuel, cost, trip,fueltype and refuelday ' do
        expect(build(:infomation)).to be_valid
      end
    end

    context 'can not save' do
      it 'is invalid without infomation' do
        infomation = build(:infomation, refuel: nil)
        infomation.valid?
        expect(infomation.errors[:refuel]).to include("を入力してください")
      end

      it 'is invalid without infomation' do
        infomation = build(:infomation, cost: nil)
        infomation.valid?
        expect(infomation.errors[:cost]).to include("を入力してください")
      end

      it 'is invalid without infomation' do
        infomation = build(:infomation, trip: nil)
        infomation.valid?
        expect(infomation.errors[:trip]).to include("を入力してください")
      end

      it 'is invalid without infomation' do
        infomation = build(:infomation, fueltype_id: nil)
        infomation.valid?
        expect(infomation.errors[:fueltype_id]).to include("を選択してください")
      end

      it 'is invalid without car_id' do
        infomation = build(:infomation, car_id: nil)
        infomation.valid?
        expect(infomation.errors[:car]).to include("を入力してください")
      end

      it 'is invalid without user_id' do
        infomation = build(:infomation, user_id: nil)
        infomation.valid?
        expect(infomation.errors[:user]).to include("を入力してください")
      end
    end
  end
end