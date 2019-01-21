require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

RSpec.describe ProjectsController, type: :request do
  let!(:project) {FactoryGirl.create(:project)}
  let(:user) {FactoryGirl.create(:user)}

  describe '#index' do
    context 'with authenticated user' do
      before(:each) do
        login_as user
      end

      it 'should return status 200' do
        get '/projects'

        expect(response.status).to eq(200)
        expect(response).to render_template(:index)
      end
    end

    context 'with not authenticated user' do

      it 'should return status 200' do
        get '/projects'

        expect(response.status).to eq(302)
      end
    end
  end

  describe '#update' do
    context 'with authenticated user' do
      before(:each) do
        login_as user
      end

      it 'should update project name' do
        put project_path(project), params: { project: { name: 'Stub' } }

        project.reload
        expect(project.name).to eq('Stub')
      end
    end

    context 'with not authenticated user' do

      it 'should return status 200' do
        put project_path(project), params: { project: { name: 'Stub' } }

        expect(response.status).to eq(302)
      end
    end
  end
end