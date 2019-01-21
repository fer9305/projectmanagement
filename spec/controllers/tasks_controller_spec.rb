require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

RSpec.describe TasksController, type: :request do
  let!(:task) {FactoryGirl.create(:task)}
  let(:user) {FactoryGirl.create(:user)}

  describe '#update' do
    context 'with authenticated user' do
      before(:each) do
        login_as user
      end

      it 'should update task' do
        put project_task_path(task), params: {task: {name: 'Stub' }}

        task.reload
        expect(task.name).to eq('Stub')
      end
    end

    context 'with not authenticated user' do

      it 'should return status 200' do
        get '/projects'

        expect(response.status).to eq(302)
      end
    end
  end
end