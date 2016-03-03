
RSpec.describe RestaurantsController, type: :controller do

  describe "GET #add" do
    xit "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
end
