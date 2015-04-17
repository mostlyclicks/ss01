Refinery::PagesController.class_eval do
  before_filter :build_inquiry

  def build_inquiry
    @inquiry = Refinery::Inquiries::Inquiry.new
  end
end