class NdcProduct < ApplicationRecord
  def self.search(search)
    where('proprietary_name LIKE ?', "%#{search}%")
  end
end
