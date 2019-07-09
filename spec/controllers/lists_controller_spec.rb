require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe ListsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # List. As you add validations to List, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {description: "This is my first task"}
  }

  let(:invalid_attributes) {
    {description: ''}
  }


  describe "GET #index" do
    it "returns a success response" do
      List.create! valid_attributes
      get :index
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new List" do
        expect {
          post :create, params: {list: valid_attributes}
        }.to change(List, :count).by(1)
      end

      it "redirects to the root url" do
        post :create, params: {list: valid_attributes}
        expect(response).to redirect_to(root_url)
        expect(flash[:notice]).to match(/List was successfully created./)
      end
    end

    context "with invalid params" do
      it "returns an error message when format is html" do
        post :create, params: {list: invalid_attributes}
        expect(response).to redirect_to(root_url)
        expect(flash[:alert]).to match(/We could not add the task. Description can't be blank/)
      end

      it "returns a 422 response when format is json" do
        post :create, params: {list: invalid_attributes, :format => :json }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {description: "first task is first"}
      }

      it "updates the requested list" do
        list = List.create! valid_attributes
        put :update, params: {id: list.to_param, list: new_attributes}
        list.reload
        expect(list.description).to eq(new_attributes[:description])
      end

      it "redirects to the root url" do
        list = List.create! valid_attributes
        put :update, params: {id: list.to_param, list: valid_attributes}
        expect(response).to redirect_to(root_url)
        expect(flash[:notice]).to match(/List was successfully updated./)
      end
    end

    context "with invalid params" do
      it "returns an error message when format is html" do
        list = List.create! valid_attributes 
        put :update, params: {id: list.to_param, list: invalid_attributes}
        expect(response).to redirect_to(root_url)
        expect(flash[:alert]).to match(/We could not update the task./)
      end

      it "returns a 422 response when format is json" do
        list = List.create! valid_attributes 
        put :update, params: {id: list.to_param, list: invalid_attributes, :format => :json }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested list" do
      list = List.create! valid_attributes
      expect {
        delete :destroy, params: {id: list.to_param}
      }.to change(List, :count).by(-1)
    end

    it "redirects to the root url" do
      list = List.create! valid_attributes
      delete :destroy, params: {id: list.to_param}
      expect(response).to redirect_to(root_url)
    end
  end

end
