class UserMailer < ApplicationMailer
  def comment_mailer
    @blog = params[:blog]
    @entry = params[:entry]
    @comment = params[:comment]
    mail(to: "example@sample.com", subject: "新しいコメントが投稿されました。")
  end
end
