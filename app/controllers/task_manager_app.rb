require 'models/task_manager'

class TaskManagerApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__) #sets root of project

  get '/' do #this is the controller's single route
    erb :dashboard #will look for an erb file called dashboard
  end

  get '/tasks' do #adding a route
    @tasks = task_manager.all
    erb :index
  end

  get '/tasks/new' do
    erb :new
  end

  post '/tasks' do #using post bc its data to be processed (Get is for data from a specific source)
    task_manager.create(params[:task])
    redirect '/tasks' #once task is created
  end

  post '/tasks/:id' do |id| #will change address to match task
    @task = task_manager.find(id.to_i)
    erb :show
  end

  def task_manager
    database = YAML::Store.new('db/task_manager')
    @task_manager ||= TaskManager.new(database) #tasks are created here
  end
end
