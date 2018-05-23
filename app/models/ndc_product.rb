class NdcProduct < ApplicationRecord
  def self.search(search)
    where('proprietary_name LIKE ? OR non_proprietary_name LIKE ?', "#{search}%", "#{search}%")
  end

  def self.find_drug(search)
    where('proprietary_name LIKE ? OR non_proprietary_name LIKE ?', "%#{search}%", "%#{search}%").select('DISTINCT(ndc_products.dosage_form_name)').order(:dosage_form_name)
  end

  def self.get_strength(search, dose_form)
    where('proprietary_name LIKE ? OR non_proprietary_name LIKE ?', "%#{search}%", "%#{search}%").where(dosage_form_name: dose_form).pluck(:active_numerator_strength, :active_ingred_unit).uniq
  end
end
