# frozen_string_literal: true

require "rails_helper"

RSpec.describe CvsController do
  let!(:user) { create(:user) }
  let!(:theme) { create(:theme) }
  let(:cv) { create(:cv, user:) }
  before { sign_in user }

  shared_examples "it set instance variable cv and theme_name" do
    it { expect(assigns(:cv).id).to eq cv.id }
    it { expect(assigns(:theme_name)).to eq cv.theme.name }
  end

  describe "GET index" do
    before { get :index }
    it { expect(response.status).to eq(200) }
  end

  describe "GET show" do
    before { get :show, params: { id: cv.id } }
    it { expect(response.status).to eq(200) }
    it_behaves_like "it set instance variable cv and theme_name"
  end

  # TODO: Stub grover request
  # describe 'GET export' do
  #   before { allow_any_instance_of(Grover).to receive(:new).and_return('<html></html>') }
  #   before { get :export, params: { id: cv.id } }
  #   it { expect(response.status).to eq(200) }
  #   it_behaves_like 'it set instance variable cv and theme_name'
  # end

  describe "POST create" do
    before { post :create }
    it { expect(response).to redirect_to(cv_path(Cv.last.id)) }
    it { expect(assigns(:cv).theme).to eq Theme.default_theme }
  end

  describe "PATCH update" do
    let(:cv_attributes) { { body_bg: "yellow" } }
    before { patch :update, params: { id: cv.id, cv: cv_attributes } }
    it { expect(response).to redirect_to(cv_path(cv.id)) }
    it_behaves_like "it set instance variable cv and theme_name"
  end

  describe "DELETE destroy" do
    before { delete :destroy, params: { id: cv.id } }
    it { expect(response).to redirect_to(cvs_path) }
    it_behaves_like "it set instance variable cv and theme_name"
  end
end
