require 'valid_email'

class Subscription < ActiveRecord::Base
  validates :name, :email, :cpf, :birthday, :corporation, :message,
    presence: true
  validates :email, email: true, if: :email_changed?
  validates :cpf, cpf: true, if: :cpf_changed?
end
