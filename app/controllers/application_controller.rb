class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
    render :text => <<-EO_INFO
      Ruby: #{RUBY_VERSION rescue 'n/a'}
      Rubygems: #{Gem::VERSION rescue 'n/a'}
      Bundler: #{Bundler::VERSION rescue 'n/a'}
      Passenger: #{PhusionPassenger::VERSION_STRING rescue 'n/a'}
      Database adapter: #{ActiveRecord::Base.connection.adapter_name}
    EO_INFO
  end
end
