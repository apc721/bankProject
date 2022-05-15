# Preview all emails at http://localhost:3000/rails/mailers/banker_mailer
class BankerMailerPreview < ActionMailer::Preview
    def deposit_email
        BankerMailer.with(banker: banker).deposit_email
    end
end
