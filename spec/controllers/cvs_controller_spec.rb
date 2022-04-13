require "rails_helper"

RSpec.describe CvsController do
  let!(:user) { create(:user) }
  let(:theme) { create(:theme) }
  let(:cv) { create(:cv, user: user) }
  before { sign_in user }

  describe 'GET index' do
    before { get :index }
    it { expect(response.status).to eq(200) }
  end

  describe 'GET show' do
    before { get :show, params: { id: cv.id } }
    it { expect(response.status).to eq(200) }
  end

  # Todo: Stub grover request
  # describe 'GET export' do
  #   let(:theme) { create(:theme) }
  #   let!(:cv) { create(:cv, user: user) }
  #   before { get :export, params: { id: cv.id } }
  #   it { expect(response.status).to eq(200) }
  # end

  describe 'POST create' do
    let!(:cv) { build(:cv, user: user) }
    before { post :create, params: { cv: cv } }
    it { expect(response).to redirect_to(cv_path(Cv.last.id)) }
  end

  describe 'PATCH update' do
    let (:cv_attributes) { {body_bg: "yellow"} }
    before { patch :update, params: { id: cv.id, cv: cv_attributes } }
    it { expect(response).to redirect_to(cv_path(cv.id)) }
  end

  describe 'DELETE destroy' do
    before { delete :destroy, params: { id: cv.id } }
    it { expect(response).to redirect_to(cvs_path) }
  end

end
