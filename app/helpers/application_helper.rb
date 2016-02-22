module ApplicationHelper
  def response_count form
    pluralize form.responses.count, 'Response'
  end
end
