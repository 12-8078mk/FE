require 'rails_helper'

describe InfomationsController do
  let(:car) { create(:car) }
  let(:user) { create(:user) }

  describe '#index' do

    context 'log in' do
      before do
        login user
        get :index, params: { car_id: car.id }
      end

      it 'assigns @infomation' do
        expect(assigns(:infomation)).to be_a_new(Infomation)
      end

      it 'assigns @car' do
        expect(assigns(:car)).to eq car
      end

      it 'renders index' do
        expect(response).to render_template :index
      end
    end

    context 'not log in' do
      before do
        get :index, params: { car_id: car.id }
      end

      it 'redirects to new_user_session_path' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end