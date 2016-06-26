require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it "requires a first name"
    it "requires a last name"
    it "requires an email"
    it "requires a unique email"
  end
end
