class OrderStatus < ActiveRecord::Base
	has_many :orders

	def color_name
		case self.id
			when 1,5 then "<span class='label label-default'>#{self.name}</span>"
			when 2 then "<span class='label label-success'>#{self.name}</span>"
			when 3 then "<span class='label label-warning'>#{self.name}</span>"
			when 4 then "<span class='label label-danger'>#{self.name}</span>"			
		end
	end

  def get_query_params
    case self.id
      when 1, 5 then 'pending_orders'
      when 2 then 'paid_orders'
      when 3 then 'shipped_orders'
      when 4 then 'cancel_orders'
    end
  end	
  
end
