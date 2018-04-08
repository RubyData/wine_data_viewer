Rails.application.routes.draw do
  root to: 'wine_observations#index'

  resource :pair_plot, controller: 'pair_plot'
end
