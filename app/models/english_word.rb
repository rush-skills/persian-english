# == Schema Information
#
# Table name: english_words
#
#  id         :integer          not null, primary key
#  meaning    :string(255)
#  usage      :string(255)
#  additional :text(65535)
#  word       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class EnglishWord < ActiveRecord::Base
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
			field :additional
			field :updated_at
		end
		list do
			field :word
			field :meaning
			# field :usage
			field :updated_at
		end
		edit do
			field :word
			field :meaning do
				html_attributes do
			    {:class => "rtl form-control",
			    	maxlength: 255,
			    	size: 50}
			  end
			end
			field :usage do
				html_attributes do
			    {:class => "rtl form-control",
			    	maxlength: 255,
			    	size: 50}
			  end
			end
			field :additional, :froala do
				pretty_value do
					bindings[:object].additional.html_safe
				end
		    config_options do
		    	{
		        direction: 'rtl'
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
