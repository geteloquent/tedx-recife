class Contact < MailForm::Base
  #append :remote_ip, :user_agent, :session

  attribute :name,      validate: true
  attribute :email,     validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message,   validate: true

  def headers
    {
      :subject => "Alguém interessado no TEDx quer falar conosco :)",
      :to => "julianalucenaa@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end
