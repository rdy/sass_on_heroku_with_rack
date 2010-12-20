class SassOnHerokuWithRack::StylesheetsController < ActionController::Metal
  include ActionController::Rendering

  def show
    response.headers['Cache-Control'] = "public, max-age=#{1.hour.seconds.to_i}" if Rails.env.production?

    sass_options = Sass::Plugin.options
    sass_options.merge! :style => :compressed unless Rails.env.development?
    extension = sass_options[:syntax] == :scss ? 'scss' : 'sass'
    filename = Rails.root.join('app', 'stylesheets', "#{params[:stylesheet]}.#{extension}")
    render :text => Sass::Engine.new(File.read(filename), sass_options).render, :content_type => 'text/css'
  end
end
