# frozen_string_literal: true

class CarrierStringIO < StringIO
  def original_filename
    'invoice.pdf'
  end

  def content_type
    'application/pdf'
  end
end
