
RSpec.describe RestaurantsController, type: :controller do

  describe "GET #add" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
