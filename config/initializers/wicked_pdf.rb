# config/initializers/wicked_pdf.rb
WickedPdf.config ||= {}
WickedPdf.config.merge!({
  exe_path: `which wkhtmltopdf`.chomp
})
