class NdcProduct < ApplicationRecord
  def self.search(search)
    where('proprietary_name LIKE ?', "%#{search}%").select('DISTINCT(ndc_products.proprietary_name)').order(:proprietary_name)
  end
end
