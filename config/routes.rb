Rails::Application.routes.draw do
  match "/stylesheets/:stylesheet.css" => 'sass_on_heroku_with_rack/stylesheets#show', :as => 'stylesheet'
end