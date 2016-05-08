require 'sequel'
require 'grape'
require 'cancancan'
require 'grape-rabl'
module V1
  class UserAPI < Grape::API
    prefix "api"
    version "v1", using: :path
    format :json
    formatter :json, Grape::Formatter::Rabl
    content_type :json, "application/json;charset=UTF-8"

    helpers do
      def authorize!(*args)
        ::Ability.new('Admin').authorize!(*args)
      end
    end
    resource :users do
      desc 'Get all user'
      get '/' do
        authorize! :index, :user_api
        {user_name: "Nguyen Anh"}
      end

      desc 'Create a user.'
      post '/' do
        authorize! :create, :user_api
        @user = User.create(name: 'Nguyen Anh')
        render rabl: 'users/index'
      end
    end
  end
end