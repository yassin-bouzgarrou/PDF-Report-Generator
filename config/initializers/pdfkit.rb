PDFKit.configure do |config|
  config.wkhtmltopdf = Gem.bin_path('wkhtmltopdf-binary', 'wkhtmltopdf')
  config.default_options = {
    page_size: 'A4',
    print_media_type: true,
    encoding: 'UTF-8',
    disable_smart_shrinking: false,
    zoom: 1
  }
end

# Register the middleware so PDFs can be served in browser
Rails.application.config.middleware.use PDFKit::Middleware
