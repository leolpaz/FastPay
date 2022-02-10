module PaymentHelper
  def groups_payments_generator(arr)
    arr.each do |id|
      @payment.groups_payments.create(group_id: id)
    end
  end

  def group_payments_sum(arr)
    sum = 0
    arr.each do |el|
      sum += el.amount.to_f
    end
    sum
  end
end
