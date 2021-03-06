# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string(255)
#  role                   :integer
#

class User < ActiveRecord::Base
	has_paper_trail
  enum role: [:editor, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    if User.count == 0
      self.role ||= :admin
    else
      self.role ||= :editor
    end
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,# :registerable,
         # :recoverable,
         :rememberable,
          :trackable, :validatable

  rails_admin do
    show do
      field :name
      field :role
      field :email
      field :last_sign_in_ip
      field :last_sign_in_at
    end
    list do
      field :name
      field :role
      field :email
    end
    edit do
      field :name
      field :role
      field :email
      field :password
      field :password_confirmation
    end
  end
end
