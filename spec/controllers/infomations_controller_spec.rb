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
  describe '#create' do
    let(:params) { { car_id: car.id, user_id: user.id, infomation: attributes_for(:infomation) } }

    context 'log in' do
      before do
        login user
      end

      context 'can save' do
        subject {
          post :create,
          params: params
        }

        it 'count up infomation' do
          expect{ subject }.to change(Infomation, :count).by(1)
        end

        it 'redirects to car_infomations_path' do
          subject
          expect(response).to redirect_to(car_infomations_path(car))
        end
      end

      context 'can not save' do
        let(:invalid_params) { { car_id: car.id, user_id: user.id, infomation: attributes_for(:infomation, refuel: nil, refuelday: nil, trip: nil, cost: nil, fueltype_id: nil) } }

        subject {
          post :create,
          params: invalid_params
        }

        it 'does not count up' do
          expect{ subject }.not_to change(Infomation, :count)
        end

        it 'renders index' do
          subject
          expect(response).to render_template :new
        end
      end
    end

    context 'not log in' do

      it 'redirects to new_user_session_path' do
        post :create, params: params
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end