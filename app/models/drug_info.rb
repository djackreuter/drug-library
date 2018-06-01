class DrugInfo
  attr_accessor :drug_name, :dose_form

  def self.format_results(name, drugs)
    d           = DrugInfo.new
    d.drug_name = name
    d.dose_form = drugs.uniq(&:dosage_form_name).map(&:dosage_form_name)
    d
  end
end