class ApplicationMailer < ActionMailer::Base
	default from: "運営局",
			bcc: "tanaka.taro@example.com"#非表示送信先
  	layout 'mailer'
end
