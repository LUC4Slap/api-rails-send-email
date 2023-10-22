class EmailMailer < ApplicationMailer
  default from: 'notifications@example.com'
  def send_mail(options)
    @from = options[:from]
    @subject = options[:subject]
    @body = options[:body] # Certifique-se de que options[:body] contenha o conteúdo do e-mail.
    @url = 'http://example.com/login'
    mail(to: options[:from], subject: options[:subject])
  end
end
