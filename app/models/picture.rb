class Picture < ApplicationRecord

  def self.newest_first
    Picture.order( created_at: :DESC )
  end

  def self.most_recent_five
    Picture.newest_first.limit(5)
  end

  def self.created_before(time)
    Picture.where("created_at < ?", time)
  end

  def self.created_in_year(year_entered)
    from_begining = Date.new(year_entered)
    to_end = from_begining + 1.year - 1.day
    Picture.where(created_at: from_begining..to_end)
  end
end
