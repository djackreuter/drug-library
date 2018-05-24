class NdcProduct < ApplicationRecord
  def self.search(search)
    where('proprietary_name LIKE ? OR non_proprietary_name LIKE ?', "#{search}%", "#{search}%")
  end

  def self.find_drug(product_id)
    where('product_id=?', "#{product_id}")
  end

  def self.get_strength(search, dose_form)
    where('proprietary_name LIKE ? OR non_proprietary_name LIKE ?', "%#{search}%", "%#{search}%").where(dosage_form_name: dose_form).pluck(:active_numerator_strength, :active_ingred_unit).uniq
  end
end
