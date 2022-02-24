class Import < ApplicationRecord

  def duration
    ((updated_at - created_at) / 1.minutes).round(2)
  end
end
