class ApplicationMailer < ActionMailer::Base
#多分死んでる
	default from: "運営局",
			bcc:      "adtanaka.taro1111@gmail.com",#非表示送信先
          	reply_to: "adtanaka.taro1111@gmail.com"
  	layout 'mailer'
end
