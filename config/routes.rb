Rails.application.routes.draw do
  # Root route 
  root "reports#show"

  # Explicit route for viewing the report \\
  get "/report", to: "reports#show"

  # Resource route for reports, including a member route for exporting as PDF
  resources :reports, only: [:show] do
    member do
      get 'export_pdf'  
    end
  end
end
