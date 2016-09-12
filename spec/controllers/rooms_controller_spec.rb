require 'rails_helper'

RSpec.describe RoomsController, type: :controller do

  before do
    user = User.create!(email: 'john@yopmail.com',first_name: 'John', last_name: 'Doe', password: 'password', role_id: 1)
    sign_in user
  end

  describe 'GET #index' do
    context 'gets rooms lists' do

      it "populates an array of rooms starting with the letter" do
        room1 = Room.create!( name: 'Room1', capacity: 10)
        room2 = Room.create!( name: 'Room2', capacity: 10)
        get :index
        expect(assigns(:rooms)).to match_array([room1, room2])
      end

      it "renders the :index template" do
        get :index
        expect(response).to render_template :index
      end
    end
  end

  describe 'GET #show' do

    it "assigns the requested room to @room" do
      room = Room.create!( name: 'Room1', capacity: 10)
      get :show, id: room
      expect(assigns(:room)).to eq room
    end

    it "renders the :show template" do
      room = Room.create!( name: 'Room1', capacity: 10)
      get :show, id: room
      expect(response).to render_template :show
    end
  end
end
