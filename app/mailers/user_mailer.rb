class UserMailer < ApplicationMailer
    default from: 'notifications@example.com'

    def welcome_email(user)
        @user = user
        @url  = 'http://example.com/login'
        mail(to: @user.email, subject: 'Bem-vindo ao nosso site')
    end

    def send_mail(email)
        @email = email
        @url = 'http://example.com/login'
        mail(to: email.from, subject: email.subject)
    end
end
