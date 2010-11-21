class SassOnHerokuWithRack::StylesheetsController < ActionController::Metal
  include ActionController::Rendering

  def show
    response.headers['Cache-Control'] = "public, max-age=#{1.year.seconds.to_i}" if Rails.env.production?

    sass_options = {:syntax => :scss, :load_paths => ['app/stylesheets']}
    sass_options.merge!(:style => :compressed) unless Rails.env.development?
    filename = Rails.root.join('app', 'stylesheets', "#{params[:stylesheet]}.scss")
    render :text => Sass::Engine.new(File.open(filename, 'r').read, sass_options).render, :content_type => 'text/css'
  end
end
