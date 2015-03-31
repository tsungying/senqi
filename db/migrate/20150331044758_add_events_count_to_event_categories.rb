class AddEventsCountToEventCategories < ActiveRecord::Migration
  def change
    add_column :event_categories, :events_count, :integer, :default => 0

    EventCategory.pluck(:id).each do |i|
      EventCategory.reset_counters(i, :events) # 全部重算一次
    end
    
  end
end
