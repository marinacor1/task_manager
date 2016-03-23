class TaskManagerApp < Sinatra::Base

  get '/' do #this is the controller's single route
    erb :dashboard #will look for an erb file called dashboard
  end

  get '/tasks' do #adding a route #READ for all the tasks
    @tasks = task_manager.all
    erb :index
  end

  get '/tasks/new' do #CREATE ?? It could be read because it's a get
    erb :new
  end

  post '/tasks' do #using post bc its data to be processed (Get is for data from a specific source) #Create
    task_manager.create(params[:task])
    redirect '/tasks' #once task is created
  end

  get '/tasks/:id' do |id| #will change address to match task #update
    @task = task_manager.find(id.to_i)
    erb :show
  end

  get '/tasks/:id/edit' do |id| #update
    @task = task_manager.find(id.to_i)
    erb :edit
  end

  put '/tasks/:id' do |id| #update
    task_manager.update(id.to_i, params[:task])
    redirect "/tasks/#{id}"
  end

  delete '/tasks/:id' do |id|
    puts "this is the id: #{id}!!!!"
    task_manager.delete(id.to_i)
    redirect "/tasks"
  end

  def task_manager
    database = YAML::Store.new('db/task_manager') #YAML is the database. File is white space sensitive.
    @task_manager ||= TaskManager.new(database) #tasks are created here
  end
end
