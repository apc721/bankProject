class BankerMailer < ApplicationMailer
  default from: 'apcarey721@gmail.com'
  def deposit_email
    banker = params[:banker]
    mail(to: email_address_with_name('apcarey721@gmail.com', banker), subject: 'Your Bank Deposit')
  end
  def withdraw_email
    banker = params[:banker]
    mail(to: email_address_with_name('apcarey721@gmail.com', banker), subject: 'Your Bank Withdrawal')
  end
end
