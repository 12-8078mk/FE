require 'rails_helper'

RSpec.describe Car, type: :model do
  describe '#create' do
    context 'can save' do
      it 'is valid with car' do
        expect(build(:car)).to be_valid
      end

      it 'is valid with car' do
        expect(build(:car, image: nil)).to be_valid
      end
    end

    context 'can not save' do
      it 'is invalid without car_name' do
        car = build(:car, car_name: nil)
        car.valid?
        expect(car.errors[:car_name]).to include("を入力してください")
      end

      it 'is invalid without first_range' do
        car = build(:car, first_range: nil)
        car.valid?
        expect(car.errors[:first_range]).to include("を入力してください")
      end

      it 'is invalid without user_id' do
        car = build(:car, user_id: nil)
        car.valid?
        expect(car.errors[:user]).to include("を入力してください")
      end
    end
  end
end