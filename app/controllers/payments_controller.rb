class PaymentsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  include PaymentHelper

  def index
    @group = Group.includes(:payments).find(params[:group_id])
    @payments = @group.payments.order(created_at: :desc)
  end

  def new
    @groups = current_user.groups
  end

  def create
    @payment = current_user.payments.new(payment_params)
    if groups_payment_params && @payment.save
      groups_payments_generator(groups_payment_params[:group_ids])
      flash[:notice] = 'Your new transaction has been created'
      redirect_to :group_payments
    else
      flash[:alert] = 'We failed to create your transaction, make sure you filled all fields'
      redirect_to [:new_group_payment]
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:name, :amount)
  end

  def groups_payment_params
    return false unless params[:groups_payment]

    params.require(:groups_payment).permit(group_ids: [])
  end
end
