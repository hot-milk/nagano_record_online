class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact_mail.subject
  #
  def contact_mail(user)
    @user = user
    # binding.pry
    mail(to: @user.email,
      from: "adtanaka.taro1111@gmail.com",
      subject: "お問い合わせありがとうございます。")
    # mail to: "adtanaka.taro1111@gmail.com",
    # 	 subject: "お問い合わせありがとうございます。"
  end
end
