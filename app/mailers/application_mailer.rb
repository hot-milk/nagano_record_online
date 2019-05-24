class ApplicationMailer < ActionMailer::Base
#多分死んでる
	default from: "運営局",
			bcc:      "tanaka.taro@example.com",#非表示送信先
          	reply_to: "tanaka.taro@example.com"
  	layout 'mailer'
end
