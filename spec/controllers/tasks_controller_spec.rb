# spec/controllers/tasks_controller_spec.rb
require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  let(:user) { create(:user) }
  let(:task) { create(:task, user: user) }

  before do
    sign_in user
  end

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { id: task.id }
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Task" do
        expect {
          post :create, params: { task: attributes_for(:task) }
        }.to change(Task, :count).by(1)
      end

      it "redirects to the created task" do
        post :create, params: { task: attributes_for(:task) }
        expect(response).to redirect_to(Task.last)
      end
    end

    context "with invalid params" do
      it "renders the new template" do
        post :create, params: { task: attributes_for(:task, title: nil) }
        expect(response).to render_template("new")
      end
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit, params: { id: task.id }
      expect(response).to be_successful
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { title: "Updated Title" }
      }

      it "updates the requested task" do
        put :update, params: { id: task.id, task: new_attributes }
        task.reload
        expect(task.title).to eq("Updated Title")
      end

      it "redirects to the task" do
        put :update, params: { id: task.id, task: new_attributes }
        expect(response).to redirect_to(task)
      end
    end

    context "with invalid params" do
      it "renders the edit template" do
        put :update, params: { id: task.id, task: { title: nil } }
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested task" do
      task_to_delete = create(:task, user: user)
      expect {
        delete :destroy, params: { id: task_to_delete.id }
      }.to change(Task, :count).by(-1)
    end

    it "redirects to the tasks list" do
      delete :destroy, params: { id: task.id }
      expect(response).to redirect_to(tasks_url)
    end
  end
end
