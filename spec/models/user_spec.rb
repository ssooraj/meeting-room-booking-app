require 'rails_helper'

RSpec.describe User, type: :model do
  it "returns a users's full name as a string" do
    user = User.create!(email: 'john@yopmail.com',first_name: 'John', last_name: 'Doe', password: 'password', role_id: 1)
    expect(user.full_name).to eq 'John Doe'
  end

  it "returns true if the user is admin" do
    admin = User.create!(email: 'john@yopmail.com',first_name: 'John', last_name: 'Doe', password: 'password', role_id: 1)
    expect(admin.is_admin?).to be true
  end

  it "returns false if the user is not admin" do
    admin = User.create!(email: 'john@yopmail.com',first_name: 'John', last_name: 'Doe', password: 'password', role_id: 2)
    expect(admin.is_admin?).to be false
  end
end
