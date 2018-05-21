class NdcProduct < ApplicationRecord
  def self.search(search)
    where('proprietary_name LIKE ? OR non_proprietary_name LIKE ?', "%#{search}%", "%#{search}%").select('DISTINCT(ndc_products.proprietary_name)').order(:proprietary_name)
  end

  def self.find_drug(search)
    where('proprietary_name LIKE ? OR non_proprietary_name LIKE ?', "%#{search}%", "%#{search}%").select('DISTINCT(ndc_products.dosage_form_name)').order(:dosage_form_name)
  end
end
