class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact_mail.subject
  #
  def contact_mail(user)
    @user = user
    @contacts = @user.contacts.order(updated_at: "DESC")#降順,昇順はASC(省略
    @contact = @contacts.first
     mail(to: @user.email,
      from: "NaganoRecord",
      subject: "お問い合わせありがとうございます。")
  end
  
  def create_mail(user)
    @user = user
    mail(to: @user.email,
      from: "NaganoRecord",
      subject: "お問い合わせありがとうございます。")
  end
end
#binding.pry
