get '/' do
  # Look in app/views/index.erb
  if session[:value]
    redirect to ('/students/index')
  else
    erb :index
  end
end

post '/students/login' do
  # raise params[:password]
  @student = Student.where(email: params[:email]).first
  if @student && @student.authenticate(params[:password])
    session[:value] = @student.id
    redirect to ('/students/index')
  else
    'false'
  end

end

post '/students/signup' do

  student_info = params[:user_info]
  @student = Student.new(student_info)

  if @student.save
    session[:value] = @student.id
    redirect to ('/students/index')
  else
    redirect to ('/students/login')
  end

end

get '/students/index' do
  @student = Student.find(session[:value])
  @orgs = Organization.all

  erb :'students/index'
end

get '/students/logout' do
  session.clear
  redirect to ('/')
end

get '/organization/new' do
  erb :'organization/new'
end


post '/organization/new' do

  org_info = params[:org_info]
  name = org_info[:name]
  description = org_info[:description]
  student = Student.where(first_name: org_info[:presidentf], last_name: org_info[:presidentl]).first
  president = student.id
  @organization = Organization.new(name: name, description: description, president_id: president)
  if @organization.save
    @org = Organization.last
    erb :'organization/show'
  else
    redirect to ('/')
  end
end

get '/organization/:id' do
  @org = Organization.find(params[:id])
  erb :'organization/show'
end

delete '/organization/:id' do
  # raise params.inspect
  @organization = Organization.find(params[:id])
  @organization.destroy
  redirect to ("/")
end


post '/create' do
  request.xhr?
end
