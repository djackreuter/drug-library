class NdcProduct < ApplicationRecord
  def self.search(search)
    where('proprietary_name LIKE ? OR non_proprietary_name LIKE ?', "#{search}%", "#{search}%")
  end

  def self.search_name(search)
    where('proprietary_name LIKE ? OR non_proprietary_name LIKE ?', "#{search}%", "#{search}%").select('DISTINCT(ndc_products.proprietary_name)').order(:proprietary_name)
  end

  def self.find_drug(name)
    where('proprietary_name LIKE ? OR non_proprietary_name LIKE ?', "%#{name}%", "%#{name}%").select('DISTINCT(ndc_products.dosage_form_name)').order(:dosage_form_name)  
  end

  def self.get_strength(search, dose_form)
    where('proprietary_name LIKE ? OR non_proprietary_name LIKE ?', "%#{search}%", "%#{search}%").where(dosage_form_name: dose_form).pluck(:active_numerator_strength, :active_ingred_unit).uniq
  end

  def self.get_drug_info(name)
    drugs = where('proprietary_name LIKE ? OR non_proprietary_name LIKE ?', "%#{name}%","%#{name}%")
    ::DrugInfo.format_results(name, drugs)
  end

  def self.get_ndc_num(name, dose_form, strength)
    where('proprietary_name LIKE ? OR non_proprietary_name LIKE ?', "%#{name}%","%#{name}%").where(dosage_form_name: dose_form).where(active_numerator_strength: strength).map(&:product_ndc).first
  end
end
