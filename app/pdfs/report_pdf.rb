
class ReportPdf
  def initialize(report)
    @report = report
  end

  def render
    pdf_html = ApplicationController.new.render_to_string(
      template: 'reports/pdf',
      locals: { report: @report }
    )

    WickedPdf.new.pdf_from_string(pdf_html)
  end
end
