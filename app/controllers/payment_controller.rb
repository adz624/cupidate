class PaymentController < ApplicationController
  skip_before_action :verify_authenticity_token

  def callback
    notification = ActiveMerchant::Billing::Integrations::Allpay::Notification.new(params)

    if notification.status && notification.checksum_ok?

      user_id, created_at = notification.merchant_trade_no.split('SPLIT')
      # 這裏是付款完成
      File.write("#{Rails.root}/log/payment.log", request.raw_post.inspect)
      File.write("#{Rails.root}/log/payment.log", notification.inspect)

      render text: '1|OK', status: 200
    else
      # 這裏是其他 (有人在 try, 付款失敗 ... etc)
    end
  end
end
