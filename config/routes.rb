Rails.application.routes.draw do
  # Root route (defaults to the 'show' action)
  root "reports#show"

  # Explicit route for viewing the report (optional, but fine if you want to use "/report")
  get "/report", to: "reports#show"

  # Resource route for reports, including a member route for exporting as PDF
  resources :reports, only: [:show] do
    member do
      get 'export_pdf'  # This defines the route to export the report as PDF
    end
  end
end
