class DBZController < Sinatra::Base
  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  configure :development do
    register Sinatra::Reloader
  end

    get "/" do
      @title = "Dragonball Z Characters"
      @characters = Character.all
      erb :"characters/index"
    end

    get "/new" do
      @character = Character.new
      @character.id = ""
      erb :"characters/new"
    end

    get "/:id" do
      id = params[:id].to_i
      @character = Character.find(id)
      erb :"characters/show"
    end

    post "/" do
      character = Character.new
      character.name = params[:name]
      character.signature = params[:signature]
      character.arc = params[:arc]
      character.save
      redirect "/"
    end

    get "/:id/edit" do
      id = params[:id].to_i
      @character = Character.find(id)
      erb :"characters/edit"
    end

    put "/:id" do
      id = params[:id].to_i
      character = Character.find(id)
      character.name = params[:name]
      character.signature = params[:signature]
      character.arc = params[:arc]
      character.save
      redirect "/"
    end

    delete "/:id" do
      id = params[:id].to_i
      Character.destroy(id)
      redirect "/"
    end

  end
