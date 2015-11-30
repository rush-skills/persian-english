# == Schema Information
#
# Table name: persian_words
#
#  id         :integer          not null, primary key
#  meaning    :string(255)
#  usage      :string(255)
#  additional :text(65535)
#  word       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PersianWord < ActiveRecord::Base
	has_paper_trail

	validates_presence_of :word, :meaning

	def self.search(search)
	  if search
	    where('word LIKE ?', "%#{search}%")
	  else
	    all
	  end
	end

	rails_admin do
		show do
			field :word
			field :meaning
			field :usage
			field :additional do
				pretty_value do
					bindings[:object].additional.html_safe
				end
			end
			field :updated_at
		end
		list do
			field :word
			field :meaning
			field :usage
			field :updated_at
		end
		edit do
			field :word do
				html_attributes do
			    {:class => "rtl form-control",
			    	maxlength: 255,
			    	size: 50}
			  end
			end
			field :meaning
			field :usage
			field :additional, :froala do
		    config_options do
		      {
		      }
		    end
		  end
		end
	end

	def to_s
		self.word
	end

	def name
		self.word
	end
end
