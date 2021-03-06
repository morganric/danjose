require 'spec_helper'

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

describe GuessesController do

  # This should return the minimal set of attributes required to create a valid
  # Guess. As you add validations to Guess, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "photo_id" => "1" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # GuessesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all guesses as @guesses" do
      guess = Guess.create! valid_attributes
      get :index, {}, valid_session
      assigns(:guesses).should eq([guess])
    end
  end

  describe "GET show" do
    it "assigns the requested guess as @guess" do
      guess = Guess.create! valid_attributes
      get :show, {:id => guess.to_param}, valid_session
      assigns(:guess).should eq(guess)
    end
  end

  describe "GET new" do
    it "assigns a new guess as @guess" do
      get :new, {}, valid_session
      assigns(:guess).should be_a_new(Guess)
    end
  end

  describe "GET edit" do
    it "assigns the requested guess as @guess" do
      guess = Guess.create! valid_attributes
      get :edit, {:id => guess.to_param}, valid_session
      assigns(:guess).should eq(guess)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Guess" do
        expect {
          post :create, {:guess => valid_attributes}, valid_session
        }.to change(Guess, :count).by(1)
      end

      it "assigns a newly created guess as @guess" do
        post :create, {:guess => valid_attributes}, valid_session
        assigns(:guess).should be_a(Guess)
        assigns(:guess).should be_persisted
      end

      it "redirects to the created guess" do
        post :create, {:guess => valid_attributes}, valid_session
        response.should redirect_to(Guess.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved guess as @guess" do
        # Trigger the behavior that occurs when invalid params are submitted
        Guess.any_instance.stub(:save).and_return(false)
        post :create, {:guess => { "photo_id" => "invalid value" }}, valid_session
        assigns(:guess).should be_a_new(Guess)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Guess.any_instance.stub(:save).and_return(false)
        post :create, {:guess => { "photo_id" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested guess" do
        guess = Guess.create! valid_attributes
        # Assuming there are no other guesses in the database, this
        # specifies that the Guess created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Guess.any_instance.should_receive(:update_attributes).with({ "photo_id" => "1" })
        put :update, {:id => guess.to_param, :guess => { "photo_id" => "1" }}, valid_session
      end

      it "assigns the requested guess as @guess" do
        guess = Guess.create! valid_attributes
        put :update, {:id => guess.to_param, :guess => valid_attributes}, valid_session
        assigns(:guess).should eq(guess)
      end

      it "redirects to the guess" do
        guess = Guess.create! valid_attributes
        put :update, {:id => guess.to_param, :guess => valid_attributes}, valid_session
        response.should redirect_to(guess)
      end
    end

    describe "with invalid params" do
      it "assigns the guess as @guess" do
        guess = Guess.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Guess.any_instance.stub(:save).and_return(false)
        put :update, {:id => guess.to_param, :guess => { "photo_id" => "invalid value" }}, valid_session
        assigns(:guess).should eq(guess)
      end

      it "re-renders the 'edit' template" do
        guess = Guess.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Guess.any_instance.stub(:save).and_return(false)
        put :update, {:id => guess.to_param, :guess => { "photo_id" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested guess" do
      guess = Guess.create! valid_attributes
      expect {
        delete :destroy, {:id => guess.to_param}, valid_session
      }.to change(Guess, :count).by(-1)
    end

    it "redirects to the guesses list" do
      guess = Guess.create! valid_attributes
      delete :destroy, {:id => guess.to_param}, valid_session
      response.should redirect_to(guesses_url)
    end
  end

end
