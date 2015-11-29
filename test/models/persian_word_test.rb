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

require 'test_helper'

class PersianWordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
